package sg.com.rsin.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
		
		return companyShareholderInfoRepository.findByCompanyId(companyId);
	}
	
	public Optional<CompanyShareholderInfo> getShareholderInfoById(Long id) {
		logger.info("looking for shareholder info with id " + id);
		Optional<CompanyShareholderInfo> info = companyShareholderInfoRepository.findById(id);
		return info;
	}
	
	public void saveShareholderInfo (CompanyShareholderInfo info) {
		companyShareholderInfoRepository.save(info);
	}
	
	public List<CompanyShareholderInfo> getShareholderInfoByNameAndCompanyId(String name, Long companyId) {
		logger.info("looking for shareholder info with name " + name + " and company id " + companyId);
		List <CompanyShareholderInfo> info = companyShareholderInfoRepository.findByNameAndCompanyId(name, companyId);
		return info;
	}
	
	public String getShareholderNames(String type, Long companyId) {
		logger.info("get the shareholder name from company " + companyId + " with type " + type);
		List<CompanyShareholderInfo> companyShareholderInfos = companyShareholderInfoRepository.findByCompanyId(companyId);
		List<String> names = companyShareholderInfos.stream().filter(name -> name.getPositionType().contains(type)).map (info ->info.getName()).collect(Collectors.toList());
		return names.toString();
	}
}