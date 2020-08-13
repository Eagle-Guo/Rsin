package sg.com.rsin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CompanyController {

	@RequestMapping(value = "/newcompany_confirm", method = RequestMethod.GET)
	public ModelAndView newCompanyConfirmation(@ModelAttribute("id") String id, @ModelAttribute("token") String token) {

		ModelAndView model = new ModelAndView("getEmployees");
		//model.addObject("employees", employees);
		return model;
	}
}
