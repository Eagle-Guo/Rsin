package sg.com.rsin.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.entity.CommonResponse;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.entity.ErrorObject;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineAddition;
import sg.com.rsin.entity.UserRegistration;
import sg.com.rsin.enums.ResponseCode;
import sg.com.rsin.enums.TimeLineType;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.EmployeeService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.service.AdminManageCompanyService;
import sg.com.rsin.service.AdminTimelineService;
import sg.com.rsin.service.UserRegistrationService;
import sg.com.rsin.vo.OnlineSignatureVO;

@Controller
public class ViewController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	UserRegistrationService userRegistrationService;
	
	@Autowired
	CommonDataService commonDataService;

	@Autowired
	AdminManageCompanyService adminManageCompanyService;
	@Autowired
	AdminTimelineService adminTimelineService;

	@Autowired
	CompanyRepository companyRepository;
	@Autowired
	NewCompanyService newCompanyService;

	@Autowired
	CompanyStatusTimeRepository companyStatusTimeRepository;

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

		Map<String, Object> pageData = commonDataService.getAllCompanyUserData(userEmail);
		model.addObject("companies", pageData.get("companies"));

		return model;
	}	

	@RequestMapping("/mybusiness/downLoadFile")
	public ModelAndView downLoadFile() {
		ModelAndView model = new ModelAndView("mybusiness/downLoadFile");
		return model;
	}	
	@RequestMapping("/adminManageCompany")
	public ModelAndView adminManageCompany(@RequestParam("id") Long companyId) {
		ModelAndView model = new ModelAndView("todolist/adminManageCompany");
		Optional<Company> company = companyRepository.findById(companyId);

		if (company.isPresent()) {
			model.addObject("company", company.get());
		}

		//Get the director
		List<String> directorsName = adminManageCompanyService.getDirectors(company.get().getId());
		model.addObject("directorsName", directorsName.stream().collect(Collectors.joining(", ")));
		//Get the Shareholder
		List<String> shareholdersName = adminManageCompanyService.getShareholders(company.get().getId());
		model.addObject("shareholdersName", shareholdersName.stream().collect(Collectors.joining(", ")));

		Map<String, List<String>> signedFile = newCompanyService.getShareholderSignatureStatus(companyId);
		String nameInFirstDirectorMeetingResolution = newCompanyService.listSignedUserName(signedFile, "TYPE_COM_1");
		model.addObject("nameInFirstDirectorMeetingResolution", nameInFirstDirectorMeetingResolution);
		String nameInRiskAssessment = newCompanyService.listSignedUserName(signedFile, "TYPE_COM_12");
		model.addObject("nameInRiskAssessment", nameInRiskAssessment);
		String nameInSecretaryAgreement = newCompanyService.listSignedUserName(signedFile, "TYPE_COM_2"); //"签名人1(待签名)、签名人2(已签名)、签名人3(待签名)";
		model.addObject("nameInSecretaryAgreement", nameInSecretaryAgreement);

		//Get all director, Shareholder and contactor
		List<CompanyShareholderInfo> infos = adminManageCompanyService.getCompanyShareholders(company.get().getId());
		model.addObject("infos", infos);

		//Get all document belong to this company
		List<Document> docCompanyList = adminManageCompanyService.getCompanyDocumentList(companyId);

		Map<String, List<DocumentHistory>> docCompanyMap = adminManageCompanyService.getCompanyDocumentListWithDetail(companyId);
		model.addObject("docCompanyList", docCompanyList);
		model.addObject("docCompanyMap", docCompanyMap);

		//Get all document belong to this company
		List<Document> docPersonalList = adminManageCompanyService.getPersonalDocumentList(companyId);

		Map<String, List<DocumentHistory>> docPersonalMap = adminManageCompanyService.getPersonalDocumentListWithDetail(companyId);
		model.addObject("docPersonalList", docPersonalList);
		model.addObject("docPersonalMap", docPersonalMap);

		return model;
	}
	@RequestMapping("/adminTimeLine")
	public ModelAndView adminTimeLine(@RequestParam("id") Long companyId) {
		ModelAndView model = new ModelAndView("todolist/adminTimeLine");
		Optional<Company> company = companyRepository.findById(companyId);

		if (company.isPresent()) {
			model.addObject("company", company.get());
		}
		
		List<Timeline> timelines = adminTimelineService.getAllTimelineByCompanyId(companyId);
		model.addObject("timelines", timelines);
		
		timelines.forEach(timeline -> {
			if (timeline.getService().equals(TimeLineType.TYPE_1.getDescription())) {
				model.addObject("annualaudittimeline", timeline);
			} else if (timeline.getService().equals(TimeLineType.TYPE_2.getDescription())) {
				model.addObject("ecitimeline", timeline);
			} else if (timeline.getService().equals(TimeLineType.TYPE_3.getDescription())) {
				model.addObject("gsttimeline", timeline);
			} else if (timeline.getService().equals(TimeLineType.TYPE_4.getDescription())) {
				model.addObject("incometaxclaimtimeline", timeline);
			} else if (timeline.getService().equals(TimeLineType.TYPE_5.getDescription())) {
				model.addObject("incometaxpayabletimeline", timeline);
			} else if (timeline.getService().equals(TimeLineType.TYPE_6.getDescription())) {
				model.addObject("othertimeline", timeline);
			} 
		});
		model.addObject("allTimeline", timelines);

		model.addObject("auditTimelineDetail", adminTimelineService.getTimelineDetailByService(TimeLineType.TYPE_1.getDescription(), timelines));
		model.addObject("ECIClaimTimelineDetail", adminTimelineService.getTimelineDetailByService(TimeLineType.TYPE_2.getDescription(), timelines));
		model.addObject("GSTTimelineDetail", adminTimelineService.getTimelineDetailByService(TimeLineType.TYPE_3.getDescription(), timelines));
		model.addObject("incomeTaxClaimTimelineDetail", adminTimelineService.getTimelineDetailByService(TimeLineType.TYPE_4.getDescription(), timelines));
		model.addObject("incomeTaxPayableTimelineDetail", adminTimelineService.getTimelineDetailByService(TimeLineType.TYPE_5.getDescription(), timelines));

		TimelineAddition timelineAddition = adminTimelineService.getTimelineAdditionByCompanyId(companyId);
		model.addObject("timelineAddition", timelineAddition);
		return model;
	}	

	
	@RequestMapping("/mybusiness/admin_record")
	public ModelAndView admin_record() {
		ModelAndView model = new ModelAndView("mybusiness/admin_record");
		return model;
	}	
	
	@RequestMapping("/mybusiness/admin_editRecord")
	public ModelAndView admin_editRecord() {
		ModelAndView model = new ModelAndView("mybusiness/admin_editRecord");
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
		
		Map<String, Object> pageData = commonDataService.getAllCompanyUserData(userEmail);
		model.addObject("companies", pageData.get("companies"));

		return model;
	}	

	@RequestMapping("/todolist/admin_toDoList")
	public ModelAndView admin_toDoList() {
		ModelAndView model = new ModelAndView("todolist/admin_toDoList");

		/*
		 * Set<Company> companies = commonDataService.getAllPendingCompany();
		 * model.addObject("companies", companies);
		 */
		return model;
	}

	@RequestMapping("/pendingStep")
	public ModelAndView pendingStep(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getParameter("compid");
		request.getSession().setAttribute("companyId", companyId);
		ModelAndView model = new ModelAndView("todolist/pendingStep");
		
		Map<String, Object> pageData = commonDataService.getSingleCompanyUserData(userEmail, companyId);
		model.addObject("company", pageData.get("selfCompany"));
		
		CompanyStatusTime companyStatusTime = companyStatusTimeRepository.findByCompanyId(Long.parseLong(companyId));
		model.addObject("statusTime", companyStatusTime);
		return model;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/onlineSignature")
	public ModelAndView onlineSignature(HttpServletRequest request) {
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getParameter("compid");
		request.getSession().setAttribute("companyId", companyId);

		ModelAndView model = new ModelAndView("todolist/onlineSignature");

		Map<String, Object> pageData = commonDataService.getSingleCompanyUserData(userEmail, companyId);
		model.addObject("companyName", pageData.get("companyName"));
		
		//model.addObject("userName", pageData.get("shareholderName"));
		//model.addObject("address", pageData.get("address"));
		
		model.addObject("compid", companyId);
		if (companyId == null) {
			model.addObject("displayAll", true);
			return model;
		}

		Map<String, Integer> shareholderAndStockMap = (Map<String, Integer>) pageData.get("shareholderAndStock");
		StringBuffer shareholders = new StringBuffer();
		shareholderAndStockMap.forEach((k, v) -> shareholders.append("<span> ").append(k).append("</span>").append("<span> ").append(v).append("</span> <br/>"));
		shareholders.append("<span>Total:</span> <span> ").append(pageData.get("totalStockAmount")).append("</span>");

		List<CompanyShareholderInfo> sameCompanyShareholderInfos = (List<CompanyShareholderInfo>) pageData.get("sameCompanyShareholderInfos");
		List<OnlineSignatureVO> selfCompanyOnlineSignatureVo = sameCompanyShareholderInfos.parallelStream().map(companyShareholderInfo -> {
			OnlineSignatureVO onlineSignatureVO = new OnlineSignatureVO();
			onlineSignatureVO.setId(companyShareholderInfo.getId());
			onlineSignatureVO.setUserName(companyShareholderInfo.getName());
			onlineSignatureVO.setAddress(companyShareholderInfo.getAddress());
			
			onlineSignatureVO.setShareholderAndStock(shareholders.toString());

			if (companyShareholderInfo.getPositionType().contains("董事")) {
				onlineSignatureVO.setbDirector(true);
			}
			if (companyShareholderInfo.getPositionType().contains("股东")) {
				onlineSignatureVO.setbShareholder(true);
			}
			CompanyService companyService = (CompanyService)pageData.get("companyService");
			if (companyService.getNominalDirector() > 0) {
				onlineSignatureVO.setbNamedDirector(true);
			}
			if (companyShareholderInfo.getSignatureName() != null) {
				onlineSignatureVO.setAllSignatureStatus("已完成");
			} else {
				onlineSignatureVO.setAllSignatureStatus("待处理");
			}
			return onlineSignatureVO;
		}).collect(Collectors.toList());
		
		model.addObject("selfCompanyOnlineSignatureVo", selfCompanyOnlineSignatureVo);
		
		return model;
	}	

	@RequestMapping("/uploadPage")
	public ModelAndView uploadPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("todolist/uploadPage");
		
		String userEmail = (String) request.getSession().getAttribute("loginUsername");
		String companyId = (String) request.getParameter("compid");
		request.getSession().setAttribute("companyId", companyId);
		
		Map<String, Object> pageData = commonDataService.getSingleCompanyUserData(userEmail, companyId);
		model.addObject("companyName", pageData.get("companyName"));
		model.addObject("address", pageData.get("address"));
		model.addObject("compid", companyId);
		
		if (companyId == null) {
			model.addObject("displayAll", true);
			return model;
		}
		
		CompanyShareholderInfo selfCompanyShareholderInfo = (CompanyShareholderInfo) pageData.get("selfCompanyShareholderInfo");
		if (selfCompanyShareholderInfo.getIcType().contains("公民") || selfCompanyShareholderInfo.getPositionType().contains("永久居民")) {
			model.addObject("isSCOrPR", true);
		} else if (selfCompanyShareholderInfo.getNationality().startsWith("China")) {
			model.addObject("isChinese", true);
		} else {
			model.addObject("isforeigner", true);
		}

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
