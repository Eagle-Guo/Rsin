package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import sg.com.rsin.service.EmailService;

@RestController
public class APIController {

	@Autowired
	EmailService emailService;
	
    @GetMapping("/api/employees")
    public String  all() {
        return "This information from API controller";
    }
     
    @PostMapping("/api/newcompany/sendemail")
    public String newCompanySendEmail(@RequestBody String data) {
        String response = "Your request Data is : " + data;
        
        System.out.println(response);
        return response;
    }
    
    @PostMapping("/api/sendemail") 
    public void sendEmail(@RequestBody String data) {
    	System.out.println("Recevied data:[" + data + "] and Sending email....");
    	emailService.sendEmail(data);
    }
}
