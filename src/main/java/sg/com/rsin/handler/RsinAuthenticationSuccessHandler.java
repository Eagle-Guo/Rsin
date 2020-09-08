package sg.com.rsin.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import sg.com.rsin.dao.UserRegistrationRepository;
import sg.com.rsin.entity.UserRegistration;

/**
 * Login successful
 * @author user
 *
 */
@Component
public class RsinAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Autowired
	UserRegistrationRepository userRegistrationRepository;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		boolean hasUserRole = false;
		boolean hasAdminRole = false;
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
				hasUserRole = true;
				break;
			} else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				hasAdminRole = true;
				break;
			}
		}

		Object principal = authentication.getPrincipal();
		String loginName;
		if (principal instanceof UserDetails) {
			loginName = ((UserDetails)principal).getUsername();
		} else {
			loginName = principal.toString();
		}
		UserRegistration userRegistration = userRegistrationRepository.findByUsername(loginName);
		request.getSession().setAttribute("loginUsername", userRegistration != null ? userRegistration.getUsername() : "");
		request.getSession().setAttribute("loginUser", userRegistration != null ? (userRegistration.getFirstName() + " " +  userRegistration.getLastName()): "Anonymous");
		if (hasUserRole) {
			redirectStrategy.sendRedirect(request, response, "/userWelcome");
		} else if (hasAdminRole) {
			redirectStrategy.sendRedirect(request, response, "/adminWelcome");
		} else {
			throw new IllegalStateException();
		}
	}

}