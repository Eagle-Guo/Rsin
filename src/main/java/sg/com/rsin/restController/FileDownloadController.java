package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
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
import sg.com.rsin.util.CommonUtils;

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
	
	@RequestMapping(value = "/downloadfile/{id}", method = RequestMethod.GET)
    public StreamingResponseBody downloadFile(@PathVariable int id, 
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getSession().getAttribute("companyId");
		
        String filename = CommonUtils.getFileName(id);

        response.setContentType("application/pdf");
        response.setHeader("fileName", filename);
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportReport("pdf", userId, id, companyId);
        return outputStream -> {
            outputStream.write(source);
        };
    }
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Deprecated
	@PostMapping("/onlineSubmitSignture")
    public ResponseEntity<?> userOnlineSubmitSignatureFile(@RequestParam("signature") MultipartFile uploadfile, HttpServletRequest request) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getSession().getAttribute("companyId");
		String ip = request.getRemoteAddr();
		
		Map<String, String> signFileAndName = generateJespterReportService.onlineSubmitSignatureFile(userId, ip, uploadfile, companyId);
		
		return new ResponseEntity(signFileAndName, HttpStatus.OK);
    }

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@PostMapping("/onlineSubmitSignture/{companyShareholderInfoId}")
    public ResponseEntity<?> userOnlineSubmitSignatureFileTemp(@PathVariable("companyShareholderInfoId") String companyShareholderInfoId,
    		@RequestParam("signature") MultipartFile uploadfile, HttpServletRequest request) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getSession().getAttribute("companyId");
		String ip = request.getRemoteAddr();
		
		Map<String, String> signFileAndName = generateJespterReportService.onlineSubmitSignatureFile(userId, ip, uploadfile, companyId);
		
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
