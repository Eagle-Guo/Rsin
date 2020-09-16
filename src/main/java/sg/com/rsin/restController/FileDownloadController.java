package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.service.GenerateJespterReportService;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

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
		String userId = (String) request.getSession().getAttribute("loginUsername");
		
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
        response.setContentType("application/pdf");
        response.setHeader("fileName", filename);
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportReport("pdf", userId, filename, id);
        return outputStream -> {
            outputStream.write(source);
        };
    }
	
	@PostMapping("/uploadSignture")
    public ResponseEntity<?> uploadSignatureFile(@RequestParam("signature") MultipartFile uploadfile, HttpServletRequest request) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		
		Map<String, String> signFileAndName = generateJespterReportService.uploadSignature(userId, uploadfile);
		
		return new ResponseEntity(signFileAndName, HttpStatus.OK);
    }
	
	@RequestMapping(value = "/downloadFiles/{file_name}", method = RequestMethod.GET)
	public void getFile( @PathVariable("file_name") String fileName, HttpServletRequest request, HttpServletResponse response) {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		try {
			InputStream is = generateJespterReportService.downloadWithSignatureFile(fileName, userId);
		    org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
		    response.flushBuffer();
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    }
	}
}
