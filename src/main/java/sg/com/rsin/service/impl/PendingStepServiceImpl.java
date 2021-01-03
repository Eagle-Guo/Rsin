package sg.com.rsin.service.impl;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.PendingStepService;

@Service
public class PendingStepServiceImpl implements PendingStepService {
	
	@Autowired
	CommonDataService commonDataService; 

	@Autowired
	CompanyStatusTimeRepository companyStatusTimeRepository;
	
	@SuppressWarnings("unchecked")
	public Company getCompany (String userEmail, String companyId) {
		Map<String, Object> pageData = commonDataService.getAllCompanyUserData(userEmail);
		Set<Company> companies = (Set<Company>) pageData.get("companies");
		return companies.stream().filter(com -> com.getId().toString().equals(companyId)).findFirst().get();
	}
	
	public CompanyStatusTime getCompanyStatusTime (String userEmail, String companyId) {
		Company company = getCompany(userEmail, companyId);
		return companyStatusTimeRepository.findByCompanyId(company.getId());
		
	}
}
