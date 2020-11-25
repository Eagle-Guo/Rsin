package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.service.OnlineSignatureService;

@Service
public class OnlineSignatureServiceImpl implements OnlineSignatureService {

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;

	public Map<String, Object> getAllPageData (String userEmail) {
		if (userEmail == null || "".equals(userEmail)) {
			return new HashMap<String, Object>();
		}
		Map<String, Object> pageData = new HashMap<String, Object>();
		
		List<CompanyShareholderInfo> userCompanyShareholderInfos = companyShareholderInfoRepository.findByEmail(userEmail);
		List<CompanyShareholderInfo> companyShareholderInfos = new ArrayList<CompanyShareholderInfo>();
		
		userCompanyShareholderInfos.parallelStream().forEach(info -> {
			companyShareholderInfos.addAll(companyShareholderInfoRepository.findByCompanyId(info.getCompany().getId()));
		});
		 
		int total = 0;
		Map<String, Integer> shareholderAndStock = new HashMap<String, Integer>();
		for(CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			
			if (total == 0) {
				Optional<Company> company = companyRepository.findById(companyShareholderInfo.getCompany().getId());
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
		return pageData;
	}
	
}
