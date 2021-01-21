package sg.com.rsin.service;

import java.util.List;

import sg.com.rsin.entity.CompanyShareholderInfo;

public interface ShareholderInfoService {
	public List<CompanyShareholderInfo> getAllShareholderInfoByCompanyId(Long companyId);
}
