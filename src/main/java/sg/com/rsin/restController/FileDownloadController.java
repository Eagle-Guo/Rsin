package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.FileService;
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

	@Autowired
	CommonDataService commonDataService;
	
	@Autowired
	FileService fileService;
	/**
	 * Its Spring boot download file using StreamingResponseBody 
	 * it same like spring mvc download file.
	 */
	
	@RequestMapping(value = "/downloadfile/{shareholderId}", method = RequestMethod.GET)
    public StreamingResponseBody downloadFile(@PathVariable int shareholderId,  @RequestParam int doc,
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getSession().getAttribute("companyId");
		
        String filename = CommonUtils.getFileName(doc+1);

        response.setContentType("application/pdf");
        response.setHeader("fileName", filename);
        response.setHeader("content-disposition", "attachment;");
        
        byte[] source = generateJespterReportService.exportReport("pdf", userId, doc+1, companyId);
        return outputStream -> {
            outputStream.write(source);
        };
    }
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Deprecated
	@PostMapping("/onlineSubmitSignture")
    public ResponseEntity<?> userOnlineSubmitSignatureFileDeprecated(@RequestParam("signature") MultipartFile uploadfile, HttpServletRequest request) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getSession().getAttribute("companyId");
		String ip = request.getRemoteAddr();
		
		Map<String, String> signFileAndName = generateJespterReportService.onlineSubmitSignatureFile(userId, ip, uploadfile, companyId);
		
		return new ResponseEntity(signFileAndName, HttpStatus.OK);
    }

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@PostMapping("/onlineSubmitSignture/{companyShareholderInfoId}")
    public ResponseEntity<?> userOnlineSubmitSignatureFile(@PathVariable("companyShareholderInfoId") String companyShareholderInfoId,
    		@RequestParam("signature") MultipartFile uploadfile, HttpServletRequest request) throws IOException {
		//get the userId from shareholder table
		String userId =  commonDataService.getUserId((String) request.getSession().getAttribute("loginUsername"), companyShareholderInfoId);
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
	
	@RequestMapping(value = "/company/upload/{company_id}")
    public ResponseEntity<?> companyUploadFile(@PathVariable long company_id, @RequestParam("id") int id, @RequestParam("file") MultipartFile uploadfile,
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = (String) request.getSession().getAttribute("loginUsername");
		String filename = CommonUtils.getFileName(id);

        response.setContentType("application/pdf");
        response.setHeader("fileName", filename);
        response.setHeader("content-disposition", "attachment;");

        DocumentType documentType = fileService.getDocumentTypeCode(id);
        try {
        	fileService.saveToDocmentAndHistory(userId, company_id, filename, uploadfile, documentType);
        } catch (IOException ex) {
        	return new ResponseEntity<String>("File upload Failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<String>("File upload Successful", HttpStatus.OK);
    }
	
	@GetMapping(value = "/company/download/file")
    public void companyDownload(@RequestParam String uuid, HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/pdf");
        response.setHeader("fileName", fileService.getFileNameByUuid(uuid));
        response.setHeader("content-disposition", "attachment;");
        
        try {
			InputStream is = fileService.downloadCompanyFile(uuid);
		    org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
		    response.flushBuffer();
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    } catch (Exception ex) {
		  throw new RuntimeException("Download file error");
		}
    }
}
