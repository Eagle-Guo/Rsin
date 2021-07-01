package sg.com.rsin.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.DocumentType;

public interface FileService {
	public DocumentType getDocumentTypeCode (long id);

	public String getFileNameByUuid(String uuid);

	public DocumentHistory saveToDocmentAndHistory(String userId, long company_id, String filename, MultipartFile uploadfile, Document document)  throws IOException;
	
	public InputStream downloadCompanyFile(String uuid) throws Exception;
	
	public void deleteCompanyFile(String uuid) throws Exception;
	
	public DocumentHistory getDocHistory(String uuid);
	
	public Document getDocument (long id);
	
	public Document getDocumentByName (long companyId, String name);

	public Document saveToDocument(String createdBy, String userId, String category, int displaySequence, 
			String documentDesc, String documentDesccn, boolean lockFlag, long companyId, String documentType);
	
	public List<DocumentHistory> getDocumentsByCompanyId(long companyId, String type);
	
	public void updateDocumentFlag(long docId, String flag);
}
