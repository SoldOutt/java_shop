package MyProject.form.controller.user;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
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
import MyProject.form.entities.User;
import MyProject.form.service.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
public class AuthController {
	@Autowired
	UserService userService;
	
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
}

