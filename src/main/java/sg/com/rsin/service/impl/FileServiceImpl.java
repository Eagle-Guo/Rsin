package sg.com.rsin.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.DocumentHistoryRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.service.FileService;

@Service
public class FileServiceImpl implements FileService {

	@Value("${file.main.path}")
	private String uploadFilePathRoot;

	@Value("${manage.company.path}")
	private String companyManageFilePath;

	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	DocumentRepository documentRepository;
	@Autowired
	DocumentHistoryRepository documentHistoryRepository;
	@Autowired
	DocumentTypeRepository documentTypeRepository;
	
	public DocumentType getDocumentTypeCode (long id) {
		return documentTypeRepository.findByDocumentTypeCode("TYPE_COM_" + id);
	}

	public void saveToDocmentAndHistory(String userId, long companyId, String filename, MultipartFile uploadfile, DocumentType documentType) throws IOException {
		String referenceNo = UUID.randomUUID().toString();
		filename = referenceNo.replace("-", "").concat("_").concat(filename);
		String pathString = uploadFilePathRoot + companyId + File.separator + companyManageFilePath;
		String fileString = pathString + File.separator + filename;

		File companyPath = new File (pathString);
		if (!companyPath.exists()) {
			companyPath.mkdirs();
		}
		
		try {
		    Path pathwithFile = Paths.get(fileString);
		    byte[] bytes = uploadfile.getBytes();
			Files.write(pathwithFile, bytes);
	    } catch (IOException ex) {
	    	ex.printStackTrace();
	    	throw ex;
	    }
		
		
		Document document = documentRepository.findByDocumentTypeAndUserIdAndCompany(documentType.getDocumentTypeCode(), userId, companyId);
		if ( document == null) {
			document = new Document();
			document.setCreatedBy(userId);
			document.setCreatedDate(new Date());
			document.setDocumentType(documentType);
			document.setUserId(userId);
		    document.setCompany(companyRepository.findById(companyId).orElse(null));
		    documentRepository.save(document);
		}

	    DocumentHistory documentHistory = new DocumentHistory();
	    documentHistory.setCreatedBy(userId);
	    documentHistory.setCreatedDate(new Date());
	    documentHistory.setDocument(document);
	    documentHistory.setDocumentName(filename);
	    documentHistory.setDocumentPath(pathString);
	    documentHistory.setReferenceNo(referenceNo);
	    documentHistoryRepository.save(documentHistory);
	}

	public String getFileNameByUuid(String uuid) {
		DocumentHistory documentHistory= documentHistoryRepository.findByReferenceNo(uuid);
		return (documentHistory == null) ? "" : documentHistory.getDocumentName();
	}

	public InputStream downloadCompanyFile(String uuid) throws Exception {
		DocumentHistory documentHistory= documentHistoryRepository.findByReferenceNo(uuid);
		if (documentHistory==null) {
			throw new Exception("Document Not Found!");
		}
		InputStream is = null;
		try {
	    	File initialFile = new File(documentHistory.getDocumentPath(), documentHistory.getDocumentName());
	    	is = new FileInputStream(initialFile);
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    }
		return is;
	}

	public void deleteCompanyFile(String uuid) throws Exception {
		DocumentHistory documentHistory= documentHistoryRepository.findByReferenceNo(uuid);
		if (documentHistory==null) {
			throw new Exception("Document Not Found!");
		}
		documentHistoryRepository.delete(documentHistory);
	}
}
