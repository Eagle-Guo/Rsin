package sg.com.rsin.restController;

import java.io.IOException;
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
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Industry;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.IndustryService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.service.UploadFileService;
import sg.com.rsin.vo.CompanyDto;

@RestController
@RequestMapping(value = "/api")
public class APIController {

	private final Logger logger = LoggerFactory.getLogger(APIController.class);

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
	
    @GetMapping("/employees")
    public String  all() {
        return "This information from API controller";
    }
    
    @PostMapping("/newcompany/sendemail")
    public String newCompanySendEmail(@RequestBody String data) {
        String response = "Your request Data is : " + data;
        return response;
    }
    
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
    
    @GetMapping(path="/allPendingCompanies", produces=MediaType.APPLICATION_JSON_VALUE)
    public Set<CompanyDto> allPendingCompanies() {
    	return commonDataService.getAllPendingCompanies();
    }
    
    @GetMapping(path="/allCompanies", produces=MediaType.APPLICATION_JSON_VALUE)
    public Set<CompanyDto> allCompanies() {
    	return commonDataService.getAllCompanies();
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
}
