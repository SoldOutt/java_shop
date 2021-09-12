package MyProject.form.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_products")
public class Product extends BaseEntity{
	@Column(name="title",length=1000)
	private String title;
	
	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	
	@Column(name="price_sale",precision = 13, scale = 2, nullable = false)
	private BigDecimal priceScale;
	
	@Column(name="short_description",length=3000)
	private String shortDescription;
	

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String detailDescription;
	
	@Column(name="avatar",length=2000)
	private String avatar;
	
	@Column(name="is_hot",nullable = true)
	private Boolean isHot;
	
	@Column(name="seo",length=1000)
	private String seo;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceScale() {
		return priceScale;
	}

	public void setPriceScale(BigDecimal priceScale) {
		this.priceScale = priceScale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category categories;
	
	@OneToMany(cascade = CascadeType.ALL,
			fetch = FetchType.LAZY,
			mappedBy = "products")
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	
	//Them anh : 
	public void addProductImage(ProductImages productImage) {
		productImages.add(productImage);
		productImage.setProducts(this);
	}
	//xoa anh :
	public void deleteProductImage(ProductImages productImage) {
		productImages.remove(productImage);
		productImage.setProducts(null);
	}
	
	@OneToMany(cascade = CascadeType.ALL,
			fetch = FetchType.LAZY,
			mappedBy = "productSale_id")
	private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();
	
	
	//Them sale : 
	public void addProductSaleOrder(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);
		saleOrderProduct.setProductSale_id(this);
	}
	//xoa sale :
	public void deleteProductSaleOrder(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct);
		saleOrderProduct.setProductSale_id(null);
	}
	
	public Set<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

}
