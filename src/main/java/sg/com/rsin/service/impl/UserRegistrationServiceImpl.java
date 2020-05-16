package sg.com.rsin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jdk.internal.jline.internal.Log;
import sg.com.rsin.dao.EmployeeDao;
import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.entity.ErrorObject;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.enums.ErrorCode;
import sg.com.rsin.enums.ResponseCode;
import sg.com.rsin.enums.UserStatus;
import sg.com.rsin.service.EmployeeService;
import sg.com.rsin.service.UserRegistrationService;

@Service
public class UserRegistrationServiceImpl implements UserRegistrationService {

	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	private JdbcUserDetailsManager jdbcUserDetailsManager;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	UserRegistrationRepository userRegistrationRepository;

	@Override
	public CommonResponse addNewRegistrationUser(UserRegistration userRegistrationObject) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

		List<ErrorObject> errorList = new ArrayList<ErrorObject>();
		CommonResponse response = new CommonResponse();
		if (userRegistrationObject.getEmail() == null) {
			errorList.add(new ErrorObject("Email is not null"));
		} 
		if (userRegistrationObject.getPassword() == null) {
			errorList.add(new ErrorObject("Password is not null"));
		}
		if (userRegistrationObject.getLastName() == null) {
			errorList.add(new ErrorObject("Last name is not null"));
		}
		if (userRegistrationObject.getFirstName() == null) {
			errorList.add(new ErrorObject("First name is not null"));
		}
		if (errorList.size() >0 ) {
			response.setResponseCode(ResponseCode.VALIDATE_NULL_VALUES);
			response.setErrorList(errorList);
			return response;
		}
		String encodedPassword = bCryptPasswordEncoder.encode(userRegistrationObject.getPassword());

		userRegistrationObject.setPassword(encodedPassword);
		userRegistrationObject.setStatus(UserStatus.ACTIVE);
		try {
			userRegistrationRepository.save(userRegistrationObject);
		} catch (Exception ex) {
			response.setResponseCode(ResponseCode.SAVE_INTO_DB_ERROR);
			errorList.add(new ErrorObject("Save user Registration into DB error"));
			response.setErrorList(errorList);
			return response;
		}
//		User user = new User(userRegistrationObject.getEmail(), encodedPassword, authorities);
//		jdbcUserDetailsManager.createUser(user);
		response.setResponseCode(ResponseCode.SUCCESS);
		return response;
	}

	public void insertEmployees(List<Employee> employees) {
		employeeDao.insertEmployees(employees);
	}

	public List<Employee> getAllEmployees() {
		return employeeDao.getAllEmployees();
	}

	public void getEmployeeById(String empId) {
		Employee employee = employeeDao.getEmployeeById(empId);
		System.out.println(employee);
	}

}