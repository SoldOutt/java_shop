package MyProject.form.service;


import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import MyProject.form.entities.Blog;




@Service
public class BlogService extends BaseService<Blog> {

	@Override
	protected Class<Blog> clazz() {
		// TODO Auto-generated method stub
		return Blog.class;
	}
	
	@PersistenceContext
	EntityManager entityManager;
	
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	@Transactional
	public Blog save(Blog blog, MultipartFile avatar)
			throws IllegalStateException, IOException {
		if (!isEmptyUploadFile(avatar)) {
			String path = "G:\\JAVA_Web\\MyProject.form\\uploads\\blog\\" + avatar.getOriginalFilename();
			avatar.transferTo(new File(path));
			blog.setBlogImg("blog/" + avatar.getOriginalFilename());

		}

		
		Date x = new Date();
		blog.setCreateDate(x);
		blog.setSeo(blog.getTitle().trim());
		return super.saveOrUpdate(blog);
	}
	
	@Transactional
	public Blog edit(Blog blog, MultipartFile productAvatar)
			throws IllegalStateException, IOException {

		// lay thong tin san pham trong db.
		Blog blogOnDb = super.getById(blog.getId());

		// có đẩy avartar ???
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("G:\\JAVA_Web\\MyProject.form\\uploads\\" + blogOnDb.getBlogImg()).delete();

			// add avartar moi
			productAvatar.transferTo(new File("G:\\JAVA_Web\\MyProject.form\\uploads\\" + "blog/"
					+ productAvatar.getOriginalFilename()));
			blog.setBlogImg("blog/" + productAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			blog.setBlogImg(blogOnDb.getBlogImg());
		}

		
		Date x = new Date();
		blog.setCreateDate(blogOnDb.getCreateDate());
		blog.setUpdateDate(x);
		// lưu vào database
		return super.saveOrUpdate(blog);
	}
}
