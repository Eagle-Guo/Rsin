package sg.com.rsin.service;

import java.util.List;
import java.util.Map;

import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;

public interface AdminManageCompanyService {
	public List<String> getShareholders(Long companyId);
	
	public List<String> getDirectors(Long companyId);
	
	public Map<String, List<DocumentHistory>> getCompanyDocumentListWithDetail(Long companyId);
	public List<Document> getCompanyDocumentList(Long companyId);
	
	public Map<String, List<DocumentHistory>> getPersonalDocumentListWithDetail(Long companyId);
	public List<Document> getPersonalDocumentList(Long companyId);
	
	public List<CompanyShareholderInfo> getCompanyShareholders(Long companyId);
}
