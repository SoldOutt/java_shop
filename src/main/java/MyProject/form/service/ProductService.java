package MyProject.form.service;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import MyProject.form.dto.ProductSearch;
import MyProject.form.entities.Product;
import MyProject.form.entities.ProductImages;

@Service
public class ProductService extends BaseService<Product> {

	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	@PersistenceContext
	EntityManager entityManager;
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Transactional
	public Product save(Product product, MultipartFile avatar, MultipartFile[] productImages)
			throws IllegalStateException, IOException {
		if (!isEmptyUploadFile(avatar)) {
			String path = "G:\\JAVA_Web\\MyProject.form\\uploads\\product\\avatar\\" + avatar.getOriginalFilename();
			avatar.transferTo(new File(path));
			product.setAvatar("product/avatar/" + avatar.getOriginalFilename());

		}

		if (!isEmptyUploadFile(productImages)) {
			for (MultipartFile pic : productImages) {
				pic.transferTo(new File(
						"G:\\JAVA_Web\\MyProject.form\\uploads\\product\\picture\\" + pic.getOriginalFilename()));
				ProductImages pi = new ProductImages();
				pi.setPath("product/picture/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());
				product.addProductImage(pi);
			}

		}
		Date x = new Date();
		product.setCreateDate(x);
		product.setSeo(product.getTitle().trim());
		return super.saveOrUpdate(product);
	}

	@Transactional
	public Product edit(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lay thong tin san pham trong db.
		Product productOnDb = super.getById(product.getId());

		// có đẩy avartar ???
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("G:\\JAVA_Web\\MyProject.form\\uploads\\" + productOnDb.getAvatar()).delete();

			// add avartar moi
			productAvatar.transferTo(new File("G:\\JAVA_Web\\MyProject.form\\uploads\\" + "product/avatar/"
					+ productAvatar.getOriginalFilename()));
			product.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			product.setAvatar(productOnDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(
						"G:\\JAVA_Web\\MyProject.form\\uploads\\" + "product/pictures/" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				product.addProductImage(pi);
			}
		}
		Date x = new Date();
		product.setCreateDate(productOnDb.getCreateDate());
		product.setUpdateDate(x);
		product.setSeo(productOnDb.getSeo());
		// lưu vào database
		return super.saveOrUpdate(product);
	}

	// tất cả các services cần thêm hàm search.
	public List<Product> search(ProductSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE status=1";
		System.out.println(searchModel.getIdCategory());
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
					+ searchModel.getKeyword() + "%'" + " or p.short_description like '%" + searchModel.getKeyword()
					+ "%' )";
		}
		if(searchModel.getIdCategory()!=0) {
			System.out.println(searchModel.getIdCategory());
			sql += " and p.category_id = " + searchModel.getIdCategory() + " "; 
		}
//		
		// chi lay san pham chua xoa
//			sql += " and p.status=1 ";
		sql += " order by created_date desc";
		return executeNativeSqlWithPaging(sql, searchModel.getPage());
	}
	public List<Product> searchAll(ProductSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE status=1";
		System.out.println(searchModel.getIdCategory());
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
					+ searchModel.getKeyword() + "%'" + " or p.short_description like '%" + searchModel.getKeyword()
					+ "%' )";
		}
		if(searchModel.getIdCategory()!=0) {
			System.out.println(searchModel.getIdCategory());
			sql += " and p.category_id = " + searchModel.getIdCategory() + " "; 
		}
//		
		// chi lay san pham chua xoa
//			sql += " and p.status=1 ";
		sql += " order by created_date desc";
		return executeNativeSql(sql);
	}

	
	
	@SuppressWarnings("unchecked")
	public List<Product> findByCategory(int id) {
		return (List<Product>) entityManager.createNativeQuery("SELECT * FROM tbl_products where category_id = "+ id , clazz()).getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<Product> findProductHot() {
		return (List<Product>) entityManager.createNativeQuery("SELECT * FROM tbl_products where is_hot=1", clazz()).getResultList();
	}
}
