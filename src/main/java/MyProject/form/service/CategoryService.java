package MyProject.form.service;



import javax.transaction.Transactional;

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
	
}
