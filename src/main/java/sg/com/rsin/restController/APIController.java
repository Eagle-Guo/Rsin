package sg.com.rsin.restController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.Industry;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.IndustryService;
import sg.com.rsin.service.UploadFileService;

@RestController
@RequestMapping(value = "/api")
public class APIController {

	private final Logger logger = LoggerFactory.getLogger(APIController.class);

	//Save the uploaded file to this folder
	@Value("${upload.path}")
	private String uploadFilePathRoot;
    
	@Autowired
	EmailService emailService;
	@Autowired
	IndustryService industryService;
	@Autowired
	UploadFileService uploadFileService;
	
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
    
    @PostMapping("/uploadfile/offline/singature/{id}")
    public ResponseEntity<?> uploadFile(@PathVariable String id, @RequestParam("file") MultipartFile uploadfile,
    		HttpServletRequest request){
    	logger.debug("Single file upload!");
    	
    	String userId = (String) request.getSession().getAttribute("loginUsername");
		
        if (uploadfile.isEmpty()) {
            return new ResponseEntity<String>("Please Select a file!", HttpStatus.NOT_FOUND);
        }
        try {
        	uploadFileService.uploadOfflineFile(Arrays.asList(uploadfile), id, userId);
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
    
}
