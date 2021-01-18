package sg.com.rsin.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import sg.com.rsin.entity.Company;

public interface CommonDataService {
	public Map<String, Object> getAllCompanyUserData(String userEmail);

	public Map<String, Object> getSingleCompanyUserData(String userEmail, String companyId);
	
	public String getUserId (String userId, String companyShareholderInfoId);
	
	public Set<Company> getAllPendingCompanies();
	
	public List<Company> getAllCompanies();
}
