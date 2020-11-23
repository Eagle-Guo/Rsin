package sg.com.rsin.service;

import java.io.InputStream;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface GenerateJespterReportService {
	public byte[] exportReport(String reportFormat, String userId, int id);
	public Map<String, String> onlineSubmitSignatureFile(String userId, String ip, MultipartFile uploadfile);
	public InputStream downloadWithSignatureFile(String fileName, String userId);
}
