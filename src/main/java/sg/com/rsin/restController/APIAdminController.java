package sg.com.rsin.restController;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Industry;
import sg.com.rsin.service.AdminManageCompanyService;
import sg.com.rsin.service.AdminTimelineService;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.GenerateJespterReportService;
import sg.com.rsin.service.IndustryService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.service.ShareholderInfoService;
import sg.com.rsin.service.UploadFileService;
import sg.com.rsin.util.CommonUtils;
import sg.com.rsin.vo.CompanyDto;
import sg.com.rsin.vo.CompanyShareholderDto;

@RestController
@RequestMapping(value = "/api/admin")
public class APIAdminController {

	private final Logger logger = LoggerFactory.getLogger(APIAdminController.class);

	//Save the uploaded file to this folder
	@Value("${file.main.path}")
	private String uploadFilePathRoot;
    
	@Autowired
	EmailService emailService;
	@Autowired
	IndustryService industryService;
	@Autowired
	UploadFileService uploadFileService;
	@Autowired
	CommonDataService commonDataService;
	
	@Autowired
	NewCompanyService newCompanyService;
	@Autowired
	ShareholderInfoService shareholderInfoService;
	
	@Autowired
	AdminTimelineService adminTimelineService;
	@Autowired
	AdminManageCompanyService adminManageCompanyService;
	
	@Autowired
	CompanyRepository companyRepository;
	
	@Autowired
	GenerateJespterReportService generateJespterReportService;
	
    @GetMapping("/employees")
    public String  all() {
        return "This information from API controller";
    }

    // Company
    @PostMapping("/newcompany/sendemail")
    public String newCompanySendEmail(@RequestBody String data) {
        String response = "Your request Data is : " + data;
        return response;
    }

    /**
     * New company without payment function
     * @param receivedData
     * @param request
     * @return
     */
    @PostMapping("/newCompany")
    public ResponseEntity<String> newCompany(@RequestBody String receivedData, HttpServletRequest request) {
		logger.info("new Company info" + receivedData);

		long companyId = newCompanyService.addCompanyWithoutAccount(receivedData);
		if (companyId < 1) {
			return new ResponseEntity<>("Company existed", HttpStatus.CONFLICT);
		}
		request.setAttribute("companyId", companyId);
		return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @GetMapping(path="/allPendingCompanies", produces=MediaType.APPLICATION_JSON_VALUE)
    public Set<CompanyDto> allPendingCompanies() {
    	return commonDataService.getAllPendingCompanies();
    }

    /**
     * 
     * @return
     */
    @GetMapping(path="/allShareholders", produces=MediaType.APPLICATION_JSON_VALUE)
    public Set<CompanyShareholderDto> allShareholders() {
    	return commonDataService.getAllShareholders();
    }
    
    @GetMapping(path="/allCompanies", produces=MediaType.APPLICATION_JSON_VALUE)
    public Set<CompanyDto> allCompanies() {
    	return commonDataService.getAllCompanies();
    }

    @RequestMapping(value = "/export/allCompanies", method = RequestMethod.GET)
	public void getFile(HttpServletRequest request, HttpServletResponse response) {
		try {
			InputStream is = adminManageCompanyService.exportCompanies();
		    org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
		    response.flushBuffer();
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    }
	}
    @PostMapping(path="/company/manage/update")
    public ResponseEntity<?> updateCompanyDetail(HttpServletRequest request) {
    	String id = request.getParameter("hide_id");

    	Company company = newCompanyService.findCompany(Long.parseLong(id));
    	if (company == null) {
    		return new ResponseEntity<String>("Company not existed", new HttpHeaders(), HttpStatus.NOT_FOUND);
    	}

    	String lockRecord = request.getParameter("lock_record");
    	if (lockRecord == null) {
    		company.setLockFlag(false);
    	} else {
    		company.setLockFlag(true);
	    	company.setUen(request.getParameter("txt_uen"));
	    	company.setName(request.getParameter("txt_name"));
	    	company.setType(request.getParameter("txt_type"));
	    	company.setActivityOne(request.getParameter("txt_activity1"));
	    	company.setActivityTwo(request.getParameter("txt_activity2"));
	    	company.setNominatedDirector(request.getParameter("txt_nominated"));
	    	company.setSecretary(request.getParameter("txt_secretary"));
	    	
	    	company.setTotalStockCapital(company.getTotalStockCapital());
	    	company.setActualStockCapital(company.getActualStockCapital());
	    	try {
	    		company.setTotalStockCapital(Float.parseFloat(request.getParameter("txt_totalStock")));
	        	company.setActualStockCapital(Float.parseFloat(request.getParameter("txt_actualStock")));
	    	} catch (NumberFormatException e) {
				e.printStackTrace();
			}
	    	
	    	company.setRegistrationDate(company.getRegistrationDate());
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date registrationDate = formatter.parse(request.getParameter("txt_registrationDate"));
				company.setRegistrationDate(registrationDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
    	}
    	newCompanyService.saveCompany(company);
    	return new ResponseEntity<String>("Update Successfully", new HttpHeaders(), HttpStatus.OK);
    }

    // File
    @PostMapping("/uploadfiles")
    public ResponseEntity<?> uploadFiles(@RequestParam("file") MultipartFile uploadfile){
    	logger.debug("Single file upload!");

        if (uploadfile.isEmpty()) {
            return new ResponseEntity<String>("Please Select a file!", HttpStatus.NOT_FOUND);
        }
        try {
        	saveUploadedFiles(Arrays.asList(uploadfile));
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        logger.debug("file name " + uploadfile.getOriginalFilename());
        return new ResponseEntity<String>("Successfully uploaded - " +
                uploadfile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);
    }
    private void saveUploadedFiles(List<MultipartFile> files) throws IOException {
		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}

			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadFilePathRoot + file.getOriginalFilename());
			Files.write(path, bytes);
		}
	}

