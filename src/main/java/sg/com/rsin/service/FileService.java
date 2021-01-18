package sg.com.rsin.service;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.DocumentType;

public interface FileService {
	public DocumentType getDocumentTypeCode (long id);

	public String getFileNameByUuid(String uuid);

	public void saveToDocmentAndHistory(String userId, long company_id, String filename, MultipartFile uploadfile, DocumentType documentType)  throws IOException;
	
	public InputStream downloadCompanyFile(String uuid) throws Exception;
}
