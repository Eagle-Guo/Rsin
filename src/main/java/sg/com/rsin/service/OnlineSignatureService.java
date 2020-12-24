package sg.com.rsin.service;

import java.util.Map;

public interface OnlineSignatureService {
	public Map<String, Object> getAllPageData (String userEmail);
	
	public Map<String, Object> getCompanyPageData (String userEmail, String companyId);
}