    @PostMapping("/uploadfile/offline/singature/{shareholderId}")
    public ResponseEntity<?> uploadOfflineSingature(@PathVariable int shareholderId,  @RequestParam int doc, 
    		@RequestParam("file") MultipartFile uploadfile, HttpServletRequest request){
    	logger.debug("Single file upload!");
    	
    	String userId = (String) request.getSession().getAttribute("loginUsername");
    	String companyId = (String) request.getSession().getAttribute("companyId");
		
        if (uploadfile.isEmpty()) {
            return new ResponseEntity<String>("Please Select a file!", HttpStatus.NOT_FOUND);
        }
        try {
        	uploadFileService.uploadOfflineFile(Arrays.asList(uploadfile), shareholderId, doc, userId, companyId);
        } catch (IOException e) {
        	logger.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        logger.debug("file name " + uploadfile.getOriginalFilename());
        return new ResponseEntity<String>("Successfully uploaded - " +
                uploadfile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);

    }

    @PostMapping("uploadfile/personal/file/{id}")
    public ResponseEntity<?> uploadPersonalFile(@PathVariable String id, @RequestParam("file") MultipartFile uploadfile,
    		HttpServletRequest request){
    	logger.debug("Single file upload!");
    	
    	String userId = (String) request.getSession().getAttribute("loginUsername");
    	String companyId = (String) request.getSession().getAttribute("companyId");
		
        if (uploadfile.isEmpty()) {
            return new ResponseEntity<String>("Please Select a file!", HttpStatus.NOT_FOUND);
        }
        try {
        	uploadFileService.uploadPersonalFile(Arrays.asList(uploadfile), id, userId, companyId);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        logger.debug("file name " + uploadfile.getOriginalFilename());
        return new ResponseEntity<String>("Successfully uploaded - " +
                uploadfile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);
    }

    // Email
    @PostMapping("/sendemail") 
    public void sendEmail(@RequestBody String data) {
    	String result = "";
    	String toRecipient = "yuzhiqwe@gmail.com";
    	try {
    		result = URLDecoder.decode(data, StandardCharsets.UTF_8.toString());
    		System.out.println("Recevied data output:[" + result + "] and Sending email....");
    	    //result = java.net.URLDecoder.decode(data, StandardCharsets.UTF_8.name());
    	    //logger.info("Recevied data:[" + result + "] and Sending email....");
    	} catch (UnsupportedEncodingException e) {
    	    e.printStackTrace();
    	}
    	emailService.sendEmail(result, toRecipient);
    }
    
    @GetMapping("/categories") 
    public List<String> getCategories() {
    	return industryService.getAllIndustries();
    }
    
    @GetMapping("/category") 
    public List<Industry> getCategoryByName(@RequestParam("term") String name) {
    	return industryService.getIndustryByName(name);
    }

    @PostMapping(path="/shareholder/manage/update/{id}")
    public ResponseEntity<?> updateShareholderDetail(@PathVariable String id, HttpServletRequest request) {
    	
    	Optional<CompanyShareholderInfo> infoTemp1 = shareholderInfoService.getShareholderInfoById(Long.parseLong(id));
    	CompanyShareholderInfo info = null;
		// if is new shareholder then need to base on the new shareholder info to check if existed
    	if (!infoTemp1.isPresent()) {
    		List<CompanyShareholderInfo> infoTemp2 = shareholderInfoService.getShareholderInfoByNameAndCompanyId(request.getParameter("name_" + id), Long.parseLong(id));
    		if (infoTemp2.size() > 0) {
    			info = infoTemp2.get(0);
    		} else {
    			info = new CompanyShareholderInfo();
    		}
		} else {
			info = infoTemp1.get();
		}
    	/*
		 * if (info == null) { return new
		 * ResponseEntity<String>("CompanyShareholderInfo not existed", new
		 * HttpHeaders(), HttpStatus.NOT_FOUND); }
		 */

    	String lockRecord = request.getParameter("lock_shareholder_" + id);
    	if (info.getId() != null && lockRecord == null) {
    		info.setLockFlag(false);
    	} else {
    		info.setLockFlag(true);
    		info.setActualStockAmount(request.getParameter("actual_stock_" + id)!=null? Integer.parseInt(request.getParameter("actual_stock_" + id)) : 0);
    		info.setAddress(request.getParameter("address_" + id));
    		info.setContactNumber(request.getParameter("contact_number_" + id));
    		info.setEmail(request.getParameter("email_" + id));
    		info.setGender(request.getParameter("gender_" + id));
    		info.setIcNumber(request.getParameter("ic_number_" + id));
    		info.setIcType(request.getParameter("ic_type_" + id));

    		String remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
    		info.setIp(remoteAddr);

    		info.setIssueStockAmount(request.getParameter("issue_stock_" + id)!=null? Integer.parseInt(request.getParameter("issue_stock_" + id)) : 0);
    		info.setName(request.getParameter("name_" + id));
    		info.setNationality(request.getParameter("national_" + id));

    		StringBuilder sb = new StringBuilder();
    		if ("on".equals(request.getParameter("director_" + id))) {
    			info.setPositionType1("董事");
    		}
    		if ("on".equals(request.getParameter("shareholder_" + id))) {
    			info.setPositionType2("股东");
    		}
    		if ("on".equals(request.getParameter("cotact_" + id))) {
    			info.setPositionType3("联系人");
    		} 
    		if (("on").equals(request.getParameter("status_valid_" + id))) {
    			info.setStatus(true);
    		} else {
    			info.setStatus(false);
    		}
    		info.setValuePerStock(request.getParameter("value_per_stock_" + id)!=null? Integer.parseInt(request.getParameter("value_per_stock_" + id)) : 1);
    		if (info.getId() == null) {
    			Company company = companyRepository.findById(Long.parseLong(request.getParameter("company_id"))).get();
    			info.setCompany(company);
    		}
    	}
    	shareholderInfoService.saveShareholderInfo(info);
    	
    	return new ResponseEntity<String>(info.getId()+"", new HttpHeaders(), HttpStatus.OK);
    }
    
	// Time line
    @PostMapping(path="/timeline/manage/update")
    public ResponseEntity<?> updateTimelineDetail(HttpServletRequest request) {
    	Enumeration<String> parameterNames = request.getParameterNames();
    	Map<String, String> parameters = new HashMap<String, String>();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            parameters.put(paramName, paramValues[0]);
        }
        
    	String id = request.getParameter("hide_company_id");

    	Company company = newCompanyService.findCompany(Long.parseLong(id));
    	if (company == null) {
    		return new ResponseEntity<String>("Company not existed", new HttpHeaders(), HttpStatus.NOT_FOUND);
    	}
    	String lockFlag = request.getParameter("lock_record");
    	if (lockFlag == null) {
    		company.setTimelineLockFlag(false);
    	} else {
    		company.setTimelineLockFlag(true);
    	}
		companyRepository.save(company);
    	//adminTimelineService.saveCompanyFlag(company.getId(), lockFlag);

    	if (lockFlag != null) {
	    	//update timeliene and timeline_detail
	    	adminTimelineService.saveTimelineAndDetail(company.getId(), parameters);
    	}

    	return new ResponseEntity<String>("Update Successfully", new HttpHeaders(), HttpStatus.OK);
    }

    @PostMapping(path="/timeline/addition/update/{companyId}")
    public ResponseEntity<?> updateTimelineAddition(@PathVariable Long companyId, HttpServletRequest request) {
    	Enumeration<String> parameterNames = request.getParameterNames();
    	Map<String, String> parameters = new HashMap<String, String>();

    	while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            
            String[] paramValues = request.getParameterValues(paramName);
            parameters.put(paramName, paramValues[0]);
        }

        adminTimelineService.saveTimelineAddition(companyId, parameters);

    	return new ResponseEntity<String>("Update Successfully", new HttpHeaders(), HttpStatus.OK);
    }
    
    @RequestMapping(value = "/downloadAllFiles/{companyId}", method = RequestMethod.GET)
    public StreamingResponseBody downloadFile(@PathVariable int companyId,
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		
        response.setContentType("application/pdf");
        response.setHeader("fileName", "company_"+companyId+".zip");
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportCompanyAllFiles(companyId);
        return outputStream -> {
            outputStream.write(source);
        };
    }
}
