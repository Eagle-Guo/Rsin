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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.Industry;
import sg.com.rsin.service.EmailService;
import sg.com.rsin.service.IndustryService;

@RestController
public class APIController {

	private final Logger logger = LoggerFactory.getLogger(APIController.class);

	//Save the uploaded file to this folder
    private static String UPLOADED_FOLDER = "D://temp//";
    
	@Autowired
	EmailService emailService;
	@Autowired
	IndustryService industryService;
	
    @GetMapping("/api/employees")
    public String  all() {
        return "This information from API controller";
    }
    
    @PostMapping("/api/newcompany/sendemail")
    public String newCompanySendEmail(@RequestBody String data) {
        String response = "Your request Data is : " + data;
        return response;
    }
    
    @PostMapping("/api/uploadfile")
    public ResponseEntity<?> uploadFile(@RequestParam("file") MultipartFile uploadfile){
    	logger.debug("Single file upload!");

        if (uploadfile.isEmpty()) {
            return new ResponseEntity("Please Select a file!", HttpStatus.NOT_FOUND);
        }
        try {
            saveUploadedFiles(Arrays.asList(uploadfile));
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        logger.debug("file name " + uploadfile.getOriginalFilename());
        return new ResponseEntity("Successfully uploaded - " +
                uploadfile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);

    }

    //save file
    private void saveUploadedFiles(List<MultipartFile> files) throws IOException {

        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue; //next pls
            }

            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
        }
    }
    
    @PostMapping("/api/sendemail") 
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
    
    @GetMapping("/api/categories") 
    public List<String> getCategories() {
    	return industryService.getAllIndustries();
    }
}
