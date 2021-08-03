package sg.com.rsin.service;

import java.util.List;
import java.util.Optional;

import sg.com.rsin.entity.CompanyShareholderInfo;

public interface ShareholderInfoService {
	public List<CompanyShareholderInfo> getAllShareholderInfoByCompanyId(Long companyId);

	public Optional<CompanyShareholderInfo> getShareholderInfoById(Long Id);

	public void saveShareholderInfo(CompanyShareholderInfo info);
	
	public List<CompanyShareholderInfo> getShareholderInfoByNameAndCompanyId(String name, Long companyId);

	public String getShareholderNames(String type, Long companyId);
}
