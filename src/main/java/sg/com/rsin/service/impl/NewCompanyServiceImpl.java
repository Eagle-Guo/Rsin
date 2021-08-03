package sg.com.rsin.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

import sg.com.rsin.dao.CompanyOTHAccessRepository;
import sg.com.rsin.dao.CompanyServiceRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.dao.InitiateDocumentRepository;
import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.RoleRepository;
import sg.com.rsin.dao.TimelineDetailRepository;
import sg.com.rsin.dao.TimelineRepository;
import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.entity.CompanyOTHAccess;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.entity.Mail;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Role;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.enums.NewCompanyInfoEnum;
import sg.com.rsin.enums.TimeLineType;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.util.CommonUtils;
import sg.com.rsin.vo.CompanyInfoVO;
import sg.com.rsin.vo.CompanyServiceVO;

@Service
@PropertySource("classpath:global.properties")
@ConfigurationProperties
public class NewCompanyServiceImpl implements NewCompanyService {

	private static final Logger logger = LoggerFactory.getLogger(NewCompanyServiceImpl.class);
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	CompanyRepository companyRepository;
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
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private DocumentRepository documentRepository;
	@Autowired
	private CompanyStatusTimeRepository companyStatusTimeRepository;
	@Autowired
	private InitiateDocumentRepository initiateDocumentRepository;
	@Autowired
	private DocumentTypeRepository documentTypeRepository;
	@Autowired
	private TimelineRepository timelineRepository;
	@Autowired
	private TimelineDetailRepository timelineDetailRepository;
	
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
	
