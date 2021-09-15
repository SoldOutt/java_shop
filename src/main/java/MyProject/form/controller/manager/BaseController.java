package MyProject.form.controller.manager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import MyProject.form.entities.Role;
import MyProject.form.entities.User;

public abstract class BaseController {
	public int getCurrentPage(HttpServletRequest req) {
		try {
			return Integer.parseInt(req.getParameter("page"))-1;
		} catch (Exception e) {
			return -1;
		}
	}
	@ModelAttribute("roles")
	public List<String> roles() {
		List<String> roles = new ArrayList<String>();
		User logined = getUserLogined();
		
		if(logined == null) return roles;
		for(Role r : logined.getRoles()) {
			roles.add(r.getAuthority());
		}
		
		return roles;
	}
	
	
	
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return null;
	}
//	@ModelAttribute("projectTitle")
//	public String getUserLogined() {
//		return "JavaWeb14";
//	}
	@ModelAttribute("isAdmin")
	public boolean isAdmin() {
//		for(String role : roles()) {
//			if(role.equalsIgnoreCase("ADMIN")) return true;
//		}
//		return false;
		User user = getUserLogined();
//		if(user.getUsername() == "admin")return true;
		return false;
		
	}
	
}
