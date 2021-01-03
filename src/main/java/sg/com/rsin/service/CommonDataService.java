package sg.com.rsin.service;

import java.util.Map;

public interface CommonDataService {
	public Map<String, Object> getAllCompanyUserData(String userEmail);

	public Map<String, Object> getSingleCompanyUserData(String userEmail, String companyId);
}
