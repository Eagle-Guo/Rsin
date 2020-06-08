package sg.com.rsin.restController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class APIController {

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
}
