package sg.com.rsin.restController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APIController {

	 @GetMapping("/api/employees")
	  public String  all() {
	    return "This information from API controller";
	  }
}
