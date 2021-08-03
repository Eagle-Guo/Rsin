package sg.com.rsin.service;

import java.util.Map;
import java.util.Set;

import sg.com.rsin.vo.CompanyDto;
import sg.com.rsin.vo.CompanyShareholderDto;

public interface CommonDataService {
	public Map<String, Object> getUserAllCompanyUserData(String userEmail);

	public Map<String, Object> getUserSingleCompanyUserData(String userEmail, String companyId);
	
	public Map<String, Object> getSingleCompanyUserData(String companyId);
	
	public String getUserId (String userId, String companyShareholderInfoId);
	
	public Set<CompanyDto> getAllPendingCompanies();
	
	public Set<CompanyDto> getAllCompanies();
	
	public Set<CompanyShareholderDto> getAllShareholders();
}
