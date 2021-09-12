package MyProject.form.entities;
import javax.persistence.*;

@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProduct extends BaseEntity{
	@Column(name="quality")
	private int quality;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder saleOrder_id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product productSale_id;

	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	public SaleOrder getSaleOrder_id() {
		return saleOrder_id;
	}
	public void setSaleOrder_id(SaleOrder saleOrder_id) {
		this.saleOrder_id = saleOrder_id;
	}
	public Product getProductSale_id() {
		return productSale_id;
	}
	public void setProductSale_id(Product productSale_id) {
		this.productSale_id = productSale_id;
	}
	
}
