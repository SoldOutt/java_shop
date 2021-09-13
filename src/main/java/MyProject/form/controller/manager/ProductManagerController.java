package MyProject.form.controller.manager;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import MyProject.form.dto.ProductSearch;
import MyProject.form.entities.Category;
import MyProject.form.entities.Contact;
import MyProject.form.entities.Product;
import MyProject.form.entities.SaleOrder;
import MyProject.form.service.CategoryService;
import MyProject.form.service.ContactService;
import MyProject.form.service.ProductService;
import MyProject.form.service.SaleOrderProductService;
import MyProject.form.service.SaleOrderService;

@Controller
public class ProductManagerController extends BaseController {
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
		private SaleOrderProductService saleOrderProductService;
		
		@RequestMapping(value = {"/admin/product"},
				method = RequestMethod.GET)
		public String managerProduct(final ModelMap model,
				final HttpServletRequest req, 
				final HttpServletResponse res)
			throws IOException{
			String keyword = req.getParameter("keyword");
			ProductSearch ps = new ProductSearch();
			ps.setKeyword(keyword);
			ps.setPage(getCurrentPage(req));
			
			
			List<Product> products = new ArrayList<Product>();
			List<Product> productsDeleted = new ArrayList<Product>();
			if(keyword != null) {
				products = productService.search(ps);
			}
			else {
				products = productService.findAll();
			}
			productsDeleted = productService.findAllDelete();
			model.addAttribute("products",products);
			model.addAttribute("productsDeleted",productsDeleted);
			return "manager/product";
		}
		
		@RequestMapping(value = {"/admin/list-products"},
				method = RequestMethod.GET)
		public String searchProduct(final ModelMap model,
				final HttpServletRequest req, 
				final HttpServletResponse res)
			throws IOException{
			String keyword = req.getParameter("keyword");
			ProductSearch ps = new ProductSearch();
			ps.setKeyword(keyword);
			ps.setPage(getCurrentPage(req));
			System.out.println(ps);
			model.addAttribute("products",productService.search(ps));
			return "manager/product";
		}
		@RequestMapping(value = {"/admin/addProduct"}, method = RequestMethod.GET)
		public String addProduct(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException{ 
			Product product = new Product();
			List<Category> categories = new ArrayList<Category>();
			categories = categoriesService.findAll();
			model.addAttribute("categories", categories);
			model.addAttribute("product", product);
			return "manager/addProduct";
		}
		@RequestMapping(value = {"/admin/addProduct"}, method = RequestMethod.POST)
		public String addProductSave(final ModelMap model,
				final HttpServletRequest req,
				final HttpServletResponse res,
				@ModelAttribute("product") Product product,
				@RequestParam("avatarImage") MultipartFile avatar,
				@RequestParam("productImagess") MultipartFile[] productImages)
			throws IOException{
			System.out.println(product.getId());
			if(product.getId()==null)productService.save(product,avatar,productImages);
			else {
				productService.edit(product, avatar, productImages);
			}
			return "redirect:product";
		}
		
		@RequestMapping(value = {"/removeProduct/{id}"}, method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> removeProduct(final ModelMap model,
				final HttpServletRequest req,
				final HttpServletResponse res,
				@PathVariable("id") int id)
			throws IOException{
			System.out.println(id);
			productService.deleteById(id);
			
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");
			jsonResult.put("message", "Da xoa thanh cong id" + id);
			
			return ResponseEntity.ok(jsonResult);
		}
		
		@RequestMapping(value = { "/admin/edit-products/{productId}" }, method = RequestMethod.GET) // -> action
		public String editProduct(final ModelMap model,
				final HttpServletRequest request,
				final HttpServletResponse response,
				@PathVariable("productId") int productId)
				throws IOException {
				Product product= productService.getById(productId);
				List<Category> categories = categoriesService.findAll();
				model.addAttribute("categories", categories);
				model.addAttribute("product", product);
					return "manager/addProduct";}

		
		
	
		
		
}
