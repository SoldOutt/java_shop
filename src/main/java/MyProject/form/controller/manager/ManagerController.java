package MyProject.form.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import MyProject.form.dto.Cart;
import MyProject.form.dto.CartItem;
import MyProject.form.dto.ProductSearch;
import MyProject.form.entities.Blog;
import MyProject.form.entities.Category;
import MyProject.form.entities.Contact;
import MyProject.form.entities.Product;
import MyProject.form.entities.SaleOrder;
import MyProject.form.entities.SaleOrderProduct;
import MyProject.form.service.BlogService;
import MyProject.form.service.CategoryService;
import MyProject.form.service.ContactService;
import MyProject.form.service.ProductService;
import MyProject.form.service.SaleOrderProductService;
import MyProject.form.service.SaleOrderService;

@Controller
public class ManagerController extends BaseController {
	//danh dau inject doi tuong CategoryService vao day
	@Autowired
	private CategoryService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ContactService contactService;
	@Autowired 
	private SaleOrderService salseOrderService;
	@Autowired
	private BlogService blogService;
	@Autowired 
	private SaleOrderProductService saleOrderProductService;
	@RequestMapping(value = { "/admin/category" }, method = RequestMethod.GET)
	public String home(final ModelMap model, 
			final HttpServletRequest req,
			final HttpServletResponse res)
			throws IOException {
		List<Category> categories = new ArrayList<Category>();
		categories = categoriesService.findAll();
		model.addAttribute("category", categories);
		return "manager/category";
	}


	
	@RequestMapping(value = {"/admin/contact"}, method = RequestMethod.GET)
	public String managerContact(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
		throws IOException{
		List<Contact> contacts = new ArrayList<Contact>();
		contacts = contactService.findAll();
		model.addAttribute("contacts",contacts);
		return "manager/contact";
	}

	@RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.GET)
	public String addCategory(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
		throws IOException{
		Category category = new Category();
		model.addAttribute("category", category);
		return "manager/addCategory";
	}
	@RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.POST)
	public String addCategorySave(final ModelMap model,
			final HttpServletRequest req,
			final HttpServletResponse res,
			@ModelAttribute("category") Category category)
		throws IOException{
		System.out.println(category.getName());
		category.setSeo(category.getName().trim());
		category.setCreateDate(new Date());
		categoriesService.addCategory(category);
		return "redirect:/admin/category";
	}

	@RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String editCategory(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId)
			throws IOException {
		System.out.println(categoryId);
			Category category= categoriesService.getById(categoryId);
//			List<Category> categories = categoriesService.findAll();
			model.addAttribute("category", category);
				return "manager/addCategory";
	}
	@RequestMapping(value = { "/admin/removeCategory/{categoryId}" }, method = RequestMethod.POST) // -> action
	public ResponseEntity<Map<String, Object>> removeCategory(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId)
			throws IOException {
			Category category = categoriesService.getById(categoryId);
			category.setStatus(false);
			categoriesService.saveOrUpdate(category);
			Map<String,Object> jsonResult = new HashMap<String,Object>();
			jsonResult.put("code",200);
			jsonResult.put("status","TC");
			
			return ResponseEntity.ok(jsonResult);
	}

	
	@RequestMapping(value = {"/admin/sale_order"}, method = RequestMethod.GET)
	public String saleOrder(final ModelMap model,
			final HttpServletRequest req, 
			final HttpServletResponse res)
		throws IOException{
		List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();
		List<SaleOrder> saleOrdersDelete = new ArrayList<SaleOrder>();
		saleOrders = salseOrderService.findAll();
		saleOrdersDelete = salseOrderService.findAllDelete();
		model.addAttribute("saleOrders", saleOrders);
		model.addAttribute("saleOrdersDelete", saleOrdersDelete);
		return "manager/sale_order";
	}
	@RequestMapping(value = { "/admin/removeSaleOrder/{saleOrderId}" }, method = RequestMethod.POST) // -> action
	public ResponseEntity<Map<String, Object>> removeSaleOrder(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOrderId") int saleOrderId)
			throws IOException {
			SaleOrder saleOrder = salseOrderService.getById(saleOrderId);
			saleOrder.setStatus(false);
			salseOrderService.saveOrUpdate(saleOrder);
			Map<String,Object> jsonResult = new HashMap<String,Object>();
			jsonResult.put("code",200);
			jsonResult.put("status","TC");
			
			return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = {"/admin/addBlog"}, method = RequestMethod.GET)
	public String addBlog(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
		throws IOException{
		Blog blog = new Blog();
		model.addAttribute("blog", blog);
		return "manager/addBlog";
	}
	
	@RequestMapping(value = {"/admin/addBlog"}, method = RequestMethod.POST)
	public String addProductSave(final ModelMap model,
			final HttpServletRequest req,
			final HttpServletResponse res,
			@ModelAttribute("blog") Blog blog,
			@RequestParam("avatarImage") MultipartFile avatar)
		throws IOException{
		System.out.println(blog.getId());
		if(blog.getId()==null)blogService.save(blog,avatar);
		else {
			blogService.edit(blog, avatar);
		}
		return "redirect:blog";
	}
	@RequestMapping(value = {"/admin/editBlog/{blogSeo}"}, method = RequestMethod.GET)
	public String editBlof(final ModelMap model,
			final HttpServletRequest req,
			final HttpServletResponse res,
			@PathVariable("blogSeo") String blogSeo)
		throws IOException{
		Blog blog = blogService.findBySeo(blogSeo);
		model.addAttribute("blog", blog)	;	
		return "manager/addBlog";
	}
	@RequestMapping(value = {"/admin/blog"}, method = RequestMethod.GET)
	public String getBlog(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
		throws IOException{
		List<Blog> blogs = new ArrayList<Blog>();
		blogs = blogService.findAll();
		model.addAttribute("blogs", blogs);
		
		return "manager/blog";
	}
	@RequestMapping(value = {"/user/blog/{blogSeo}"}, method = RequestMethod.GET)
	public String getBlogUser(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res,@PathVariable("blogSeo") String blogSeo)
		throws IOException{
		 
		Blog blog = blogService.findBySeo(blogSeo);
		model.addAttribute("blog", blog);
		
		return "user/blog";
	}
}
