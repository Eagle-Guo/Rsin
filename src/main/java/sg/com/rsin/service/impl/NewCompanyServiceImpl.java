package sg.com.rsin.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.MessagingException;

import org.apache.commons.lang3.ObjectUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import freemarker.template.TemplateException;
import sg.com.rsin.dao.CompanyInfoRepository;
import sg.com.rsin.dao.CompanyOTHAccessRepository;
import sg.com.rsin.dao.CompanyServiceRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.NewCompanyRepository;
import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.entity.CompanyInfo;
import sg.com.rsin.entity.CompanyOTHAccess;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Mail;
import sg.com.rsin.entity.NewCompany;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.entity.UserRole;
import sg.com.rsin.enums.NewCompanyInfoEnum;
import sg.com.rsin.restController.NewCompanyController;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.util.CommonUtils;

@Service
@PropertySource("classpath:global.properties")
@ConfigurationProperties
public class NewCompanyServiceImpl implements NewCompanyService {

	private static final Logger logger = LoggerFactory.getLogger(NewCompanyController.class);
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	NewCompanyRepository newCompanyRepository;
	@Autowired
	CompanyInfoRepository companyInfoRepository;
	@Autowired
	CompanyServiceRepository companyServiceRepository;
	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;
	@Autowired
	CompanyOTHAccessRepository companyOTHAccessRepository;
	@Autowired
	UserRegistrationRepository userRegistrationRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Value("${rsin.application.domain}")
	private String mainDomain;
	@Value("${new.company.confirm.url}")
	private String newCompanyConfirmUrl;
	@Value("${new.company.auth.link.expire.day}")
	private int authLinkExpireDay;
	@Value("${new.company.default.password}")
	private String defaultPassword;

	// json handling tool
	private ObjectMapper mapper = new ObjectMapper();
	
	public void addNewCompany (String receivedData) {
		String result = "";
		List<CompanyService> companyServices = new ArrayList<CompanyService>();
		List<CompanyInfo> companyInfos = new ArrayList<CompanyInfo>();
		List<CompanyShareholderInfo> companyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
    	try {
    		result = URLDecoder.decode(receivedData, StandardCharsets.UTF_8.toString());
    		logger.info("Recevied new company:[" + result + "]");
    		String[] allcompanysinfo = result.split("\\&");
    		for (String dataInfo: allcompanysinfo) {
    			String[] data = dataInfo.split("=");
    			if (NewCompanyInfoEnum.SERVICES.getDescription().equals(data[0])) {
    				companyServices = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyService.class));
    			} else if (NewCompanyInfoEnum.COMPANYINFOS.getDescription().equals(data[0])) {
    				companyInfos = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyInfo.class));
    			} else if (NewCompanyInfoEnum.SHAREHOLDERINFOS.getDescription().equals(data[0])) {
    				companyShareholderInfos = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyShareholderInfo.class));
    			}
    		}
    	} catch (UnsupportedEncodingException e) {
    		logger.error("Get error to decode the new company data ");
    	} catch (JsonMappingException e) {
    		logger.error("Get error to parse new company data to json ");
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("Get error to parse new company data to json ");
			e.printStackTrace();
		};
		
		//Save to DB
		NewCompany newCompany = new NewCompany();
		newCompany.setStatus("new");
		newCompany.setCreatedDate(new Date());
		newCompanyRepository.save(newCompany);
    	
		for (CompanyService companyService : companyServices) {
			companyService.setNewCompany(newCompany);
			companyServiceRepository.save(companyService);
		}
		for (CompanyInfo companyInfo : companyInfos) {
			companyInfo.setNewCompany(newCompany);
			companyInfoRepository.save(companyInfo);
		}
		for (CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			companyShareholderInfo.setNewCompany(newCompany);
			companyShareholderInfoRepository.save(companyShareholderInfo);
		}
		
		List<CompanyShareholderInfo> allShareholderName = companyShareholderInfos.stream()
				.filter(shareholder -> shareholder.getName().equals("全名")).collect(Collectors.toList());
		for (CompanyShareholderInfo shareholderName: allShareholderName) {
			sendEmailToShareHolder(newCompany, shareholderName);
		}
		
		List<CompanyShareholderInfo> allShareholderEmail = companyShareholderInfos.stream()
				.filter(shareholder -> shareholder.getName().equals("电子邮箱")).collect(Collectors.toList());
		//List<String> allShareholderEmailOnly = companyShareholderInfos.stream()
		//		.filter(shareholder -> shareholder.getName().equals("电子邮箱")).map(email -> email.getDescription()).collect(Collectors.toList());
		for (CompanyShareholderInfo shareholderEmail: allShareholderEmail) {
			// check if need to create the new account to user
			List<UserRegistration> emails =  userRegistrationRepository.findByEmail(shareholderEmail.getDescription());
			// create the default account to new email user
			if (ObjectUtils.isEmpty(emails)) {
				//TODO create new user into users table and user_role table
				UserRegistration userRegistration = new UserRegistration();
				userRegistration.setUsername(shareholderEmail.getDescription());
				userRegistration.setEmail(shareholderEmail.getDescription());
				
				userRegistration.setPassword(bCryptPasswordEncoder.encode(defaultPassword));
				userRegistrationRepository.save(userRegistration);
				
				UserRole userRole = new UserRole();
				userRole.setRoleId(roleId);
				userRole.setUserId(userId);
			}
		}
	}
	private void sendEmailToShareHolder(NewCompany newCompany, CompanyShareholderInfo companyShareholderInfo) {
		//Send email to ShareHolder and Director
		//1. Get the access link
		String password = CommonUtils.getHashValue("" + newCompany.getId() + newCompany.getStatus() + 
				newCompany.getCreatedDate() + companyShareholderInfo.getDescription());
		String URL = mainDomain + newCompanyConfirmUrl + "id=" + newCompany.getId() + "&token=" + password;
		
		LocalDateTime linkExpireDateTime = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().plusDays(authLinkExpireDay);

        CompanyOTHAccess companyOTHAccess = new CompanyOTHAccess();
		companyOTHAccess.setNewCompany(newCompany);
		companyOTHAccess.setOrgPassword(password);
		companyOTHAccess.setPWStartDate(new Date());
		companyOTHAccess.setPWEndDate(Date.from(linkExpireDateTime.atZone(ZoneId.systemDefault()).toInstant()));
		companyOTHAccess.setCompanyShareholderInfo(companyShareholderInfo);
		
		companyOTHAccessRepository.save(companyOTHAccess);
		
		Mail mail = new Mail();
        mail.setTo("yuzhiqwe@gmail.com");
        mail.setSubject("创建新公司 确认邮件");
        
        Map<String, String> model = new HashMap<String, String>();
        model.put("name", companyShareholderInfo.getDescription());
        model.put("completedLink", URL);
        model.put("signature", "睿信集团");
        mail.setModel(model);
        
        try {
			emailService.sendSimpleMessage(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
}
