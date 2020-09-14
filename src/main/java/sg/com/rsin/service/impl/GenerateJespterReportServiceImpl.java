package sg.com.rsin.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.service.GenerateJespterReportService;

@Service
public class GenerateJespterReportServiceImpl implements GenerateJespterReportService {
	
	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareHolderInfoRepository;
	
	@Value("${upload.path}")
	private String uploadFilePathRoot;
	 
	public String getCompanyId (String userid) {
		if (userid == null || "".equals(userid)) {
			return "";
		}
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareHolderInfoRepository.findByDescription(userid);
		return (companyShareholderInfos.size()>0 ? companyShareholderInfos.get(0).getNewCompany().getId().toString():"");
	}
	 
	public byte[] exportReport(String reportFormat, String companyId, String fileName) {
		
		try {
			String fileDirectory = uploadFilePathRoot.concat(File.separator).concat(companyId).concat(File.separator);
			File directory = new File(fileDirectory);
		    if (! directory.exists()){
		        directory.mkdirs();
		    }
			File file = ResourceUtils.getFile("classpath:reports/First_Director_Meeting_Resolution.jrxml");
			InputStream employeeReportStream  = new FileInputStream(file);
			JasperReport jasperReport = JasperCompileManager.compileReport(employeeReportStream);
			List<Employee> emp = employeeDao.getAllEmployees();
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource (emp);
			
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("createdBy", "Huanping");
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
			
			if ("pdf".equalsIgnoreCase(reportFormat)) {
				JasperExportManager.exportReportToPdfFile(jasperPrint, fileDirectory + fileName);
				return JasperExportManager.exportReportToPdf(jasperPrint);
			}
			// export to pdf
			//JRPdfExporter exporter = new JRPdfExporter();
			 
		} catch (JRException jre) {
			jre.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
}
