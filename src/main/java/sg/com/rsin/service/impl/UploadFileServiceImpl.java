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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.enums.DocumentTypeCode;
import sg.com.rsin.service.UploadFileService;

@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	//Save the uploaded file to this folder
	@Value("${upload.path}")
	private String uploadFilePathRoot;
	
	private String OFFLINE_FOLDER = "offline/";
	private String PERSONAL_FOLDER = "personal/";

	@Autowired
	DocumentRepository documentRepository;
	@Autowired
	DocumentTypeRepository documentTypeRepository;
	
	@Autowired
	CompanyRepository companyRepository;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareHolderInfoRepository;

	public void uploadOfflineFile(List<MultipartFile> files, int shareholderId, int id, String userid, String companyId) throws IOException {
		File offlineFileFolder = new File (uploadFilePathRoot.concat(companyId).concat(File.separator).concat(OFFLINE_FOLDER));
		
		if (!offlineFileFolder.exists()) {
			offlineFileFolder.mkdir();
		}
		
		CompanyShareholderInfo companyShareholderInfo = companyShareHolderInfoRepository.findById(shareholderId);
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));

		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}

			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadFilePathRoot.concat(companyId).concat(File.separator)
					.concat(OFFLINE_FOLDER).concat(file.getOriginalFilename()));
			Files.write(path, bytes);
			
			Document document = new Document();
			DocumentTypeCode documentTypeCode = null; 
			switch (id) {
			case 1 :
				documentTypeCode = DocumentTypeCode.TYPE1;
				break;
			case 2 :
				documentTypeCode = DocumentTypeCode.TYPE2;
				break;
			case 3 :
				documentTypeCode = DocumentTypeCode.TYPE3;
				break;
			case 4 :
				documentTypeCode = DocumentTypeCode.TYPE4;
				break;
			case 5 :
				documentTypeCode = DocumentTypeCode.TYPE5;
				break;
			case 6 :
				documentTypeCode = DocumentTypeCode.TYPE6;
				break;
			case 7 :
				documentTypeCode = DocumentTypeCode.TYPE7;
				break;
			case 8 :
				documentTypeCode = DocumentTypeCode.TYPE8;
				break;
			}
			DocumentType documentType = documentTypeRepository.findByDocumentTypeCode(documentTypeCode.name());
			document.setDocumentType(documentType);
			document.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
			document.setDocumentName(file.getOriginalFilename());
			document.setReferenceNo(UUID.randomUUID().toString());	
			document.setUserId(companyShareholderInfo.getEmail());
			document.setCompany(company.get());
			document.setCreatedBy(userid);
			document.setCreatedDate(new Date());
			
			Document existedDocument = documentRepository.findByDocumentTypeAndUserIdAndCompany(documentType.getDocumentTypeCode(), userid, company.get().getId());
			if (existedDocument != null) {
				documentRepository.delete(existedDocument);
			}
			documentRepository.save(document);
		}
	}
	
	public void uploadPersonalFile(List<MultipartFile> files, String id, String userid, String companyId) throws IOException {
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));
		
		File personalFileFolder = new File (uploadFilePathRoot.concat(companyId).concat(File.separator).concat(PERSONAL_FOLDER));
		
		if (!personalFileFolder.exists()) {
			personalFileFolder.mkdir();
		}
		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}

			byte[] bytes = file.getBytes();
			Path path = Paths.get(uploadFilePathRoot.concat(companyId).concat(File.separator)
					.concat(PERSONAL_FOLDER).concat(file.getOriginalFilename()));
			Files.write(path, bytes);
			
			Document document = new Document();
			document.setCompany(company.get());
			document.setCreatedBy(userid);
			document.setCreatedDate(new Date());
			document.setDocumentName(file.getOriginalFilename());
			document.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
			
			DocumentTypeCode documentTypeCode = null; 
			switch (id) {
			case "11" :
				documentTypeCode = DocumentTypeCode.TYPE11;
				break;
			case "12" :
				documentTypeCode = DocumentTypeCode.TYPE12;
				break;
			case "13" :
				documentTypeCode = DocumentTypeCode.TYPE13;
				break;
			case "14" :
				documentTypeCode = DocumentTypeCode.TYPE14;
				break;
			case "15" :
				documentTypeCode = DocumentTypeCode.TYPE15;
				break;
			case "16" :
				documentTypeCode = DocumentTypeCode.TYPE16;
				break;
			}
			DocumentType documentType = documentTypeRepository.findByDocumentTypeCode(documentTypeCode.name());
			document.setDocumentType(documentType);
			
			Document existedDocument = documentRepository.findByDocumentTypeAndUserIdAndCompany(documentType.getDocumentTypeCode(), userid, company.get().getId());
			if (existedDocument != null) {
				documentRepository.delete(existedDocument);
			}
			documentRepository.save(document);
		}
	}
}
