package MyProject.form.entities;
	
import java.math.BigDecimal;
import java.util.*;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_category")
public class Category extends BaseEntity {
	@Column(name="name",length=100)
	private String name;
	
	@Column(name = "description", length=100)
	private String description;
	   
	@Column(name="parent_id")
	private Integer parentId;
	
	
	@OneToMany(cascade = CascadeType.ALL,
			fetch = FetchType.LAZY,
			mappedBy = "categories")
	private Set<Product> products = new HashSet<Product>();
	
	@Column(name="seo",length=1000)
	private String seo;
	
	
	/**
	 * them  1 san pham vao danh sach @OneToMany
	 * @param product
	 */
	public void addRelationProduct(Product product) {
		products.add(product);
		product.setCategories(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param product
	 */
	public void deleteRelationProduct(Product product) {
		products.remove(product);
		product.setCategories(null);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	
	
}