	public long addCompany(String receivedData) {
		String result = "";
		Date currentDate = new Date();
		List<CompanyServiceVO> companyServiceVOs = new ArrayList<CompanyServiceVO>();
		List<CompanyInfoVO> companyInfoVOs = new ArrayList<CompanyInfoVO>();
		List<CompanyInfoVO> companyShareholderInfoVOs = new ArrayList<CompanyInfoVO>();
    	try {
    		result = URLDecoder.decode(receivedData, StandardCharsets.UTF_8.toString());
    		logger.info("Recevied new company:[" + result + "]");
    		String[] allcompanysinfo = result.split("\\&");
    		for (String dataInfo: allcompanysinfo) {
    			String[] data = dataInfo.split("=");
    			if (NewCompanyInfoEnum.SERVICES.getDescription().equals(data[0])) {
    				companyServiceVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyServiceVO.class));
    			} else if (NewCompanyInfoEnum.COMPANYINFOS.getDescription().equals(data[0])) {
    				companyInfoVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyInfoVO.class));
    			} else if (NewCompanyInfoEnum.SHAREHOLDERINFOS.getDescription().equals(data[0])) {
    				companyShareholderInfoVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyInfoVO.class));
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
		} catch (Exception e) {
			logger.error("Get error to parse new company data to json ");
			e.printStackTrace();
		}
    	
		//Check the company name is exited to avoid double submit. If not existed then save to DB
		Company company = CommonUtils.phaseNewCompany(companyInfoVOs);
		
		Company existedCompany = companyRepository.findByName(company.getName());
		if (existedCompany != null) {
			logger.info("Company " + existedCompany.getName() + " is existed!");
			return -1;
		}
		company.setStep("2"); //Complete the first 2 steps: 选择服务 and 信息填报
		company.setCreatedDate(currentDate);
		company.setLockFlag(true);
		company.setTimelineLockFlag(true);
		companyRepository.save(company);

		//Save to company_service
		CompanyService companyService = CommonUtils.phaseNewCompanyService(companyServiceVOs);
		companyService.setCompany(company);
		companyServiceRepository.save(companyService);
		
		//Save to company_shareholderinfo
		List<CompanyShareholderInfo> companyShareholderInfos = CommonUtils.phaseNewCompanyShareholderInfo(companyShareholderInfoVOs);
		for (CompanyShareholderInfo companyShareholderInfo: companyShareholderInfos) {
			companyShareholderInfo.setCompany(company);
			companyShareholderInfoRepository.save(companyShareholderInfo);
		}
		
		//Save the new company status time
		CompanyStatusTime companyStatusTime = new CompanyStatusTime();
		companyStatusTime.setCompany(company);
		companyStatusTime.setServices(currentDate);
		companyStatusTime.setInformation(currentDate);
		companyStatusTimeRepository.save(companyStatusTime);

		//Save to to user table for user to login
		for (CompanyShareholderInfo shareholderEmail: companyShareholderInfos) {
			// check if need to create the new account to user
			List<UserRegistration> userRecord =  userRegistrationRepository.findByEmail(shareholderEmail.getEmail());
			// create the default account to new email user
			if (ObjectUtils.isEmpty(userRecord)) {
				Set<Role> role = roleRepository.findByName("ROLE_USER");
				UserRegistration userRegistration = new UserRegistration();
				userRegistration.setUsername(shareholderEmail.getEmail()); //need to use this name to login
				userRegistration.setFirstName(shareholderEmail.getName());
				userRegistration.setEmail(shareholderEmail.getEmail());
				userRegistration.setPassword(bCryptPasswordEncoder.encode(defaultPassword));
				userRegistration.setGender(shareholderEmail.getGender());
				userRegistration.setRoles(role);
				userRegistrationRepository.save(userRegistration);
			}
		}
		
		List<DocumentType> documentTypes = documentTypeRepository.findAll();
		
		List<Document> defaultDoc = new ArrayList<Document> ();
		initiateDocumentRepository.findAll().stream().forEach(init -> {
			Document doc = new Document();
			DocumentType type = documentTypes.parallelStream().filter( type1 -> type1.getDocumentTypeCode().equals(init.getDocumentType().getDocumentTypeCode()) ).findFirst().get();
			doc.setDocumentType(init.getDocumentType());
			doc.setCategory(init.getCategory());
			doc.setDisplaySequence(init.getDisplaySequence());
			doc.setDocumentDesc(type.getDocumentTypeDesc());
			doc.setDocumentDesccn(type.getDocumentTypeDescCn());
			//doc.setUserId("App_Initial");
			doc.setCompany(company);
			doc.setCreatedBy("App_Initial");
			doc.setCreatedDate(currentDate);
			doc.setLockFlag(false);
			defaultDoc.add(doc);			
		});
		documentRepository.saveAll(defaultDoc);
		
		//Save the timeline and timeline detail
		//TODO Add default timelines into table
		//TODO Create the initial timeline table to intial the timeline for new company
		Stream.of(TimeLineType.values())
        .forEach(timeLineType-> {
        	Timeline timeline = new Timeline();
    		timeline.setService(timeLineType.getDescription());
    		timeline.setRegistrationDate(company.getRegistrationDate());
    		timeline.setPeriod(12);
    		timeline.setTimes(2);
    		timeline.setStartDate(currentDate);
        	timeline.setCompany(company);;
        	timelineRepository.save(timeline);
        	
        	if (!timeLineType.name().equals("TYPE_3")) {
        		Calendar calendar = Calendar.getInstance();
            	calendar.setTime(currentDate);
            	for (int i=0; i<2; i++) {
            		TimelineDetail timelineDetail = new TimelineDetail();
            		calendar.add(Calendar.YEAR, i);
            		timelineDetail.setEstimateDate(calendar.getTime());
            		timelineDetail.setTimeline(timeline);
                	timelineDetailRepository.save(timelineDetail);
            	}
        	}
        });

		// Send the email to shareholder
		for (CompanyShareholderInfo shareholder: companyShareholderInfos) {
			try {
				List<UserRegistration> userRecord =  userRegistrationRepository.findByEmail(shareholder.getEmail());
				if (ObjectUtils.isEmpty(userRecord)) {
					sendEmailToShareHolderWithAccount(company, shareholder);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return company.getId();
	}
	
	/**
	 * Add company without create the user account for login
	 */
	public long addCompanyWithoutAccount(String receivedData) {
		String result = "";
		Date currentDate = new Date();
		List<CompanyServiceVO> companyServiceVOs = new ArrayList<CompanyServiceVO>();
		List<CompanyInfoVO> companyInfoVOs = new ArrayList<CompanyInfoVO>();
		List<CompanyInfoVO> companyShareholderInfoVOs = new ArrayList<CompanyInfoVO>();
    	try {
    		result = URLDecoder.decode(receivedData, StandardCharsets.UTF_8.toString());
    		logger.info("Recevied new company:[" + result + "]");
    		String[] allcompanysinfo = result.split("\\&");
    		for (String dataInfo: allcompanysinfo) {
    			String[] data = dataInfo.split("=");
    			if (NewCompanyInfoEnum.SERVICES.getDescription().equals(data[0])) {
    				companyServiceVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyServiceVO.class));
    			} else if (NewCompanyInfoEnum.COMPANYINFOS.getDescription().equals(data[0])) {
    				companyInfoVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyInfoVO.class));
    			} else if (NewCompanyInfoEnum.SHAREHOLDERINFOS.getDescription().equals(data[0])) {
    				companyShareholderInfoVOs = mapper.readValue(data[1], mapper.getTypeFactory().constructCollectionType(List.class, CompanyInfoVO.class));
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
		} catch (Exception e) {
			logger.error("Get error to parse new company data to json ");
			e.printStackTrace();
		}
    	
		//Check the company name is exited to avoid double submit. If not existed then save to DB
		Company company = CommonUtils.phaseNewCompany(companyInfoVOs);
		
		// Save the company info But may need to check the UEM as well if existed
		Company existedCompany = companyRepository.findByName(company.getName());
		if (existedCompany != null) {
			logger.info("Company " + existedCompany.getName() + " is existed!");
			return -1;
		}
		company.setStep("2"); //Complete the first 2 steps: 选择服务 and 信息填报
		company.setCreatedDate(currentDate);
		companyRepository.save(company);

		//Save the company service
		CompanyService companyService = CommonUtils.phaseNewCompanyService(companyServiceVOs);
		companyService.setCompany(company);
		companyServiceRepository.save(companyService);
		
		//Save the company shareholderinfo
		List<CompanyShareholderInfo> companyShareholderInfos = CommonUtils.phaseNewCompanyShareholderInfo(companyShareholderInfoVOs);
		for (CompanyShareholderInfo companyShareholderInfo: companyShareholderInfos) {
			companyShareholderInfo.setStatus(true);
			companyShareholderInfo.setCompany(company);
			companyShareholderInfoRepository.save(companyShareholderInfo);
		}
		
		//Save the new company status time
		CompanyStatusTime companyStatusTime = new CompanyStatusTime();
		companyStatusTime.setCompany(company);
		companyStatusTime.setServices(currentDate);
		companyStatusTime.setInformation(currentDate);
		companyStatusTimeRepository.save(companyStatusTime);

		//Save the documents
		List<DocumentType> documentTypes = documentTypeRepository.findAll();
		List<Document> defaultDoc = new ArrayList<Document> ();
		initiateDocumentRepository.findAll().stream().forEach(init -> {
			Document doc = new Document();
			DocumentType type = documentTypes.parallelStream().filter( type1 -> type1.getDocumentTypeCode().equals(init.getDocumentType().getDocumentTypeCode()) ).findFirst().get();
			doc.setDocumentType(init.getDocumentType());
			doc.setCategory(init.getCategory());
			doc.setDisplaySequence(init.getDisplaySequence());
			doc.setDocumentDesc(type.getDocumentTypeDesc());
			doc.setDocumentDesccn(type.getDocumentTypeDescCn());
			//doc.setUserId("App_Initial");
			doc.setCompany(company);
			doc.setCreatedBy("App_Initial");
			doc.setCreatedDate(currentDate);
			doc.setLockFlag(false);
			defaultDoc.add(doc);			
		});
		documentRepository.saveAll(defaultDoc);
		
		//Save the timeline and timeline detail
		//TODO Add default timelines into table
		//TODO Create the initial timeline table to intial the timeline for new company
		Stream.of(TimeLineType.values())
        .forEach(timeLineType-> {
        	Timeline timeline = new Timeline();
    		timeline.setService(timeLineType.getDescription());
    		timeline.setRegistrationDate(company.getRegistrationDate());
    		timeline.setPeriod(12);
    		timeline.setTimes(2);
    		timeline.setStartDate(currentDate);
        	timeline.setCompany(company);;
        	timelineRepository.save(timeline);
        	
        	if (!timeLineType.name().equals("TYPE_3")) {
        		Calendar calendar = Calendar.getInstance();
            	calendar.setTime(currentDate);
            	for (int i=0; i<2; i++) {
            		TimelineDetail timelineDetail = new TimelineDetail();
            		calendar.add(Calendar.YEAR, i);
            		timelineDetail.setEstimateDate(calendar.getTime());
            		timelineDetail.setTimeline(timeline);
                	timelineDetailRepository.save(timelineDetail);
            	}
        	}
        });
				
		// Send the email to shareholder
		for (CompanyShareholderInfo shareholder: companyShareholderInfos) {
			try {
				sendEmailToShareHolder(company, shareholder);
			} catch (MessagingException e) {
				e.printStackTrace();
				logger.error("Sending email with error: " + e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				logger.error("Sending email with error: " + e.getMessage());
			}
		}
		return company.getId();
	}
	
	private void sendEmailToShareHolder(Company company, CompanyShareholderInfo companyShareholderInfo) throws MessagingException, IOException {
		Mail mail = new Mail();
        mail.setTo("yuzhiqwe@gmail.com");
        mail.setSubject("创建新公司 确认邮件");
        
        Map<String, String> model = new HashMap<String, String>();
        model.put("name", companyShareholderInfo.getName());
        model.put("completedLink", "");
        model.put("signature", "睿信集团");
        mail.setModel(model);
        logger.info("Prepare to send email....with URL");
        emailService.sendEmail(mail);
        
	}

	private void sendEmailToShareHolderWithAccount(Company company, CompanyShareholderInfo companyShareholderInfo) throws MessagingException, IOException {
		//Send email to ShareHolder and Director
		//1. Get the access link
		//String password = CommonUtils.getHashValue("" + company.getId() + company.getStatus() + company.getCreatedDate() + companyShareholderInfo.getDescription());
		String password = CommonUtils.getHashValue("" + company.getId() + company.getStep() + company.getCreatedDate() + companyShareholderInfo.getName());
		String URL = mainDomain + newCompanyConfirmUrl + "id=" + company.getId() + "&token=" + password;
		
		LocalDateTime linkExpireDateTime = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().plusDays(authLinkExpireDay);

        CompanyOTHAccess companyOTHAccess = new CompanyOTHAccess();
		companyOTHAccess.setNewCompany(company);
		companyOTHAccess.setOrgPassword(password);
		companyOTHAccess.setPWStartDate(new Date());
		companyOTHAccess.setPWEndDate(Date.from(linkExpireDateTime.atZone(ZoneId.systemDefault()).toInstant()));
		companyOTHAccess.setCompanyShareholderInfo(companyShareholderInfo);
		
		companyOTHAccessRepository.save(companyOTHAccess);
		
		Mail mail = new Mail();
        mail.setTo("yuzhiqwe@gmail.com");
        mail.setSubject("创建新公司 确认邮件");
        
        Map<String, String> model = new HashMap<String, String>();
        model.put("name", companyShareholderInfo.getName());
        model.put("completedLink", URL);
        model.put("signature", "睿信集团");
        mail.setModel(model);
        logger.info("Prepare to send email....with URL" + URL);
        emailService.sendEmail(mail);
        
	}
	
	public Company findCompany (long companyId) {
		return companyRepository.findById(companyId).orElse(null);
	}
	
	public void saveCompany (Company company) {
		companyRepository.save(company);
	}
	
	public Map<String, List<String>> getShareholderSignatureStatus(Long companyId) {
		Map<String, List<String>> signedFiles = new HashMap<String,List<String>>();
		//1. Get all the company shareholders and directors
		List<CompanyShareholderInfo> shareholders = companyShareholderInfoRepository.findByCompanyId(companyId);
		if (shareholders.size()==0) 
			return signedFiles;
		//2. check the file have signed
		shareholders.stream().forEach(shareholder -> {
			List<Document> documents = documentRepository.findByUserIdAndCompany(shareholder.getEmail(), companyId);
			List<String> docTypes = documents.stream().map(doc -> doc.getDocumentType().getDocumentTypeCode()).collect(Collectors.toList());
			signedFiles.put(shareholder.getName(), docTypes);
		});
		return signedFiles;
	}

	public String listSignedUserName(Map<String, List<String>> signedDocs, String documentType) {
		StringBuilder sb = new StringBuilder();
		if (signedDocs.size() == 0) 
			return sb.toString();
		signedDocs.forEach((k, value) -> {
			if (value.contains(documentType)) {
				sb.append(", " + k + "(已签名)");
			} else {
				sb.append(", " + k + "(待签名)");
			}
		});
		return sb.toString().substring(2);
	}
}
