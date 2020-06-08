package sg.com.rsin.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.entity.ErrorObject;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.enums.ResponseCode;
import sg.com.rsin.service.EmployeeService;
import sg.com.rsin.service.UserRegistrationService;

@Controller
public class ViewController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	UserRegistrationService userRegistrationService;

	@RequestMapping("/")
	public ModelAndView allPage() {
		return new ModelAndView("userWelcome");
	}
	
	@RequestMapping("/userWelcome")
	public ModelAndView firstPage() {
		return new ModelAndView("userWelcome");
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("registration", "userRegistration", new UserRegistration());
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public ModelAndView error() {
		return new ModelAndView("error/error");
	}
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView error404() {
		return new ModelAndView("error/404");
	}
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public ModelAndView error500() {
		return new ModelAndView("error/500");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegister(Model model, @ModelAttribute("userRegistration") UserRegistration userRegistrationObject) {
		CommonResponse response = userRegistrationService.addNewRegistrationUser(userRegistrationObject);
		if (response.getResponseCode().equals(ResponseCode.SUCCESS)) {
			//return new ModelAndView("redirect:/login");
			return "login";
		} else {
			List<ErrorObject> errors =  response.getErrorList();
			errors.get(0).getErrorMessage();
			model.addAttribute("errorMsg", errors.stream().map(x-> x.getErrorMessage()).collect(Collectors.toList()));
			return "registration";
		}
	}

	@RequestMapping(value = "/addNewEmployee", method = RequestMethod.GET)
	public ModelAndView show() {
		return new ModelAndView("addEmployee", "emp", new Employee());
	}

	@RequestMapping(value = "/addNewEmployee", method = RequestMethod.POST)
	public ModelAndView processRequest(@ModelAttribute("emp") Employee emp) {

		employeeService.insertEmployee(emp);
		List<Employee> employees = employeeService.getAllEmployees();
		ModelAndView model = new ModelAndView("getEmployees");
		model.addObject("employees", employees);
		return model;
	}

	@RequestMapping("/getEmployees")
	public ModelAndView getEmployees() {
		List<Employee> employees = employeeService.getAllEmployees();
		ModelAndView model = new ModelAndView("getEmployees");
		model.addObject("employees", employees);
		return model;
	}
	
	@RequestMapping("/mybusiness/newCompany")
	public ModelAndView newCompany() {
		ModelAndView model = new ModelAndView("mybusiness/newCompany");
		return model;
	}
	
	@RequestMapping("/mybusiness/openAccount")
	public ModelAndView openAccount() {
		ModelAndView model = new ModelAndView("mybusiness/openAccount");
		return model;
	}
	
	@RequestMapping("/coming")
	public ModelAndView coming() {
		ModelAndView model = new ModelAndView("coming");
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null && !"".equals(error)) {
			model.addAttribute("errorMsg", "您的用户名或者密码不正确！");
		}

		if (logout != null) {
			model.addAttribute("msg", "您已经成功退出！");
		}
		return "login";
	}
	
	@RequestMapping(value = "/view/registerNewCompany", method = RequestMethod.POST)
	public ModelAndView registerNewCompny(Model model) {
		ModelAndView view = new ModelAndView("mybusiness/newCompany");
		return view;
	}

}
