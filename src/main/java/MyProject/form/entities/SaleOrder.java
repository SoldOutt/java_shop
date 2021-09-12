package MyProject.form.entities;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name="code",length = 45)
	private String code;
	
	@Column(name="total",precision = 13, scale = 2,nullable = false)
	private BigDecimal total;
	
	@Column(name="user_id")
	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	@Column(name="customer_name",length =100)
	private String customerName;
	
	@Column(name="customer_address",length =100)
	private String customerAddress;
	
	@Column(name="customer_phone",length =100)
	private String customerPhone; 
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public Set<SaleOrderProduct> getSaleOrderProduct() {
		return saleOrderProducts;
	}

	public void setSaleOrderProduct(Set<SaleOrderProduct> saleOrderProduct) {
		this.saleOrderProducts = saleOrderProduct;
	}

	@Column(name="customer_email",length =100)
	private String customerEmail;
	
	@OneToMany(cascade = CascadeType.ALL,
			fetch = FetchType.LAZY,
			mappedBy = "saleOrder_id")
	private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();
	//con lien ket voi usser chua lam
	
	public void addSaleOrderProducts(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);
		saleOrderProduct.setSaleOrder_id(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param product
	 */
	public void deleteRelationProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct);
		saleOrderProduct.setSaleOrder_id(null);
	}
}
