package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyServiceRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.service.CommonDataService;

@Service
public class CommonDataServiceImpl implements CommonDataService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	CompanyServiceRepository companyServiceRepository;
	
	@Autowired
	CompanyStatusTimeRepository companyStatusTimeRepository;

	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;
	
	public Map<String, Object> getAllCompanyUserData(String userEmail) {
		if (userEmail == null || "".equals(userEmail)) {
			return null;
		}

		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareholderInfoRepository.findByEmailOrderById(userEmail);
		// This user not belong to any company
		if (userCompanyShareholderInfos == null) {
			return null;
		}

		Map<String, Object> pageData = new HashMap<String, Object>();
		
		List<CompanyShareholderInfo> allCompanyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		Set<Company> allCompanies = new LinkedHashSet<Company>();

		//Get All shareholderInfoa for this user's all companies
		userCompanyShareholderInfos.stream().forEach(info -> {
			allCompanyShareholderInfos.addAll(companyShareholderInfoRepository.findByCompanyId(info.getCompany().getId()));
		});
		
		for(CompanyShareholderInfo companyShareholderInfo : allCompanyShareholderInfos) {
			allCompanies.add(companyShareholderInfo.getCompany());
		}
		//pageData.put("allCompanyShareholderInfos",  allCompanyShareholderInfos);
		pageData.put("companies", allCompanies);
		return pageData;
	}

	public Map<String, Object> getSingleCompanyUserData(String userEmail, String companyId) {
		if (userEmail == null || "".equals(userEmail)) {
			return null;
		}

		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareholderInfoRepository.findByEmailOrderById(userEmail);
		// This user not belong to any company
		if (userCompanyShareholderInfos == null) {
			return null;
		}

		long companyIdlong = Long.parseLong(companyId);
		Map<String, Object> pageData = new HashMap<String, Object>();
		Company selfCompany = null;
		CompanyService selfCompanyService = null;
		CompanyShareholderInfo selfCompanyShareholderInfo = null;

		// Get the need access company shareholder info
		if (companyId != null) {
			selfCompanyShareholderInfo = 
					userCompanyShareholderInfos.stream()
					.filter(self -> self.getCompany().getId().longValue() == companyIdlong)
					.findFirst().get();
		}
		//selfCompanyShareholderInfo is null then either this company not exited or user don't have access
		if (selfCompanyShareholderInfo == null) {
			return null;
		}
		selfCompanyService = companyServiceRepository.findByCompanyId(companyIdlong);
		
		List<CompanyShareholderInfo> allCompanyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		List<CompanyShareholderInfo> sameCompanyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		Set<Company> allCompanies = new HashSet<Company>();

		//Get All shareholderInfoa for this user's all companies
		userCompanyShareholderInfos.stream().forEach(info -> {
			allCompanyShareholderInfos.addAll(companyShareholderInfoRepository.findByCompanyId(info.getCompany().getId()));
		});
		
		int total = 0;
		Map<String, Integer> shareholderAndStock = new HashMap<String, Integer>();
		for(CompanyShareholderInfo companyShareholderInfo : allCompanyShareholderInfos) {
			allCompanies.add(companyShareholderInfo.getCompany());

			if (companyShareholderInfo.getCompany().getId() == companyIdlong) {
				pageData.put("companyName", companyShareholderInfo.getCompany().getName());
				pageData.put("address", companyShareholderInfo.getCompany().getAddress());
				pageData.put("companyId", companyShareholderInfo.getCompany().getId());
				selfCompany = companyShareholderInfo.getCompany();
				sameCompanyShareholderInfos.add(companyShareholderInfo);
				shareholderAndStock.put(companyShareholderInfo.getName(), companyShareholderInfo.getIssueStockAmount());
				total = total + companyShareholderInfo.getIssueStockAmount();
			}

		}
		
		pageData.put("shareholderName", selfCompanyShareholderInfo.getName());
		pageData.put("shareholderAddress", selfCompanyShareholderInfo.getAddress());
		pageData.put("shareholderAndStock", shareholderAndStock);
		pageData.put("totalStockAmount", total);
		//pageData.put("allCompanyShareholderInfos",  allCompanyShareholderInfos);
		pageData.put("selfCompanyShareholderInfo", selfCompanyShareholderInfo);
		pageData.put("sameCompanyShareholderInfos", sameCompanyShareholderInfos);
		pageData.put("selfCompany", selfCompany);
		pageData.put("companyService", selfCompanyService);
		pageData.put("companies", allCompanies);
		return pageData;
	}
	
	public String getUserId (String userId, String companyShareholderInfoId) {
		//TODO do the validation that userid have access to this shareholder record
		return companyShareholderInfoRepository.findById(Long.parseLong(companyShareholderInfoId)).getEmail();
	}
	
	public Set<Company> getAllPendingCompany() {
		List<CompanyStatusTime> companyStatusTimes = companyStatusTimeRepository.findByPaymentNotNullOrSignatureNotNullOrUploadfileStatusNotNull();
		if (companyStatusTimes == null) {
			return null;
		}

		Set<Company> allCompanies = new LinkedHashSet<Company>();

		companyStatusTimes.stream().forEach(time -> {
			Company company = new Company();
			company.setActivityOne(time.getCompany().getActivityOne());
			company.setActivityTwo(time.getCompany().getActivityTwo());
			company.setActualStockCapital(time.getCompany().getActualStockCapital());
			company.setAddress(time.getCompany().getAddress());
			company.setBackupName(time.getCompany().getBackupName());
			company.setCreatedDate(time.getCompany().getCreatedDate()); 
			company.setId(time.getCompany().getId()); 
			company.setName(time.getCompany().getName()); 
			company.setType(time.getCompany().getType());
			allCompanies.add(company);
		});
		
		return allCompanies;
	}
}
