package sg.com.rsin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.CompanyShareholderInfoRepository;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.service.ShareholderInfoService;

@Service
public class ShareholderInfoServiceImpl implements ShareholderInfoService {

	@Autowired
	CompanyShareholderInfoRepository companyShareholderInfoRepository;
	
	private final Logger logger = LoggerFactory.getLogger(ShareholderInfoServiceImpl.class);

	public List<CompanyShareholderInfo> getAllShareholderInfoByCompanyId(Long companyId){
		
		companyShareholderInfoRepository.findByCompanyId(companyId);
		return null;
	}
}