package sg.com.rsin.controllers;

import java.util.ArrayList;
import java.util.List;

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

import sg.com.rsin.model.Employee;
import sg.com.rsin.model.UserRegistration;
import sg.com.rsin.service.EmployeeService;

@Controller
public class ViewController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private JdbcUserDetailsManager jdbcUserDetailsManager;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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
		return new ModelAndView("registration", "user", new UserRegistration());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegister(@ModelAttribute("user") UserRegistration userRegistrationObject) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

		String encodedPassword = bCryptPasswordEncoder.encode(userRegistrationObject.getPassword());

		User user = new User(userRegistrationObject.getEmail(), encodedPassword, authorities);
		jdbcUserDetailsManager.createUser(user);
		return new ModelAndView("redirect:/login");
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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null) {
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
