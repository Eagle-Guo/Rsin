package sg.com.rsin.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.entity.ErrorObject;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.enums.ResponseCode;
import sg.com.rsin.service.EmployeeService;
import sg.com.rsin.service.OnlineSignatureService;
import sg.com.rsin.service.UserRegistrationService;

@Controller
public class ViewController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	UserRegistrationService userRegistrationService;
	
	@Autowired
	OnlineSignatureService onlineSignatureService;

	@RequestMapping("/")
	public ModelAndView allPage() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("/userWelcome")
	public ModelAndView userPage() {
		return new ModelAndView("userWelcome");
	}
	
	@RequestMapping("/adminWelcome")
	public ModelAndView adminPage() {
		return new ModelAndView("adminWelcome");
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

	@RequestMapping("/mybusiness/licenseApplication")
	public ModelAndView licenseApplication() {
		ModelAndView model = new ModelAndView("mybusiness/licenseApplication");
		return model;
	}	
	
	@RequestMapping("/mybusiness/GSTApplication")
	public ModelAndView GSTApplication() {
		ModelAndView model = new ModelAndView("mybusiness/GSTApplication");
		return model;
	}	

	@RequestMapping("/mybusiness/annualReview")
	public ModelAndView annualReview() {
		ModelAndView model = new ModelAndView("mybusiness/annualReview");
		return model;
	}	
	
	@RequestMapping("/mybusiness/accountingServices")
	public ModelAndView accountingServices() {
		ModelAndView model = new ModelAndView("mybusiness/accountingServices");
		return model;
	}	
	
	@RequestMapping("/mybusiness/callService")
	public ModelAndView callService() {
		ModelAndView model = new ModelAndView("mybusiness/callService");
		return model;
	}	
	
	@RequestMapping("/mybusiness/officeService")
	public ModelAndView officeService() {
		ModelAndView model = new ModelAndView("mybusiness/officeService");
		return model;
	}	
	
	@RequestMapping("/mybusiness/myRecord")
	public ModelAndView myRecord(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		ModelAndView model = new ModelAndView("mybusiness/myRecord");
		
		Map<String, Object> pageData = onlineSignatureService.getAllPageData(userEmail);
		model.addObject("companies", pageData.get("companies"));
		
		return model;
	}	
	
	@RequestMapping("/mybusiness/downLoadFile")
	public ModelAndView downLoadFile() {
		ModelAndView model = new ModelAndView("mybusiness/downLoadFile");
		return model;
	}		
		
	@RequestMapping("/mybusiness/admin_record")
	public ModelAndView admin_record() {
		ModelAndView model = new ModelAndView("mybusiness/admin_record");
		return model;
	}	
	
	
	@RequestMapping("/onekey/oneKeyService")
	public ModelAndView oneKeyService() {
		ModelAndView model = new ModelAndView("onekey/oneKeyService");
		return model;
	}
	
	@RequestMapping("/notice/notice")
	public ModelAndView notice() {
		ModelAndView model = new ModelAndView("notice/notice");
		return model;
	}
	@RequestMapping("/notice/admin_notice")
	public ModelAndView admin_notice() {
		ModelAndView model = new ModelAndView("notice/admin_notice");
		return model;
	}
	@RequestMapping("/notice/admin_notice_create")
	public ModelAndView admin_notice_create() {
		ModelAndView model = new ModelAndView("notice/admin_notice_create");
		return model;
	}			
	
	@RequestMapping("/annualReviewList")
	public ModelAndView annualReviewList() {
		ModelAndView model = new ModelAndView("todolist/annualReviewList");
		return model;
	}	

	@RequestMapping("/toDoList")
	public ModelAndView toDoList(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		ModelAndView model = new ModelAndView("todolist/toDoList");
		
		Map<String, Object> pageData = onlineSignatureService.getAllPageData(userEmail);
		model.addObject("companies", pageData.get("companies"));

		return model;
	}	

	@RequestMapping("/todolist/admin_toDoList")
	public ModelAndView admin_toDoList() {
		ModelAndView model = new ModelAndView("todolist/admin_toDoList");
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/notFinishStep")
	public ModelAndView notFinishStep(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getParameter("compid");
		ModelAndView model = new ModelAndView("todolist/notFinishStep");
		
		Map<String, Object> pageData = onlineSignatureService.getAllPageData(userEmail);
		Set<Company> companies = (Set<Company>) pageData.get("companies");
		Company company = companies.stream().filter(com -> com.getId().toString().equals(companyId)).findFirst().get();
		model.addObject("company", company);
		return model;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/onlineSignature")
	public ModelAndView onlineSignature(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		ModelAndView model = new ModelAndView("todolist/onlineSignature");
		
		Map<String, Object> pageData = onlineSignatureService.getAllPageData(userEmail);
		model.addObject("companyName", pageData.get("companyName"));
		model.addObject("address", pageData.get("address"));
		
		Map<String, Integer> shareholderAndStockMap = (Map<String, Integer>) pageData.get("shareholderAndStock");
		StringBuffer shareholders = new StringBuffer();
		
		shareholderAndStockMap.forEach((k, v) -> shareholders.append("<span> ").append(k).append("</span>").append("<span> ").append(v).append("</span> <br/>"));
		shareholders.append("<span>Total:</span> <span> ").append(pageData.get("totalStockAmount")).append("</span>");
		
		model.addObject("shareholderAndStock", shareholders); 
		return model;
	}	

	@RequestMapping("/uploadPage")
	public ModelAndView uploadPage() {
		ModelAndView model = new ModelAndView("todolist/uploadPage");
		return model;
	}		
	@RequestMapping("/schedule")
	public ModelAndView schedule() {
		ModelAndView model = new ModelAndView("todolist/schedule");
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
