package sg.com.rsin.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sg.com.rsin.dao.CompanyRepository;
import sg.com.rsin.dao.CompanyStatusTimeRepository;
import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.CompanyService;
import sg.com.rsin.entity.CompanyShareholderInfo;
import sg.com.rsin.entity.CompanyStatusTime;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentHistory;
import sg.com.rsin.entity.Employee;
import sg.com.rsin.entity.Timeline;
import sg.com.rsin.entity.TimelineAddition;
import sg.com.rsin.entity.TimelineDetail;
import sg.com.rsin.enums.TimeLineType;
import sg.com.rsin.service.CommonDataService;
import sg.com.rsin.service.EmployeeService;
import sg.com.rsin.service.FileService;
import sg.com.rsin.service.NewCompanyService;
import sg.com.rsin.service.ShareholderInfoService;
import sg.com.rsin.service.AdminManageCompanyService;
import sg.com.rsin.service.AdminTimelineService;
import sg.com.rsin.service.UserRegistrationService;
import sg.com.rsin.vo.CompanyDto;
import sg.com.rsin.vo.CompanyShareholderDto;
import sg.com.rsin.vo.OnlineSignatureVO;

@Controller
public class AdminViewController {

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
    ShareholderInfoService shareholderInfoService;

    @Autowired
    CompanyRepository companyRepository;
    @Autowired
    NewCompanyService newCompanyService;
    @Autowired
    FileService fileService;
    @Autowired
    CompanyStatusTimeRepository companyStatusTimeRepository;

    @RequestMapping("/admin/getEmployees")
    public ModelAndView getEmployees() {
        List<Employee> employees = employeeService.getAllEmployees();
        ModelAndView model = new ModelAndView("getEmployees");
        model.addObject("employees", employees);
        return model;
    }

    /**
     * 管理员新公司注册
     * @return
     */
    @RequestMapping("/admin/allservice/adminNewCompany")
    public ModelAndView newCompany() {
        ModelAndView model = new ModelAndView("admin/allservice/adminNewCompany");
        return model;
    }

    @RequestMapping("/admin/allservice/licenseApplication")
    public ModelAndView licenseApplication() {
        ModelAndView model = new ModelAndView("admin/allservice/licenseApplication");
        return model;
    }    

    @RequestMapping("/admin/allservice/GSTApplication")
    public ModelAndView GSTApplication() {
        ModelAndView model = new ModelAndView("admin/allservice/GSTApplication");
        return model;
    }    

    @RequestMapping("/admin/allservice/accountingServices")
    public ModelAndView accountingServices() {
        ModelAndView model = new ModelAndView("admin/allservice/accountingServices");
        return model;
    }    

    @RequestMapping("/admin/allservice/callService")
    public ModelAndView callService() {
        ModelAndView model = new ModelAndView("admin/allservice/callService");
        return model;
    }    

    @RequestMapping("/admin/allservice/officeService")
    public ModelAndView officeService() {
        ModelAndView model = new ModelAndView("admin/allservice/officeService");
        return model;
    }    

    @RequestMapping("/admin/allservice/myRecord")
    public ModelAndView myRecord(HttpServletRequest request) {
        String userEmail = (String) request.getSession().getAttribute("loginUsername");
        ModelAndView model = new ModelAndView("admin/allservice/myRecord");

        Map<String, Object> pageData = commonDataService.getUserAllCompanyUserData(userEmail);
        model.addObject("companies", pageData.get("companies"));

        return model;
    }    

    @RequestMapping("/admin/tolist/annualReview")
    public ModelAndView annualReview() {
        ModelAndView model = new ModelAndView("admin/tolist/annualReview");
        return model;
    }
    
    @RequestMapping("/admin/adminManageCompany")
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

    @RequestMapping("/admin/mapCompanyPerson")
    public ModelAndView mapCompanyPerson(@RequestParam("id") Long companyId) {
        ModelAndView model = new ModelAndView("admin/info/mapCompanyPerson");
        Optional<Company> company = companyRepository.findById(companyId);

        if (company.isPresent()) {
            model.addObject("company", company.get());
        }

        //Get all director, Shareholder and contact
        Set<CompanyShareholderDto> allPersons = commonDataService.getAllShareholders();
        model.addObject("allPersons", allPersons);
        
        //Get this company director, shareholder and contact
        List<CompanyShareholderInfo> infos = adminManageCompanyService.getCompanyShareholders(company.get().getId());
        model.addObject("infos", infos);
        
        
        model.addObject("oldDirector", shareholderInfoService.getShareholderNames("董事", company.get().getId()));
        model.addObject("oldShareholder", shareholderInfoService.getShareholderNames("股东", company.get().getId()));
        model.addObject("oldContactPerson", shareholderInfoService.getShareholderNames("联系人", company.get().getId()));

        return model;
    }

