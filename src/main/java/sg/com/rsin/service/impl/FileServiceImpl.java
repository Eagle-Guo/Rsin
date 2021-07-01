package sg.com.rsin.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.DocumentHistoryRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.entity.Company;
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
		Optional<Document> document = documentRepository.findById(id);
		Document doc = document.orElseGet(() -> new Document());
		return doc.getDocumentType();
	}
	
	public Document getDocument (long id) {
		Optional<Document> doc = documentRepository.findById(id);
		return doc.orElseGet(() -> new Document());
	}
	
	public Document getDocumentByName (long companyId, String name) {
		List<Document> doc = documentRepository.findByDocumentDesc(companyId, name);
		return (doc != null && doc.size() > 0) ? doc.get(0): new Document();
	}

	public Document saveToDocument(String createdBy, String userId, String category, int displaySequence, 
			String documentDesc, String documentDesccn, boolean lockFlag, long companyId, String documentType) {
		Company company = companyRepository.findById(companyId).get();
		DocumentType docType = documentTypeRepository.findByDocumentTypeCode(documentType);
		Document document = new Document();
		document.setCreatedBy(createdBy);
		document.setCreatedDate(new Date());
		document.setUserId(userId);
		document.setCategory(category);
		document.setDisplaySequence(displaySequence);
		document.setDocumentDesc(documentDesc);
		document.setDocumentDesccn(documentDesccn);
		document.setLockFlag(lockFlag);
		document.setCompany(company);
		document.setDocumentType(docType);
		documentRepository.save(document);
		return document;
	}
	public DocumentHistory saveToDocmentAndHistory(String userId, long companyId, String filename, MultipartFile uploadfile, Document document) throws IOException {
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
		
	    DocumentHistory documentHistory = new DocumentHistory();
	    documentHistory.setCreatedBy(userId);
	    documentHistory.setCreatedDate(new Date());
	    documentHistory.setDocument(document);
	    documentHistory.setDocumentName(filename);
	    documentHistory.setDocumentPath(pathString);
	    documentHistory.setReferenceNo(referenceNo);
	    documentHistoryRepository.save(documentHistory);

	    return documentHistory;
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
	
	public DocumentHistory getDocHistory(String uuid) {
		return documentHistoryRepository.findByReferenceNo(uuid);
	}

	public List<DocumentHistory> getDocumentsByCompanyId (long companyId, String type) {
		List <Document> documents = documentRepository.findByCompanyIdAndCategoryOrderByDisplaySequenceAsc(companyId, type);
		
		List <DocumentHistory> histories = documents.stream().map(doc->{
			List <DocumentHistory> documentHistorie = documentHistoryRepository.findByDocumentIdOrderByIdDesc(doc.getId());
			return documentHistorie.size() > 0 ? documentHistorie.get(0) : new DocumentHistory();
		}).collect(Collectors.toList());
		return histories;
	}
	
	public void updateDocumentFlag(long docId, String flag) {
		Document document= documentRepository.findById(docId).get();
		document.setLockFlag("true".equals(flag)?true:false);
		documentRepository.save(document);
	}

}
