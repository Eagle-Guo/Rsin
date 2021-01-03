package sg.com.rsin.restController;

import javax.servlet.http.HttpServletRequest;

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
    public ResponseEntity<String> newCompany(@RequestBody String receivedData, HttpServletRequest request) {
		logger.info("new Company info" + receivedData);
		
		long companyId = newCompanyService.addCompany(receivedData);
		if (companyId < 1) {
			return new ResponseEntity<>("Company existed", HttpStatus.CONFLICT);
		}
		request.setAttribute("companyId", companyId);
		return new ResponseEntity<>(HttpStatus.OK);
    }
	
	
}
