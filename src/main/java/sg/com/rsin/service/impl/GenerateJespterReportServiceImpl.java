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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.service.GenerateJespterReportService;
import sg.com.rsin.service.OnlineSignatureService;

@Service
public class GenerateJespterReportServiceImpl implements GenerateJespterReportService {
	
	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareHolderInfoRepository;
	
	@Autowired 
	OnlineSignatureService onlineSignatureService;
	
	@Value("${upload.path}")
	private String uploadFilePathRoot;
	
	@Autowired
	ResourceLoader resourceLoader;

	public byte[] generateNewCompanyPDF(String userId, String fileName, String id) {
			
		Map<String, String> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId");
		String companyName = userData.get("companyName");
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    String templateName = null;
		    switch (id) {
		        case "1": templateName = "First_Director_Meeting_Resolution.jrxml"; break;
		        case "2": templateName = "Secretary_Agreement.jrxml"; break;//Signature.jrxml
		        case "3": templateName = "Notice_for_Controllers.jrxml"; break;
		        case "4": templateName = "Application_of_Shares.jrxml"; break;
		        case "5": templateName = "Client_Acceptance_Form.jrxml"; break;
		        case "6": templateName = "Form_45_201.jrxml"; break;
		        case "7": templateName = "Share_Certificate.jrxml"; break;
		        case "8": templateName = "Nominee_Dir_Authrn_Final.jrxml"; break;
		        default : templateName = "First_Director_Meeting_Resolution.jrxml";
	        }
			InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
			JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
			
			Map<String, Object> reportParamMapOne = new HashMap<>();
			reportParamMapOne.put("createdBy", "Rsin Group");
			reportParamMapOne.put("companyname", companyName + " PTE.LTD.");
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
	
	public Map<String, String> generateNewCompanyPDFWithSignature(String userId, byte[] bytes) {

		List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		Map<String, String> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId");
		String companyName = userData.get("companyName");
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    String templateName = null;
		    switch ("1") {
		        case "1": templateName = "First_Director_Meeting_Resolution.jrxml"; break;
		        case "2": templateName = "Secretary_Agreement.jrxml"; break;//Signature.jrxml
		        case "3": templateName = "Notice_for_Controllers.jrxml"; break;
		        case "4": templateName = "Application_of_Shares.jrxml"; break;
		        case "5": templateName = "Client_Acceptance_Form.jrxml"; break;
		        case "6": templateName = "Form_45_201.jrxml"; break;
		        case "7": templateName = "Share_Certificate.jrxml"; break;
		        case "8": templateName = "Nominee_Dir_Authrn_Final.jrxml"; break;
		        default : templateName = "First_Director_Meeting_Resolution.jrxml";
	        }
		    
		    String fileName = templateName.substring(0, templateName.indexOf(".jrxml"));
		    // Report one
			InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
			JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
			
			Map<String, Object> reportParamMapOne = new HashMap<>();
			reportParamMapOne.put("createdBy", "Rsin Group");
			reportParamMapOne.put("companyname", companyName + " PTE.LTD.");
			JasperPrint jasperPrintOne = JasperFillManager.fillReport(jasperReportOne, reportParamMapOne, new JREmptyDataSource());
			jasperPrintList.add(jasperPrintOne);

			// Report two
			InputStream signatureReportStream = resourceLoader.getResource("classpath:reports/Signature.jrxml").getInputStream();
			JasperReport signatureReport = JasperCompileManager.compileReport(signatureReportStream);
			
			Map<String, Object> reportParamMapTwo = new HashMap<String, Object>();
			reportParamMapTwo.put("createdBy", "Rsin Group");
			
			ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
		    BufferedImage image = ImageIO.read(bis);
		    reportParamMapTwo.put("signImage", bis);
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
			Map<String, String> signatureAndPath = new HashMap<String, String>();
			signatureAndPath.put(fileName, "WithSign_" + fileName + ".pdf");
			signatureAndPath.put("Secretary_Agreement", "WithSign_Secretary_Agreement.pdf");
			//signatureAndPath.put("Notice_for_Controllers", "WithSign_Notice_for_Controllers.pdf");
			//signatureAndPath.put("Application_of_Shares", "WithSign_Application_of_Shares.pdf");
			//signatureAndPath.put("Client_Acceptance_Form", "WithSign_Client_Acceptance_Form.pdf");
			//signatureAndPath.put("Form_45_201", "WithSign_Form_45_201.pdf");
			//signatureAndPath.put("Share_Certificate", "WithSign_Share_Certificate.pdf");
			//signatureAndPath.put("Nominee_Dir_Authrn_Final", "Nominee_Dir_Authrn_Final.pdf");
			
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
	
	public byte[] exportReport(String reportFormat, String userId, String fileName, String id) {
		return generateNewCompanyPDF(userId, fileName, id);
	}
	
	public Map<String, String> uploadSignature(String userId, MultipartFile uploadfile) {
		Map<String, String> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId");
		String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
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
		Map<String, String> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId");
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
