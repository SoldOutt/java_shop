package MyProject.form.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import MyProject.form.entities.BaseEntity;



@Service
public abstract class BaseService<E extends BaseEntity> {
	
	private static int SIZE_OF_PAGE = 9;
	@PersistenceContext
	EntityManager entityManager;

	protected abstract Class<E> clazz();

	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name() + " WHERE status=1", clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAllDelete() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name() + " WHERE status=0", clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findByInt(String field,int num) {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name() +" where " + field +" = "+num , clazz()).getResultList();
	}
	
		
	@SuppressWarnings("unchecked")
	public E findBySeo(String seo) {
		Table tbl = clazz().getAnnotation(Table.class);
		System.out.println(tbl.name());
		return (E) entityManager.createNativeQuery("SELECT * FROM " + tbl.name() +" where seo like '%" + seo + "%'", clazz()).getSingleResult();
	}
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			entityManager.persist(entity);
			return entity;
		} else {
			return entityManager.merge(entity);
		}
	}

	public void delete(E entity) {
		entityManager.remove(entity);
	}
	
	@Transactional
	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}
	
	
	public int getSizeOfPage() {
		
		return SIZE_OF_PAGE;
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSqlWithPaging(String sql, int page) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			
			if(page >= 0) {
				query.setFirstResult(page*SIZE_OF_PAGE);
				query.setMaxResults(SIZE_OF_PAGE);
			}
			
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	
	
}