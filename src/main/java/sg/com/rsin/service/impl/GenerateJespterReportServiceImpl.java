package sg.com.rsin.service.impl;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
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
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

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
import sg.com.rsin.util.CommonUtils;

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

	@SuppressWarnings("unchecked")
	public byte[] generateJasperPDF(String userId, String id) {
			
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
	
	public Map<String, String> generateNewCompanyPDFWithSignature(String userId, byte[] bytes) {

		List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
		String companyName = userData.get("companyName").toString();
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
		    String templateName = CommonUtils.getJaspterTemplateName("1");
		    
		    String fileName = templateName.substring(0, templateName.indexOf(".jrxml"));
		    // Report one
			InputStream employeeReportStream = resourceLoader.getResource("classpath:reports/" + templateName).getInputStream();
			JasperReport jasperReportOne = JasperCompileManager.compileReport(employeeReportStream);
			
			Map<String, Object> reportParamMapOne = new HashMap<>();
			reportParamMapOne.put("createdBy", "Rsin Group");
			reportParamMapOne.put("companyName", companyName + " PTE.LTD.");
			reportParamMapOne.put("registeredOffice", userData.get("address"));
			
			Map<String, Integer> shareholderAndStock = (Map<String, Integer>) userData.get("shareholderAndStock");
			StringBuffer shareholder = new StringBuffer();
			shareholderAndStock.forEach((k, v) -> shareholder.append(k).append("\t\t").append(v).append("\n"));
			shareholder.append("Total: \t\t").append(Integer.parseInt(userData.get("totalStockAmount").toString()));

			reportParamMapOne.put("shareholder", shareholder.toString());
			JasperPrint jasperPrintOne = JasperFillManager.fillReport(jasperReportOne, reportParamMapOne, new JREmptyDataSource());
			jasperPrintList.add(jasperPrintOne);

			// Report two
			InputStream signatureReportStream = resourceLoader.getResource("classpath:reports/Signature.jrxml").getInputStream();
			JasperReport signatureReport = JasperCompileManager.compileReport(signatureReportStream);
			
			Map<String, Object> reportParamMapTwo = new HashMap<String, Object>();
			reportParamMapTwo.put("createdBy", "Rsin Group");
			
			InputStream in = new ByteArrayInputStream(bytes);
	        BufferedImage bImageFromConvert = ImageIO.read(in);
	        
	        String qrCodeText = "https://www.rsin.com.sg";
			/*
			 * byte[] qrCode = null; try { qrCode = createQRImage(qrCodeText); } catch
			 * (WriterException e) { e.printStackTrace(); }
			 */
			
	        reportParamMapTwo.put("documentReference", "3425146652474290");
		    reportParamMapTwo.put("signImage", bImageFromConvert);
		    reportParamMapTwo.put("id", UUID.randomUUID().toString());
		    reportParamMapTwo.put("ip", "192.168.1.45");
		    reportParamMapTwo.put("serialNumber", "bos7zo7038h7mnum");
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
	
	/*
	private byte[] createQRImage(String qrCodeText) throws WriterException, IOException {
		// Create the ByteMatrix for the QR-Code that encodes the given String
		int size = 125;

		Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix byteMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);
		// Make the BufferedImage that are to hold the QRCode
		int matrixWidth = byteMatrix.getWidth();
		BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
		image.createGraphics();

		Graphics2D graphics = (Graphics2D) image.getGraphics();
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, matrixWidth, matrixWidth);
		// Paint and save the image using the ByteMatrix
		graphics.setColor(Color.BLACK);

		for (int i = 0; i < matrixWidth; i++) {
			for (int j = 0; j < matrixWidth; j++) {
				if (byteMatrix.get(i, j)) {
					graphics.fillRect(i, j, 1, 1);
				}
			}
		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image, "png", baos);
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		baos.close();
		
		return imageInByte;
	}
	*/
	
	public byte[] exportReport(String reportFormat, String userId, String id) {
		return generateJasperPDF(userId, id);
	}
	
	public Map<String, String> uploadSignature(String userId, MultipartFile uploadfile) {
		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
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
		Map<String, Object> userData = onlineSignatureService.getAllPageData(userId);
		String companyId = userData.get("companyId").toString();
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
