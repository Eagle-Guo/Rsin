package sg.com.rsin.service;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyStatusTime;

public interface PendingStepService {
	public Company getCompany (String userEmail, String companyId);

	public CompanyStatusTime getCompanyStatusTime (String userEmail, String companyId);
}
