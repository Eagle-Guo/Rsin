package sg.com.rsin.service;

import java.util.Map;
import java.util.Set;

import sg.com.rsin.vo.CompanyDto;

public interface CommonDataService {
	public Map<String, Object> getAllCompanyUserData(String userEmail);

	public Map<String, Object> getSingleCompanyUserData(String userEmail, String companyId);
	
	public String getUserId (String userId, String companyShareholderInfoId);
	
	public Set<CompanyDto> getAllPendingCompanies();
	
	public Set<CompanyDto> getAllCompanies();
}
