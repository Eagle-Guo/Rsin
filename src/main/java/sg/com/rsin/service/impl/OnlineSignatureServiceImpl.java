package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyServiceRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.service.OnlineSignatureService;

@Service
public class OnlineSignatureServiceImpl implements OnlineSignatureService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	CompanyServiceRepository companyServiceRepository;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;

	public Map<String, Object> getAllPageData (String userEmail) {
		if (userEmail == null || "".equals(userEmail)) {
			return new HashMap<String, Object>();
		}
		Map<String, Object> pageData = new HashMap<String, Object>();
		
		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareholderInfoRepository.findByEmail(userEmail);
		List<CompanyShareholderInfo> companyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		Set<Company> companies = new HashSet<Company>();

		//Get All shareholderInfo for this user's companies
		userCompanyShareholderInfos.parallelStream().forEach(info -> {
			companyShareholderInfos.addAll(companyShareholderInfoRepository.findByCompanyId(info.getCompany().getId()));
		});
		
		int total = 0;
		Map<String, Integer> shareholderAndStock = new HashMap<String, Integer>();
		for(CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			Optional<Company> company = companyRepository.findById(companyShareholderInfo.getCompany().getId());
			companies.add(company.get());
			if (total == 0) {
				pageData.put("companyName", company.get().getName());
				pageData.put("address", company.get().getAddress());
				pageData.put("companyId", company.get().getId().toString());
			}

			shareholderAndStock.put(companyShareholderInfo.getName(), companyShareholderInfo.getIssueStockAmount());
			total = total + companyShareholderInfo.getIssueStockAmount();
		}
		pageData.put("shareholderName", userCompanyShareholderInfos.get(0).getName());
		pageData.put("shareholderAddress", userCompanyShareholderInfos.get(0).getAddress());
		pageData.put("shareholderAndStock", shareholderAndStock);
		pageData.put("totalStockAmount", total);
		pageData.put("sameCompanyShareholderInfos", companyShareholderInfos);
		pageData.put("companies", companies);
		return pageData;
	}
	
	public Map<String, Object> getCompanyPageData (String userEmail, String companyId) {
		if (userEmail == null || "".equals(userEmail)) {
			return new HashMap<String, Object>();
		}
		Map<String, Object> pageData = new HashMap<String, Object>();

		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareholderInfoRepository.findByEmail(userEmail);
		CompanyService companyService = null;
		CompanyShareholderInfo selfCompanyShareholderInfo = null;
		if (companyId != null) {
			selfCompanyShareholderInfo = 
					userCompanyShareholderInfos.stream()
					.filter(self -> self.getCompany().getId().longValue() == Long.parseLong(companyId))
					.findFirst().get();
			companyService = companyServiceRepository.findByCompanyId(selfCompanyShareholderInfo.getCompany().getId());
		}
		
		List<CompanyShareholderInfo> companyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		Set<Company> companies = new HashSet<Company>();

		//Get All shareholderInfoa for this user's all companies
		userCompanyShareholderInfos.parallelStream().forEach(info -> {
			companyShareholderInfos.addAll(companyShareholderInfoRepository.findByCompanyId(info.getCompany().getId()));
		});
		
		int total = 0;
		Map<String, Integer> shareholderAndStock = new HashMap<String, Integer>();
		for(CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			companies.add(companyShareholderInfo.getCompany());
			if (total == 0) {
				pageData.put("companyName", companyShareholderInfo.getCompany().getName());
				pageData.put("address", companyShareholderInfo.getCompany().getAddress());
				pageData.put("companyId", companyShareholderInfo.getCompany().getId());
			}

			shareholderAndStock.put(companyShareholderInfo.getName(), companyShareholderInfo.getIssueStockAmount());
			total = total + companyShareholderInfo.getIssueStockAmount();
		}
		
		pageData.put("shareholderName", userCompanyShareholderInfos.get(0).getName());
		pageData.put("shareholderAddress", userCompanyShareholderInfos.get(0).getAddress());
		pageData.put("shareholderAndStock", shareholderAndStock);
		pageData.put("totalStockAmount", total);
		pageData.put("sameCompanyShareholderInfos", companyShareholderInfos);
		pageData.put("selfCompanyShareholderInfo", selfCompanyShareholderInfo);
		pageData.put("companies", companies);
		pageData.put("companyService", companyService);
		return pageData;
	}
	
}
