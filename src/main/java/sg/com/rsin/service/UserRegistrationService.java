package sg.com.rsin.service;

import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.UserRegistration;

public interface UserRegistrationService {

	public CommonResponse addNewRegistrationUser(UserRegistration userRegistrationObject);
	
}
