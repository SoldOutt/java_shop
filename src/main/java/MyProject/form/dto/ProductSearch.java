package MyProject.form.dto;

public class ProductSearch {
	private String title;
	private int price;
	private int sort_description;
	private String keyword;
	private int page;
	private int idCategory;
	public int getIdCategory() {
		return idCategory;
	}
	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSort_description() {
		return sort_description;
	}
	public void setSort_description(int sort_description) {
		this.sort_description = sort_description;
	}
	
}
