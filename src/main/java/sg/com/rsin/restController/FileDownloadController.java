package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.service.GenerateJespterReportService;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value = "/api")
public class FileDownloadController {
	
	@Autowired
	GenerateJespterReportService generateJespterReportService;
	/**
	 * Its Spring boot download file using StreamingResponseBody 
	 * it same like spring mvc download file.
	 */
	
	@RequestMapping(value = "/downloadSignature/{id}", method = RequestMethod.GET)
    public StreamingResponseBody downloadSignatureFile(@PathVariable String id,  HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        switch (id) {
        case "1": response.setHeader("fileName", "First_Director_Meeting_Resolution.pdf"); break;
        case "2": response.setHeader("fileName", "Secretary_Agreement.pdf"); break;
        case "3": response.setHeader("fileName", "Notice_for_Controllers.pdf"); break;
        case "4": response.setHeader("fileName", "Application_of_Shares.pdf"); break;
        case "5": response.setHeader("fileName", "Client_Acceptance_Form.pdf"); break;
        case "6": response.setHeader("fileName", "Form_45_201.pdf"); break;
        case "7": response.setHeader("fileName", "Share_Certificate.pdf"); break;
        case "8": response.setHeader("fileName", "Nominee_Dir_Authrn_Final.pdf"); break;
        }
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportReport("pdf");
        return outputStream -> {
            outputStream.write(source);
        };
    }
}
