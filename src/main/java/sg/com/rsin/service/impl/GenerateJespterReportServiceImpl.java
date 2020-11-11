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
import sg.com.rsin.dao.DocumentRepository;
import sg.com.rsin.dao.DocumentTypeRepository;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentType;
import sg.com.rsin.enums.DocumentTypeCode;
import sg.com.rsin.service.GenerateJespterReportService;
import sg.com.rsin.service.OnlineSignatureService;
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
	OnlineSignatureService onlineSignatureService;
	
	@Value("${upload.path}")
	private String uploadFilePathRoot;
	
	@Autowired
	ResourceLoader resourceLoader;

	@SuppressWarnings("unchecked")
	public byte[] generateJasperPDF(String userId, int id) {
			
		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
		Map<String, Integer> shareholderAndStock = (Map<String, Integer>) userData.get("shareholderAndStock");
		StringBuffer shareholder = new StringBuffer();
		shareholderAndStock.forEach((k, v) -> shareholder.append(k).append("\t\t").append(v).append("\n"));
		shareholder.append("Total: \t\t").append(Integer.parseInt(userData.get("totalStockAmount").toString()));

		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    String templateName = CommonUtils.getJaspterTemplateName(id);
		    String fileName = CommonUtils.getFileName(id);
		    File file = new File(fileDirectory + fileName);
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
			
			JasperExportManager.exportReportToPdfFile(jasperPrintOne, fileDirectory + fileName);
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
	public Map<String, String> generateNewCompanyPDFWithSignature(String userId, byte[] bytes) {

		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
		String companyName = userData.get("companyName").toString();
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    Map<String, String> signatureAndPath = new HashMap<String, String>();
		    
		    // Generate all 8 documents
		    for (int i=1; i<=8; i++) {
		    	List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		    	String templateName = CommonUtils.getJaspterTemplateName(i);
			    
			    String fileName = templateName.substring(0, templateName.indexOf(".jrxml"));
			    InputStream in = new ByteArrayInputStream(bytes);
		        BufferedImage bImageFromConvert = ImageIO.read(in);
		        
			    // Report one
				InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
				JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
				
				Map<String, Object> reportParamMapOne = new HashMap<>();
				reportParamMapOne.put("createdBy", "Rsin Group");
				reportParamMapOne.put("companyName", companyName + " PTE.LTD.");
				reportParamMapOne.put("signImage", bImageFromConvert);
				reportParamMapOne.put("registeredOffice", userData.get("address"));
				
				Map<String, Integer> shareholderAndStock = (Map<String, Integer>) userData.get("shareholderAndStock");
				StringBuffer shareholder = new StringBuffer();
				shareholderAndStock.forEach((k, v) -> shareholder.append(k).append("\t\t").append(v).append("\n"));
				shareholder.append("Total: \t\t").append(Integer.parseInt(userData.get("totalStockAmount").toString()));

				reportParamMapOne.put("shareholder", shareholder.toString());
				JasperPrint jasperPrintOne = JasperFillManager.fillReport(jasperReportOne, reportParamMapOne, new JREmptyDataSource());
				jasperPrintList.add(jasperPrintOne);

				// Signature report
				InputStream signatureReportStream = resourceLoader.getResource("classpath:reports/Signature.jrxml").getInputStream();
				JasperReport signatureReport = JasperCompileManager.compileReport(signatureReportStream);
				
				Map<String, Object> reportParamMapTwo = new HashMap<String, Object>();
				reportParamMapTwo.put("createdBy", "Rsin Group");
				
				
		        
		        String qrCodeText = "https://www.rsin.com.sg";
		        reportParamMapTwo.put("documentReference", "3425146652474290");
			    reportParamMapTwo.put("signImage", bImageFromConvert);
			    reportParamMapTwo.put("id", UUID.randomUUID().toString());
			    reportParamMapTwo.put("ip", "192.168.1.45");
			    reportParamMapTwo.put("checksum", "bos7zo7038h7mnum");
			    reportParamMapTwo.put("audit", "2020-11-09 :  创建新公司");
			    reportParamMapTwo.put("qrCode", qrCodeText);

				JasperPrint jasperPrintTwo = JasperFillManager.fillReport(signatureReport, reportParamMapTwo, new JREmptyDataSource());
				jasperPrintList.add(jasperPrintTwo);

				//merge report
				JRPdfExporter exporter = new JRPdfExporter();
				exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList)); //Set as export input my list with JasperPrint s
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(fileDirectory + "WithSign_" + fileName + ".pdf")); //or any other out streaam
				//SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
				//configuration.setCreatingBatchModeBookmarks(true); //add this so your bookmarks work, you may set other parameters
				//exporter.setConfiguration(configuration);
				exporter.exportReport();
				JasperExportManager.exportReportToPdf(jasperPrintOne);
				
				insertToDB(companyId, i, userId, "WithSign_" + fileName + ".pdf");
				signatureAndPath.put(fileName, "WithSign_" + fileName + ".pdf");
		    }
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
	
	private void insertToDB (String companyId, int documentTypeId, String userid, String filename) {
		Optional<Company> company = companyRepository.findById(Long.parseLong(companyId));
		Document document = new Document();
		document.setCompany(company.get());
		document.setCreatedBy(userid);
		document.setCreatedDate(new Date());
		document.setDocumentName(filename);
		document.setDocumentPath(uploadFilePathRoot.concat(companyId).concat(File.separator));
		
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
		
		Document existedDocument = documentRepository.findByDocumentTypeAndCompany(documentType, company.get());
		if (existedDocument != null) {
			documentRepository.delete(existedDocument);
		}
		documentRepository.save(document);
	}
	public byte[] exportReport(String reportFormat, String userId, int id) {
		return generateJasperPDF(userId, id);
	}
	
	public Map<String, String> uploadSignature(String userId, MultipartFile uploadfile) {
		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
		String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
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
	            Path path = Paths.get(fileDirectory, userId + "_Sigature.png");
	            Files.write(path, bytes);
	            Map<String, String> signFileAndPath= generateNewCompanyPDFWithSignature(userId, bytes);
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
		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareHolderInfoRepository.findByEmail(userId);
		String companyId = userCompanyShareholderInfos.get(0).getCompany().getId().toString();
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
	    	File initialFile = new File(fileDirectory, fileName);
	        InputStream is = new FileInputStream(initialFile);
	        return is;
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    }
	}
}
