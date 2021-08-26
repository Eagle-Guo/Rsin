package sg.com.rsin.service;

import java.io.InputStream;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface GenerateJespterReportService {
	public byte[] exportReport(String reportFormat, String userId, int id, String companyId);

	public Map<String, String> onlineSubmitSignatureFile(String userId, String ip, MultipartFile uploadfile, String companyId);

	public InputStream downloadWithSignatureFile(String companyId, String fileName, String userId);
	
	public byte[] exportCompanyAllFiles(int companyId);
}
