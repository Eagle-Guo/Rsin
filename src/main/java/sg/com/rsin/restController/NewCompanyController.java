package sg.com.rsin.restController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import sg.com.rsin.service.NewCompanyService;

@RestController
public class NewCompanyController {

	private static final Logger logger = LoggerFactory.getLogger(NewCompanyController.class);
	
	@Autowired
	NewCompanyService newCompanyService;
	@PostMapping("/api/newCompany")
    public ResponseEntity<String> newCompany(@RequestBody String receivedData) {
		logger.info("new Company info" + receivedData);
		
		if (newCompanyService.addCompany(receivedData) != null) {
			return new ResponseEntity<>("Company existed", HttpStatus.CONFLICT);
		}
		return new ResponseEntity<>(HttpStatus.OK);
    }
	
	
}
