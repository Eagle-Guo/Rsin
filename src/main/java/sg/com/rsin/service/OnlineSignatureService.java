package sg.com.rsin.service;

import org.springframework.web.servlet.ModelAndView;

public interface OnlineSignatureService {
	public void getAllPageData (ModelAndView model, String userEmail);
}
