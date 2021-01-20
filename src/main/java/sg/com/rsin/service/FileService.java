package sg.com.rsin.service;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.DocumentType;

public interface FileService {
	public DocumentType getDocumentTypeCode (long id);

	public String getFileNameByUuid(String uuid);

	public DocumentHistory saveToDocmentAndHistory(String userId, long company_id, String filename, MultipartFile uploadfile, DocumentType documentType)  throws IOException;
	
	public InputStream downloadCompanyFile(String uuid) throws Exception;
	
	public void deleteCompanyFile(String uuid) throws Exception;
	
	public DocumentHistory getDocHistory(String uuid);
}
