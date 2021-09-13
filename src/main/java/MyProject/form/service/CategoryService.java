package MyProject.form.service;



import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import org.springframework.stereotype.Service;

import MyProject.form.entities.Category;


@Service
public class CategoryService extends BaseService<Category> {

	@Override
	protected Class<Category> clazz() {
		return Category.class;
	}
	@Transactional
	public Category addCategory (Category category) {
		
		return super.saveOrUpdate(category);
	}
	
	
	
//	@Modifying
//	@Query(value="UPDATE tbl_category SET status=0 where id = ?1",nativeQuery = true)
//	void removeById(int id);
//	
}
