package sg.com.rsin.service;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyStatusTime;

public interface AdminManageCompanyService {
	public Company getCompany (String userEmail, String companyId);
}
