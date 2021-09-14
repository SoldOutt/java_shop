package MyProject.form.controller.user;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import MyProject.form.entities.Contact;
import MyProject.form.entities.SaleOrder;
import MyProject.form.entities.SaleOrderProduct;
import MyProject.form.entities.User;
import MyProject.form.service.SaleOrderService;
import MyProject.form.service.UserService;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
public class AuthController extends BaseController {
	@Autowired
	UserService userService;
	@Autowired
	SaleOrderService saleOrderService;
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String getlogin(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException {

		return "user/login";
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody User user
			) throws  IOException {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
// 200 <-> thanh cong
// 500 <-> khong thanh cong
		System.out.println(user.getUsername());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		System.out.println(encoder.encode(user.getPassword()));
		System.out.println(userService.loadUserByUserName(user.getUsername()));
		user.setPassword(encoder.encode(user.getPassword()));
		if(userService.loadUserByUserName(user.getUsername())!=null) {
			jsonResult.put("code", 400);
			jsonResult.put("message", "Tai khoan da toan tai");
			jsonResult.put("user", user);
		}
		else {
			
			userService.saveOrUpdate(user);
			jsonResult.put("code", 200);
			jsonResult.put("message", "Dang ki thanh cong");
			jsonResult.put("user", user);
		}
//		userService.saveOrUpdate(user);
		
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/profile" }, method = RequestMethod.GET)
	public String profile(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException {
		User user = new User();
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			user = (User) userLogined;
		List<User> userr = userService.findAllByFeild("username", user.getUsername());
		user = userr.get(0);
		List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();
		saleOrders =saleOrderService.findAllByFeild("user_id", user.getId());
		model.addAttribute("saleOrders", saleOrders);
		
		return "user/profile";
	}
}