    @RequestMapping("/admin/adminTimeLine")
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


        List<Timeline> otherServiceTimelines = adminTimelineService.getOthersTimeline(timelines);
        List<TimelineDetail> otherServiceTimelineDetails = adminTimelineService.getOthersTimelineDetail(timelines);

        model.addObject("otherServiceTimelines", otherServiceTimelines);
        model.addObject("otherServiceTimelineDetails", otherServiceTimelineDetails);
        TimelineAddition timelineAddition = adminTimelineService.getTimelineAdditionByCompanyId(companyId);
        model.addObject("timelineAddition", timelineAddition);
        return model;
    }    

    
    @RequestMapping("/admin/mybusiness/admin_record")
    public ModelAndView admin_record() {
        ModelAndView model = new ModelAndView("mybusiness/admin_record");
        return model;
    }    
    
    @RequestMapping("/admin/mybusiness/admin_editRecord")
    public ModelAndView admin_editRecord() {
        ModelAndView model = new ModelAndView("mybusiness/admin_editRecord");
        return model;
    }    
    
    @RequestMapping("/admin/oneKeyService")
    public ModelAndView oneKeyService() {
        ModelAndView model = new ModelAndView("admin/oneKeyService");
        return model;
    }
    
    @RequestMapping("/admin/notice/notice")
    public ModelAndView notice() {
        ModelAndView model = new ModelAndView("notice/notice");
        return model;
    }
    @RequestMapping("/admin/notice/admin_notice")
    public ModelAndView admin_notice() {
        ModelAndView model = new ModelAndView("notice/admin_notice");
        return model;
    }
    @RequestMapping("/admin/notice/admin_notice_create")
    public ModelAndView admin_notice_create() {
        ModelAndView model = new ModelAndView("notice/admin_notice_create");
        return model;
    }            
    
    @RequestMapping("/admin/annualReviewList")
    public ModelAndView annualReviewList() {
        ModelAndView model = new ModelAndView("todolist/annualReviewList");
        return model;
    }

    @SuppressWarnings("unchecked")
	@RequestMapping("/admin/toDoList")
    public ModelAndView toDoList(HttpServletRequest request) {
        String userEmail = (String) request.getSession().getAttribute("loginUsername");
        ModelAndView model = new ModelAndView("todolist/toDoList");

        Map<String, Object> pageData = commonDataService.getUserAllCompanyUserData(userEmail);

        //TODO check these company pending any steps
        List<Company> userAllCompanies = (List<Company>) pageData.get("companies");

        userAllCompanies.parallelStream().forEach(c -> {
        	commonDataService.getAllPendingStepAndTimetableByCompany(c.getId());
        });

        model.addObject("companies", userAllCompanies);
        return model;
    }    

    @RequestMapping("/todolist/admin_toDoList")
    public ModelAndView admin_toDoList() {
        ModelAndView model = new ModelAndView("todolist/admin_toDoList");

        //Pending company
        Set<CompanyDto> companiesServices = commonDataService.getAllPendingCompanies();
        model.addObject("companiesServices", companiesServices);
        //Pending company timetable
        Set<CompanyDto> companyTimetables = commonDataService.getAllPendingTimetable();
        model.addObject("companyTimetables", companyTimetables);
        
        List<CompanyDto> allCompanies = new ArrayList<CompanyDto>();
        allCompanies.addAll(companyTimetables);
        List <Long> companyId = companyTimetables.parallelStream().map(x -> x.getId()).collect(Collectors.toList());
        allCompanies.addAll(companiesServices.parallelStream()
        		.filter(x -> !companyId.contains(x.getId())).collect(Collectors.toList()));

        //companiesServices.addAll(companyTimetables);
        model.addObject("allCompanies", allCompanies);
        return model;
    }

    @RequestMapping("/admin/pendingStep")
    public ModelAndView pendingStep(HttpServletRequest request) {
        String userEmail = (String) request.getSession().getAttribute("loginUsername");
        String companyId = (String) request.getParameter("compid");
        request.getSession().setAttribute("companyId", companyId);
        ModelAndView model = new ModelAndView("todolist/pendingStep");
        
        Map<String, Object> pageData = commonDataService.getUserSingleCompanyUserData(userEmail, companyId);
        model.addObject("company", pageData.get("selfCompany"));
        
        CompanyStatusTime companyStatusTime = companyStatusTimeRepository.findByCompanyId(Long.parseLong(companyId));
        model.addObject("statusTime", companyStatusTime);
        return model;
    }    
    
    /**
     * No payment online signature page
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/admin/onlineSignature")
    public ModelAndView onlineSignature(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("admin/allservice/onlineSignature");
        String userEmail = (String) request.getSession().getAttribute("loginUsername");
        String companyId = (String) request.getParameter("compid");
        
        //TODO For testing purpose
        //request.getSession().setAttribute("companyId", "3");

        if (companyId == null || "".equals(companyId)) {
            companyId = (String) request.getSession().getAttribute("companyId");
        }
        
        if (companyId == null || "".equals(companyId)) {
            model.addObject("displayAll", true);
            return model;
        }

        request.getSession().setAttribute("companyId", companyId);
        model.addObject("compid", companyId);

        Map<String, Object> pageData = commonDataService.getSingleCompanyUserData(companyId);
        if (pageData == null) {
            return model;
        }
        model.addObject("companyName", pageData.get("companyName"));
        
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

            if (companyShareholderInfo.getPositionType1().contains("董事")) {
                onlineSignatureVO.setbDirector(true);
            }
            if (companyShareholderInfo.getPositionType2().contains("股东")) {
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

    /**
     * No payment online upload new company files
     * @param request
     * @return
     */
    @RequestMapping("/admin/uploadPage")
    public ModelAndView uploadPage(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("admin/allservice/uploadPage");
        
        String userEmail = (String) request.getSession().getAttribute("loginUsername");
        String companyId = (String) request.getParameter("compid");
        
        //TODO For testing purpose
        //request.getSession().setAttribute("companyId", "3");

        if (companyId == null) {
            companyId = (String) request.getSession().getAttribute("companyId");
        }
        if (companyId == null) {
            model.addObject("displayAll", true);
            return model;
        }
        request.getSession().setAttribute("companyId", companyId);
        
        Map<String, Object> pageData = commonDataService.getUserSingleCompanyUserData(userEmail, companyId);
        model.addObject("companyName", pageData.get("companyName"));
        model.addObject("address", pageData.get("address"));
        model.addObject("compid", companyId);
        
        CompanyShareholderInfo selfCompanyShareholderInfo = (CompanyShareholderInfo) pageData.get("selfCompanyShareholderInfo");
        if (selfCompanyShareholderInfo.getIcType().contains("公民") || selfCompanyShareholderInfo.getIcType().contains("永久居民")) {
            model.addObject("isSCOrPR", true);
        } else if (selfCompanyShareholderInfo.getNationality().startsWith("China")) {
            model.addObject("isChinese", true);
        } else {
            model.addObject("isforeigner", true);
        }

        return model;
    }

    @RequestMapping("/admin/schedule/{company_id}")
    public ModelAndView schedule(@PathVariable long company_id) {
        ModelAndView model = new ModelAndView("todolist/schedule");
        return model;
    }        
    @RequestMapping("/admin/mybusiness/openAccount")
    public ModelAndView openAccount() {
        ModelAndView model = new ModelAndView("mybusiness/openAccount");
        return model;
    }

    @RequestMapping(value = "/admin/view/registerNewCompany", method = RequestMethod.POST)
    public ModelAndView registerNewCompny(Model model) {
        ModelAndView view = new ModelAndView("mybusiness/newCompany");
        return view;
    }

    @RequestMapping("/admin/mybusiness/downLoadFile/{company_id}")
    public ModelAndView downLoadFile(@PathVariable long company_id) {
        ModelAndView model = new ModelAndView("mybusiness/downLoadFile");
        //get the company and the document list
        Company company =  companyRepository.findById(company_id).orElse(new Company());
        model.addObject("company", company);
        //base on the company to get the document list
        model.addObject("companyDoc", fileService.getDocumentsByCompanyId(company.getId(),"C"));
        model.addObject("personalDoc", fileService.getDocumentsByCompanyId(company.getId(),"P"));

        return model;
    }

}
