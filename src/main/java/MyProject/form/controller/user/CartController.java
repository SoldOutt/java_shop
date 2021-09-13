package MyProject.form.controller.user;

import java.io.IOException;
import java.math.BigDecimal;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import MyProject.form.dto.Cart;
import MyProject.form.dto.CartItem;
import MyProject.form.entities.Product;
import MyProject.form.entities.SaleOrder;
import MyProject.form.entities.SaleOrderProduct;
import MyProject.form.service.ProductService;
import MyProject.form.service.SaleOrderProductService;
import MyProject.form.service.SaleOrderService;

@Controller
public class CartController extends BaseController {

	@Autowired
	SaleOrderService saleOrderService;

	@Autowired
	ProductService productService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;

	@RequestMapping(value = { "/cart/finish" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		String customerName = request.getParameter("customerName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		// tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		if (getUserLogined() != null) {
			saleOrder.setUserId(getUserLogined().getId());
		}
		long total = 0;
		// kết các sản phẩm trong giỏ hàng cho hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			if(cartItem.getQuanlity()==0)continue;
			SaleOrderProduct saleOrderProducts = new SaleOrderProduct();
			saleOrderProducts.setProductSale_id(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			total += cartItem.getQuanlity() * cartItem.getPriceUnit().intValueExact();
		}
		BigDecimal totalOrder = new BigDecimal(total);

		// Tinh tong tien
		saleOrder.setTotal(totalOrder);
		saleOrder.setCreateDate(new Date());
		// lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);

		// Xóa session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", null);
		return "redirect:/user/product";
	}

	@RequestMapping(value = { "user/view_cart" }, method = RequestMethod.GET)
	public String viewCart(final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
			throws IOException {

		return "user/cart_view";
	}

	@RequestMapping(value = { "user/change_cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {
		System.out.println(newItem.getProductId()+" "+newItem.getQuanlity());
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(newItem.getQuanlity());
				System.out.println("ok");
			}
		}
		cart.setCartItems(cartItems);
		System.out.println(getTotalItems(request));
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());

			cart.getCartItems().add(newItem);
		}

		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	@RequestMapping(value = { "/manager/saleorder_detail" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> showDetailSaleOrder(final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response, @RequestBody CartItem newItem) {

		List<SaleOrderProduct> saleOrderProducts = new ArrayList<SaleOrderProduct>();
		saleOrderProducts = saleOrderProductService.findByInt("saleorder_id", newItem.getProductId());

		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("saleOrderProducts", saleOrderProducts);

//		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
}
