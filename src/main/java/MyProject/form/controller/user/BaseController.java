package MyProject.form.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import MyProject.form.entities.Category;
import MyProject.form.entities.User;
import MyProject.form.service.CategoryService;

public abstract class BaseController {
	@Autowired
	CategoryService categoryService;
	public int getCurrentPage(HttpServletRequest req) {
		try {
			return Integer.parseInt(req.getParameter("page"))-1;
		} catch (Exception e) {
			return -1;
		}
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
	
	@ModelAttribute("categories")
	public List<Category> getAllCategory() {
		List<Category> listCategory = new ArrayList<Category>();
		listCategory = categoryService.findAll();
		return listCategory;
	}
//	@ModelAttribute("projectTitle")
//	public String getUserLogined() {
//		return "JavaWeb14";
//	}
}
