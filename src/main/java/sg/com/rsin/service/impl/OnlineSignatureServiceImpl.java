package sg.com.rsin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
	
	public void getAllPageData (ModelAndView model, String userEmail) {
		
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByDescription(userEmail);
		
		for(CompanyShareholderInfo companyShareholderInfo : companyShareholderInfos) {
			List<CompanyInfo> companyInfos = companyInfoRepository.findByCompanyId(companyShareholderInfo.getNewCompany().getId());
			for (CompanyInfo companyInfo : companyInfos) {
				if ("公司名称".equals(companyInfo.getName())) {
					model.addObject("companyName", companyInfo.getDescription());
					break;
				}
			}
			List<CompanyShareholderInfo> CompanyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyShareholderInfo.getNewCompany().getId());
			for (CompanyShareholderInfo shareholderInfo : CompanyShareholderInfos) {
				if ("个人地址及邮编".equals(shareholderInfo.getName())) {
					model.addObject("address", shareholderInfo.getDescription());
					break;
				}
			}
		}
	}
	
}
