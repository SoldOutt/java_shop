package MyProject.form.controller.user;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import MyProject.form.dto.ProductSearch;
import MyProject.form.entities.Category;
import MyProject.form.entities.Product;
import MyProject.form.service.CategoryService;
import MyProject.form.service.ProductService;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value = {"user/product"},method = RequestMethod.GET)
	public String allProduct(final ModelMap model, 
			final HttpServletRequest req,
			final HttpServletResponse res)
			throws IOException{
		String keyword = req.getParameter("keyword");
		ProductSearch ps = new ProductSearch();
		int page = 0;
		ps.setPage(page);
		ps.setKeyword(keyword);
		
		String x = req.getParameter("page");
		if(x != null && x != "") {
			page = getCurrentPage(req);
			ps.setPage(page);
		}
		List<Product> products = new ArrayList<Product>();
		products = productService.search(ps);
		int totalProduct =productService.searchAll(ps).size();
		System.out.println(totalProduct);
		int totalPage = 1+totalProduct/productService.getSizeOfPage();
		model.addAttribute("products",products);
		model.addAttribute("page", page+1);
		model.addAttribute("totalPage",totalPage);
		return "user/product";
	}
	@RequestMapping(value = {"user/category/{categorySeo}"},method = RequestMethod.GET)
	public String getProductCategory(final ModelMap model, 
			final HttpServletRequest req,
			final HttpServletResponse res,
			@PathVariable("categorySeo") String categorySeo)
			throws IOException{
		String keyword = req.getParameter("keyword");
		ProductSearch ps = new ProductSearch();
		int page = 0;
		ps.setPage(page);
		ps.setKeyword(keyword);
		String x = req.getParameter("page");
		if(x != null && x != "") {
			page = getCurrentPage(req);
			ps.setPage(page); 
		}
		Category category = new Category();
		category = categoryService.findBySeo(categorySeo);
		List<Product> products = new ArrayList<Product>();
		ps.setIdCategory(category.getId());
		products= productService.search(ps);
		int totalProduct =productService.searchAll(ps).size();
		int totalPage = 1+totalProduct/productService.getSizeOfPage();
		model.addAttribute("products",products);
		model.addAttribute("page", page+1);
		model.addAttribute("totalPage",totalPage);
		return "user/product";
	}
	@RequestMapping(value = {"user/detailProduct/{idProduct}"},method = RequestMethod.GET)
	public String productDetail(final ModelMap model, 
			final HttpServletRequest req,
			final HttpServletResponse res,
			@PathVariable("idProduct") int productId)
			throws IOException{
		Product product = new Product();
		product = productService.getById(productId);
		model.addAttribute("product", product);
		return "user/productDetail";
	}
//	@RequestMapping(value = {"user/detailProduct/{productSeo}"},method = RequestMethod.GET)
//	public String productDetailSeo(final ModelMap model, 
//			final HttpServletRequest req,
//			final HttpServletResponse res,
//			@PathVariable("productSeo") String productSeo)
//			throws IOException{
//		Product product = new Product();
//		System.out.println(productSeo);
//		product = productService.findBySeo(productSeo);
//		model.addAttribute("product", product);
//		return "user/productDetail";
//	}
}
