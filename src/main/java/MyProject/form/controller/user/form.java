package MyProject.form.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import MyProject.form.dto.UserContact;
import MyProject.form.entities.Contact;
import MyProject.form.entities.Product;
import MyProject.form.service.ContactService;
import MyProject.form.service.ProductService;

@Controller
public class form extends BaseController {
	@Autowired 
	private ContactService contactService;
	@Autowired 
	private ProductService productService;
	
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException {
			List<Product> productJava = new ArrayList<Product>();
			List<Product> productHot = new ArrayList<Product>();
			productJava = productService.findByCategory(21);
			productHot = productService.findProductHot();
			model.addAttribute("productJava", productJava);
			model.addAttribute("productHot", productHot);
		return "user/index";
	}

	@RequestMapping(value = { "/user/contact" }, method = RequestMethod.GET)
	public String contact(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException {
		Contact contact = new Contact();
		model.addAttribute("contact", contact);
		return "user/contact";
	}

	@RequestMapping(value = { "/user/contact" }, method = RequestMethod.POST)
	public String contactPost(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res,
			@ModelAttribute("contact") UserContact contact, @RequestParam("inputFile") MultipartFile[] inputFiles)
			throws IOException {

		// save file
		if (inputFiles.length > 0) {
			System.out.println(inputFiles[0]);
			for (MultipartFile inputFile : inputFiles) {
				inputFile.transferTo(
						new File("G:\\JAVA_Web\\MyProject.form\\uploads\\" + inputFile.getOriginalFilename()));
			}
		}
		return "user/contact2";
	}

	// Call ajax
	@RequestMapping(value = { "/user/contact-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Contact contact
			) throws  IOException {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
// 200 <-> thanh cong
// 500 <-> khong thanh cong
		
		contactService.saveOrUpdate(contact);
		jsonResult.put("code", 200);
		jsonResult.put("message", contact);
		System.out.println(contact);
		return ResponseEntity.ok(jsonResult);
	}

}
