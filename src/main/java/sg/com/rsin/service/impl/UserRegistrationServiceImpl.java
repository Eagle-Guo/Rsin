package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.dao.RoleRepository;
import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.dao.UserRoleRepository;
import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.ErrorObject;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.entity.UserRole;
import sg.com.rsin.enums.ResponseCode;
import sg.com.rsin.enums.UserStatus;
import sg.com.rsin.service.UserRegistrationService;

@Service
public class UserRegistrationServiceImpl implements UserRegistrationService {

	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	private PasswordEncoder  passwordEncoder;
	
	@Autowired
	UserRegistrationRepository userRegistrationRepository;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@Override
	public CommonResponse addNewRegistrationUser(UserRegistration userRegistrationObject) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

		List<ErrorObject> errorList = new ArrayList<ErrorObject>();
		CommonResponse response = new CommonResponse();
		if (userRegistrationObject.getEmail() == null) {
			errorList.add(new ErrorObject("邮箱为空，请重新输入！"));
		} 
		if (userRegistrationObject.getPassword() == null) {
			errorList.add(new ErrorObject("密码为空，请重新输入！"));
		}
		if (userRegistrationObject.getLastName() == null || 
			userRegistrationObject.getFirstName() == null) {
			errorList.add(new ErrorObject("姓名密码为空，请重新输入！"));
		}
		// if user existed
		if (userRegistrationRepository.findByEmail(userRegistrationObject.getEmail()).size() > 0) {
			errorList.add(new ErrorObject("该用户已经注册，请重新输入！"));
		}
		
		if (errorList.size() > 0 ) {
			response.setResponseCode(ResponseCode.VALIDATE_NULL_VALUES);
			response.setErrorList(errorList);
			return response;
		}
		String encodedPassword = passwordEncoder.encode(userRegistrationObject.getPassword());

		userRegistrationObject.setPassword(encodedPassword);
		userRegistrationObject.setStatus(UserStatus.ACTIVE);
		userRegistrationObject.setUsername(userRegistrationObject.getEmail());
		userRegistrationObject.setRegDate(new Date());
		
		try {
			userRegistrationRepository.save(userRegistrationObject);
		} catch (Exception ex) {
			System.out.println(ex.getLocalizedMessage());
			System.out.println(ex.getMessage());
			System.out.println(ex.getCause().getLocalizedMessage());
			System.out.println(ex.getCause().getMessage());	
			response.setResponseCode(ResponseCode.SAVE_INTO_DB_ERROR);
			errorList.add(new ErrorObject("保存注册信息异常，请联系我们的管理员"));
			response.setErrorList(errorList);
			return response;
		}
		// add to the user_role table
		UserRole userRole = new UserRole();
		userRole.setUserId(userRegistrationObject.getId());
		userRole.setRoleId(roleRepository.findByName("ROLE_USER").stream().findFirst().get().getId());
		userRoleRepository.save(userRole);
		response.setResponseCode(ResponseCode.SUCCESS);
		return response;
	}

}