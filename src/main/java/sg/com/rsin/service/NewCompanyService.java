package sg.com.rsin.service;

import java.util.List;
import java.util.Map;

import sg.com.rsin.entity.Company;

public interface NewCompanyService {
	public long addCompany (String receivedData);

	public long addCompanyWithoutAccount(String receivedData); 

	public Company findCompany (long companyId);

	public void saveCompany (Company company);

	public Map<String, List<String>> getShareholderSignatureStatus(Long companyId);

	public String listSignedUserName(Map<String, List<String>> signedDocs, String documentType);
}
