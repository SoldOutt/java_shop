package MyProject.form.entities;


import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Table;
 
@Entity 
@Table(name="tbl_blog") 
public class Blog extends BaseEntity { 
	@Column(name="title",length=1000)
	private String title;
	
	@Column(name="detail_post",nullable = false, columnDefinition = "LONGTEXT")
	private String detailPost;
	
	@Column(name="blog_img",length=1000)
	private String blogImg;
	
	@Column(name="short_description",length=1000)
	private String shortDescription;
	
	@Column(name="seo",length=1000)
	private String seo;
	
	
	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetailPost() {
		return detailPost;
	}

	public void setDetailPost(String detailPost) {
		this.detailPost = detailPost;
	}

	public String getBlogImg() {
		return blogImg;
	}

	public void setBlogImg(String blogImg) {
		this.blogImg = blogImg;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	
	
	
}
