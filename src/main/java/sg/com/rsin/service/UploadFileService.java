package sg.com.rsin.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface UploadFileService {
	public void uploadOfflineFile(List<MultipartFile> files, String id, String userid, String companyId) throws IOException;

	public void uploadPersonalFile(List<MultipartFile> files, String id, String userid, String companyId) throws IOException;
}
