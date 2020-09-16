package sg.com.rsin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyInfoRepository;
import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.entity.CompanyInfo;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.service.OnlineSignatureService;

@Service
public class OnlineSignatureServiceImpl implements OnlineSignatureService {

	@Autowired
	CompanyInfoRepository companyInfoRepository;
	
	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;
	
	public Map<String, String> getAllPageData (String userEmail) {
		if (userEmail == null || "".equals(userEmail)) {
			return new HashMap<String, String>();
		}
		Map<String, String> pageData = new HashMap<String, String>();
		
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByDescription(userEmail);
		
		for(CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			List<CompanyInfo> companyInfos = companyInfoRepository.findByCompanyId(companyShareholderInfo.getNewCompany().getId());
			for (CompanyInfo companyInfo : companyInfos) {
				if ("公司名称".equals(companyInfo.getName())) {
					pageData.put("companyName", companyInfo.getDescription());
					break;
				}
			}
			List<CompanyShareholderInfo> CompanyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyShareholderInfo.getNewCompany().getId());
			for (CompanyShareholderInfo shareholderInfo : CompanyShareholderInfos) {
				if ("个人地址及邮编".equals(shareholderInfo.getName())) {
					pageData.put("address", shareholderInfo.getDescription());
					break;
				}
			}
			
			pageData.put("companyId", companyShareholderInfo.getNewCompany().getId().toString());
			
		}
		return pageData;
	}
	
}
