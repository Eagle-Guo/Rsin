package sg.com.rsin.service;

import org.springframework.web.multipart.MultipartFile;

public interface GenerateJespterReportService {
	public byte[] exportReport(String reportFormat, String userId, String fileName, String id);
	public byte[] uploadSignature(String userId, MultipartFile uploadfile);
}
