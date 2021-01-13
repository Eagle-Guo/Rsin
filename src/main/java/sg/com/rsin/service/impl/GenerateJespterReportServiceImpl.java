package sg.com.rsin.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import javax.imageio.ImageIO;

import org.apache.commons.lang3.ObjectUtils;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.dao.SignatureLogRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.entity.SignatureLog;
import sg.com.rsin.enums.DocumentTypeCode;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.GenerateJespterReportService;
import sg.com.rsin.util.CommonUtils;

@Service
public class GenerateJespterReportServiceImpl implements GenerateJespterReportService {
	
	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareHolderInfoRepository;
	
	@Autowired
	DocumentRepository documentRepository;
	@Autowired
	DocumentTypeRepository documentTypeRepository;
	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	SignatureLogRepository signatureLogRepository;
	@Autowired
	CompanyStatusTimeRepository companyStatusTimeRepository;

	@Autowired
	CommonDataService commonDataService;
	
	@Value("${upload.path}")
	private String uploadFilePathRoot;
	
	@Value("${signature.path}")
	private String signatureFilePathRoot;
	
	private String SIGNATURE_SUFFIX = "_Sigature.png";
	
	@Autowired
	ResourceLoader resourceLoader;

	@SuppressWarnings("unchecked")
	public byte[] generateJasperPDF(String userId, int id, String companyId) {
		Map<String, Object> userData = commonDataService.getSingleCompanyUserData(userId, companyId);
		Map<String, Integer> shareholderAndStock = (Map<String, Integer>) userData.get("shareholderAndStock");
		StringBuffer shareholder = new StringBuffer();
		shareholderAndStock.forEach((k, v) -> shareholder.append(k).append("\t\t").append(v).append("\n"));
		shareholder.append("Total: \t\t").append(Integer.parseInt(userData.get("totalStockAmount").toString()));

		try {
			String signatureFileDirectory = uploadFilePathRoot.concat(companyId).concat(File.separator);
			File directory = new File(signatureFileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    String templateName = CommonUtils.getJaspterTemplateName(id);
		    String fileName = CommonUtils.getFileName(id);
		    File file = new File(signatureFileDirectory + fileName);
		    if (file.exists()) {
		    	return Files.readAllBytes(file.toPath());
		    }
		    
			InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
			JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
			
			Map<String, Object> reportParamMapOne = new HashMap<>();
			reportParamMapOne.put("createdBy", "Rsin Group");
			reportParamMapOne.put("companyName", userData.get("companyName") + " PTE.LTD.");
			reportParamMapOne.put("registeredOffice", userData.get("address"));
			reportParamMapOne.put("shareholder", shareholder.toString());

			JasperPrint jasperPrintOne = JasperFillManager.fillReport(jasperReportOne, reportParamMapOne, new JREmptyDataSource());
			
			JasperExportManager.exportReportToPdfFile(jasperPrintOne, signatureFileDirectory + fileName);
			return JasperExportManager.exportReportToPdf(jasperPrintOne);
		} catch (JRException jre) {
			jre.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, String> generateNewCompanyPDFWithSignature(String userId, String ip, byte[] bytes, String companyId) {

		Map<String, Object> userData = commonDataService.getSingleCompanyUserData(userId, companyId);
		String companyName = userData.get("companyName").toString();
		CompanyShareholderInfo selfCompanyShareholderInfo = (CompanyShareholderInfo) userData.get("selfCompanyShareholderInfo");
		
		SignatureLog signatureLog = new SignatureLog();
		signatureLog.setActionType("Submit");
		signatureLog.setActionDesc(userData.get("shareholderName").toString() + " 提交签名!");
		signatureLog.setCreatedBy(userId);
		signatureLog.setCreatedDate(new Date());
		signatureLog.setCompany(companyRepository.findById(Long.parseLong(companyId)).get());
		signatureLogRepository.save(signatureLog);

		List<CompanyShareholderInfo> userCompanyShareholderInfos = (List<CompanyShareholderInfo>) userData.get("sameCompanyShareholderInfos");
		try {
			String signatureFileDirectory = signatureFilePathRoot.concat(companyId).concat(File.separator);
			File directory = new File(signatureFileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    Map<String, String> signatureAndPath = new HashMap<String, String>();
		    
		    // prepare the signature part
			InputStream signatureReportStream = resourceLoader.getResource("classpath:reports/Signature.jrxml").getInputStream();
			JasperReport signatureReport = JasperCompileManager.compileReport(signatureReportStream);
			
			InputStream in = new ByteArrayInputStream(bytes);
	        BufferedImage bImageFromConvert = ImageIO.read(in);
	        String md5Checksum = org.apache.commons.codec.digest.DigestUtils.md5Hex(in);

			Map<String, Object> reportParamMapTwo = new HashMap<String, Object>();
	        String documentReference = UUID.randomUUID().toString();
	        String qrCodeText = "https://www.rsin.com.sg";
	        reportParamMapTwo.put("documentReference", documentReference);
		    reportParamMapTwo.put("qrCode", qrCodeText);
		    
		    StringBuilder sb = new StringBuilder();
		    List <SignatureLog> signatureLogs = signatureLogRepository.findByCompanyId(Long.parseLong(companyId));
		    signatureLogs.stream().skip(signatureLogs.size() - 6).forEach(signLog -> {
		    	sb.append(signLog.getCreatedDate()).append(": ").append(signLog.getActionDesc()).append("\n");
		    });
		    
		    reportParamMapTwo.put("record", sb.toString());

	        for (CompanyShareholderInfo companyShareholderInfo :userCompanyShareholderInfos) {
	        	reportParamMapTwo.put("id"+companyShareholderInfo.getSeq(), String.valueOf(companyShareholderInfo.getSeq()));
	        	reportParamMapTwo.put("positionEmail"+companyShareholderInfo.getSeq(), companyShareholderInfo.getEmail());
	        	reportParamMapTwo.put("name"+companyShareholderInfo.getSeq(), companyShareholderInfo.getName());
	        	reportParamMapTwo.put("nric"+companyShareholderInfo.getSeq(), companyShareholderInfo.getIcNumber());
				if (companyShareholderInfo.getEmail().equalsIgnoreCase(userId)) {
					reportParamMapTwo.put("signImage"+companyShareholderInfo.getSeq(), bImageFromConvert);
					reportParamMapTwo.put("ip"+companyShareholderInfo.getSeq(), ip);
				    reportParamMapTwo.put("checksum"+companyShareholderInfo.getSeq(), md5Checksum);
				} else if (ObjectUtils.isNotEmpty(companyShareholderInfo.getSignatureName())){
					try {
						File file = new File((companyShareholderInfo.getSignaturePath()+companyShareholderInfo.getSignatureName()));
						InputStream inputStream = new FileInputStream(file);
						BufferedImage sigature = ImageIO.read(inputStream);
						reportParamMapTwo.put("signImage"+companyShareholderInfo.getSeq(), sigature);
						reportParamMapTwo.put("ip"+companyShareholderInfo.getSeq(), companyShareholderInfo.getIp());
					    reportParamMapTwo.put("checksum"+companyShareholderInfo.getSeq(), companyShareholderInfo.getChecksum());
					} catch (Exception ex) {
						Log.error("loading signature error");
					}
				}
			}
			JasperPrint jasperPrintTwo = JasperFillManager.fillReport(signatureReport, reportParamMapTwo, new JREmptyDataSource());

			CompanyService selfCompanyService = (CompanyService) userData.get("companyService");
		    // Generate all 8 documents
		    for (int i=1; i<=8; i++) {
		    	if (selfCompanyShareholderInfo.getPositionType().contains("董事")) {
		    		if (!selfCompanyShareholderInfo.getPositionType().contains("股东")) {// only 董事
		    			if (i==2||i==3||i==4||i==7) {
		    				continue;
		    			}
		    		} else { // 董事 and 股东
		    			if (selfCompanyService.getNominalDirector()<=0 || i==8) {
		    				continue;
		    			}
		    		}
		    	} else if (selfCompanyShareholderInfo.getPositionType().contains("股东")) {// only 股东
		    		if (i==1||i==6) {
		    			continue;
		    		} else if (selfCompanyService.getNominalDirector()<=0 || i==8) {
	    				continue;
	    			} 
		    	}
		    	List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		    	String templateName = CommonUtils.getJaspterTemplateName(i);
			    
			    String fileName = templateName.substring(0, templateName.indexOf(".jrxml"));
			    String singatureFileName = userId + "_" + fileName + ".pdf"; 
			    // Report one
				InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
				JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
				
				Map<String, Object> reportParamMapOne = new HashMap<>();

				reportParamMapOne.put("createdBy", "Rsin Group");
				reportParamMapOne.put("companyName", companyName + " PTE.LTD.");
				reportParamMapOne.put("registeredOffice", userData.get("address"));
				
				switch (i) {
					case 1: 
					    for (Map.Entry<String, Object> entry : reportParamMapTwo.entrySet()) {
				            if (entry.getKey().startsWith("name") || entry.getKey().startsWith("nric") || entry.getKey().startsWith("signImage")) {
				            	reportParamMapOne.put(entry.getKey(), entry.getValue());
				            }
				        }
						break;
					default :
						reportParamMapOne.put("signingDate", new Date().toString());
						reportParamMapOne.put("dateOfNotice", new Date().toString());
						reportParamMapOne.put("signDate", new Date().toString());
						reportParamMapOne.put("nameAndICofShareholder", userData.get("shareholderName"));
						reportParamMapOne.put("personalAddressOfShareholder", userData.get("shareholderAddress"));
						reportParamMapOne.put("companyAddress", userData.get("address"));
				}
				
				Map<String, Integer> shareholderAndStock = (Map<String, Integer>) userData.get("shareholderAndStock");
				StringBuffer shareholder = new StringBuffer();
				shareholderAndStock.forEach((k, v) -> shareholder.append(k).append("\t\t").append(v).append("\n"));
				shareholder.append("Total: \t\t").append(Integer.parseInt(userData.get("totalStockAmount").toString()));
				reportParamMapOne.put("shareholder", shareholder.toString());
				
				JasperPrint jasperPrintOne = JasperFillManager.fillReport(jasperReportOne, reportParamMapOne, new JREmptyDataSource());
				jasperPrintList.add(jasperPrintOne);

				jasperPrintList.add(jasperPrintTwo);

				//merge report
				JRPdfExporter exporter = new JRPdfExporter();
				exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList)); //Set as export input my list with JasperPrint s
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(signatureFileDirectory + singatureFileName)); //or any other out streaam
				//SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
				//configuration.setCreatingBatchModeBookmarks(true); //add this so your bookmarks work, you may set other parameters
				//exporter.setConfiguration(configuration);
				exporter.exportReport();
				JasperExportManager.exportReportToPdf(jasperPrintOne);
				
				saveDocumentDetail(companyId, i, userId, singatureFileName, documentReference);
				
				signatureAndPath.put(fileName, singatureFileName);
		    }
		    saveShareholder(companyId, ip, md5Checksum, userId);
			return signatureAndPath;
			
		} catch (JRException jre) {
			jre.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private void saveShareholder (String companyId, String ip, String md5Checksum, String userid) {
		//update company_shareholder_info table for fields signature name and path.
		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareHolderInfoRepository.findByEmailAndCompanyId(userid, Long.parseLong(companyId));
		userCompanyShareholderInfos.parallelStream().forEach(info -> {
			info.setIp(ip);
			info.setChecksum(md5Checksum);
			info.setSignatureName(userid + SIGNATURE_SUFFIX);
			info.setSignaturePath(signatureFilePathRoot.concat(companyId).concat(File.separator));
			companyShareHolderInfoRepository.save(info);
		});
		// update the signature timing
		CompanyStatusTime companyStatusTime = companyStatusTimeRepository.findByCompanyId(Long.parseLong(companyId));
		companyStatusTime.setSignature(new Date());
		companyStatusTimeRepository.save(companyStatusTime);
	}
	private void saveDocumentDetail (String companyId, int documentTypeId, String userid, String filename, String referenceNo) {
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));
		Document document = new Document();
		document.setCompany(company.get());
		document.setCreatedBy(userid);
		document.setCreatedDate(new Date());
		document.setDocumentName(filename);
		document.setReferenceNo(referenceNo);
		document.setUserId(userid);
		document.setDocumentPath(signatureFilePathRoot.concat(companyId).concat(File.separator));
		
		DocumentTypeCode documentTypeCode = null; 
		switch (documentTypeId) {
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
		
		Document existedDocument = documentRepository.findByDocumentTypeAndUserIdAndCompany(documentType.getDocumentTypeCode(),userid, company.get().getId());
		if (existedDocument != null) {
			documentRepository.delete(existedDocument);
		}
		documentRepository.save(document);
	}
	public byte[] exportReport(String reportFormat, String userId, int id, String companyId) {
		return generateJasperPDF(userId, id, companyId);
	}
	
	public Map<String, String> onlineSubmitSignatureFile(String userId, String ip, MultipartFile uploadfile, String companyId) {
		String fileDirectory = signatureFilePathRoot.concat(companyId).concat(File.separator);
		File directory = new File(fileDirectory);
	    if (!directory.exists()){
	        directory.mkdirs();
	    }

		try {
			List<MultipartFile> files = Arrays.asList(uploadfile);
			for (MultipartFile file : files) {
	            if (file.isEmpty()) {
	                continue;
	            }

	            byte[] bytes = file.getBytes();
	            Path path = Paths.get(fileDirectory, userId + SIGNATURE_SUFFIX);
	            Files.write(path, bytes);
	            
	            Map<String, String> signFileAndPath= generateNewCompanyPDFWithSignature(userId, ip, bytes, companyId);
	            return signFileAndPath;
	        }
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new HashMap<String, String>();
	}
	
	public InputStream downloadWithSignatureFile(String fileName, String userId) {
		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareHolderInfoRepository.findByEmailOrderById(userId);
		String companyId = userCompanyShareholderInfos.get(0).getCompany().getId().toString();
		try {
			String fileDirectory = signatureFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
	    	File initialFile = new File(fileDirectory, fileName);
	        InputStream is = new FileInputStream(initialFile);
	        return is;
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    }
	}
}
