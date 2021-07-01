package sg.com.rsin.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.DocumentHistoryRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.enums.DocumentTypeCode;
import sg.com.rsin.service.UploadFileService;

@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	//Save the uploaded file to this folder
	@Value("${file.main.path}")
	private String uploadFilePathRoot;
	
	@Value("${offline.path}")
	private String uploadFileOfflinePath;
	
	@Value("${personal.path}")
	private String uploadFilePersonalPath;
	
	@Autowired
	DocumentRepository documentRepository;
	
	@Autowired
	DocumentHistoryRepository documentHistoryRepository;
	
	@Autowired
	DocumentTypeRepository documentTypeRepository;
	
	@Autowired
	CompanyRepository companyRepository;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareHolderInfoRepository;

	public void uploadOfflineFile(List<MultipartFile> files, int shareholderId, int id, String userid, String companyId) throws IOException {
		File offlineFileFolder = new File (uploadFilePathRoot.concat(companyId).concat(File.separator).concat(uploadFileOfflinePath));
		
		if (!offlineFileFolder.exists()) {
			offlineFileFolder.mkdirs();
		}
		
		CompanyShareholderInfo companyShareholderInfo = companyShareHolderInfoRepository.findById(shareholderId);
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));

		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}

			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadFilePathRoot.concat(companyId).concat(File.separator)
					.concat(uploadFileOfflinePath).concat(File.separator).concat(file.getOriginalFilename()));
			Files.write(path, bytes);
			
			Document document = new Document();
			DocumentTypeCode documentTypeCode = null; 
			switch (id) {
			case 1 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_1;
				break;
			case 2 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_2;
				break;
			case 3 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_3;
				break;
			case 4 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_4;
				break;
			case 5 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_5;
				break;
			case 6 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_6;
				break;
			case 7 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_7;
				break;
			case 8 :
				documentTypeCode = DocumentTypeCode.TYPE_COM_8;
				break;
			}
			DocumentType documentType = documentTypeRepository.findByDocumentTypeCode(documentTypeCode.name());
			document.setDocumentType(documentType);
			//document.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
			//document.setDocumentName(file.getOriginalFilename());
			//document.setReferenceNo(UUID.randomUUID().toString());	
			document.setUserId(companyShareholderInfo.getEmail());
			document.setCompany(company.get());
			document.setCreatedBy(userid);
			document.setCreatedDate(new Date());
			document.setCategory("C");
			documentRepository.save(document);
			
			DocumentHistory documentHistory = new DocumentHistory();
			documentHistory.setReferenceNo(UUID.randomUUID().toString());
			documentHistory.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
			documentHistory.setDocumentName(RandomStringUtils.randomAlphanumeric(10) + "_" + file.getOriginalFilename());
			documentHistory.setCreatedBy(userid);
			documentHistory.setCreatedDate(new Date());
			documentHistory.setDocument(document);
			documentHistoryRepository.save(documentHistory);
		}
	}
	
	public void uploadPersonalFile(List<MultipartFile> files, String id, String userid, String companyId) throws IOException {
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));
		
		File personalFileFolder = new File (uploadFilePathRoot.concat(companyId).concat(File.separator).concat(uploadFilePersonalPath));
		
		if (!personalFileFolder.exists()) {
			personalFileFolder.mkdirs();
		}
		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}

			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadFilePathRoot.concat(companyId).concat(File.separator)
					.concat(uploadFilePersonalPath).concat(File.separator).concat(file.getOriginalFilename()));
			Files.write(path, bytes);
			
			Document document = new Document();
			document.setCompany(company.get());
			document.setCreatedBy(userid);
			document.setCreatedDate(new Date());
			
			DocumentTypeCode documentTypeCode = null; 
			switch (id) {
			case "11" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_1;
				break;
			case "12" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_2;
				break;
			case "13" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_3;
				break;
			case "14" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_4;
				break;
			case "15" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_5;
				break;
			case "16" :
				documentTypeCode = DocumentTypeCode.TYPE_PER_6;
				break;
			}
			DocumentType documentType = documentTypeRepository.findByDocumentTypeCode(documentTypeCode.name());
			document.setCategory("P");
			document.setDocumentType(documentType);
			documentRepository.save(document);
			
			DocumentHistory documentHistory = new DocumentHistory();
			documentHistory.setReferenceNo(UUID.randomUUID().toString());
			documentHistory.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
			documentHistory.setDocumentName(RandomStringUtils.randomAlphanumeric(10) + "_" + file.getOriginalFilename());
			documentHistory.setCreatedBy(userid);
			documentHistory.setCreatedDate(new Date());
			documentHistory.setDocument(document);
			documentHistoryRepository.save(documentHistory);
		}
	}
}
