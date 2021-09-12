package MyProject.form.entities;

import javax.persistence.*;


@Entity
@Table(name = "tbl_products_images")
public class ProductImages extends BaseEntity {
	@Column(name = "title",length= 500)
	private String title;
	
	@Column(name = "path",length= 200)
	private String path;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Product getProducts() {
		return products;
	}

	public void setProducts(Product products) {
		this.products = products;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product products;
	
	
	
}
