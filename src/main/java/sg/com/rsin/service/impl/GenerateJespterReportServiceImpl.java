package sg.com.rsin.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.service.GenerateJespterReportService;

@Service
public class GenerateJespterReportServiceImpl implements GenerateJespterReportService {
	
	@Autowired
	EmployeeDao employeeDao;
	
	public byte[] exportReport(String reportFormat) {
		try { 
			File file = ResourceUtils.getFile("classpath:reports/newCompanyReport_1.jrxml");
			InputStream employeeReportStream  = new FileInputStream(file);
			JasperReport jasperReport = JasperCompileManager.compileReport(employeeReportStream);
			List<Employee> emp = employeeDao.getAllEmployees();
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource (emp);
			
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("title", "Employee Report");
			parameters.put("minSalary", 15000.0);
			parameters.put("createdBy", "Huanping");
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
			
			if ("pdf".equalsIgnoreCase(reportFormat)) {
				JasperExportManager.exportReportToPdfFile(jasperPrint, "D:\\FirstPDF.pdf");
				return JasperExportManager.exportReportToPdf(jasperPrint);
			}
			// export to pdf
			//JRPdfExporter exporter = new JRPdfExporter();
			 
			/*
			 * exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			 * exporter.setExporterOutput( new
			 * SimpleOutputStreamExporterOutput("employeeReport.pdf"));
			 * 
			 * SimplePdfReportConfiguration reportConfig = new
			 * SimplePdfReportConfiguration(); reportConfig.setSizePageToContent(true);
			 * reportConfig.setForceLineBreakPolicy(false);
			 * 
			 * SimplePdfExporterConfiguration exportConfig = new
			 * SimplePdfExporterConfiguration(); exportConfig.setMetadataAuthor("baeldung");
			 * exportConfig.setEncrypted(true);
			 * exportConfig.setAllowedPermissionsHint("PRINTING");
			 * 
			 * exporter.setConfiguration(reportConfig);
			 * exporter.setConfiguration(exportConfig);
			 * 
			 * exporter.exportReport();
			 */
			 
		} catch (JRException jre) {
			jre.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
}
