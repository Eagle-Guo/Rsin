package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.service.GenerateJespterReportService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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
    public StreamingResponseBody downloadSignatureFile(@PathVariable String id, 
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String companyId = 
				generateJespterReportService.getCompanyId((String) request.getSession().getAttribute("loginUsername"));
        response.setContentType("application/pdf");
        String filename = null;
        switch (id) {
        case "1": filename = "First_Director_Meeting_Resolution.pdf"; break;
        case "2": filename = "Secretary_Agreement.pdf"; break;
        case "3": filename = "Notice_for_Controllers.pdf"; break;
        case "4": filename = "Application_of_Shares.pdf"; break;
        case "5": filename = "Client_Acceptance_Form.pdf"; break;
        case "6": filename = "Form_45_201.pdf"; break;
        case "7": filename = "Share_Certificate.pdf"; break;
        case "8": filename = "Nominee_Dir_Authrn_Final.pdf"; break;
        default: filename = "others.pdf";
        }
        response.setHeader("fileName", filename);
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportReport("pdf", companyId, filename);
        return outputStream -> {
            outputStream.write(source);
        };
    }
}
