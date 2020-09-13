package sg.com.rsin.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import sg.com.rsin.service.GenerateJespterReportService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

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
	
    private InputStream inputStream;

	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
    public StreamingResponseBody getSteamingFile(HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"demo.pdf\"");
        inputStream = new FileInputStream(new File("D:\\PDFDemo.pdf"));
        
        byte[] source = generateJespterReportService.exportReport("pdf");
        return outputStream -> {
            outputStream.write(source);
        };
    }
}
