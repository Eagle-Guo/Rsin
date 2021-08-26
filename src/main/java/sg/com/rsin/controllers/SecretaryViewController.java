package sg.com.rsin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sg.com.rsin.service.CommonDataService;

@Controller
public class SecretaryViewController {

	@Autowired
	CommonDataService commonDataService;

	/**
	 * 秘书需要签名的待办事项
	 * @return
	 */
	@RequestMapping("/secretary/secretaryToDoList")
	public ModelAndView newCompany() {
		ModelAndView model = new ModelAndView("secretary/secretaryToDoList");
		return model;
	}

	/**
	 * 秘书查看所有的公司
	 * @return
	 */
	@RequestMapping("/secretary/secretaryEditRecord")
	public ModelAndView licenseApplication() {
		ModelAndView model = new ModelAndView("secretary/secretaryEditRecord");
		return model;
	}	
}
