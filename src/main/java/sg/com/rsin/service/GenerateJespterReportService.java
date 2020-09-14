package sg.com.rsin.service;

public interface GenerateJespterReportService {
	public String getCompanyId (String userid);
	public byte[] exportReport(String reportFormat, String companyId, String fileName);
}
