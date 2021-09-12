package MyProject.form.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import MyProject.form.entities.User;

@Service
public class UserService extends BaseService<User> {

	@PersistenceContext
	protected EntityManager entityManager;
	
	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUserName(String userName) {
		String sql = "select * from tbl_users u where u.username = '" +userName +"'";
		List<User> users = this.executeNativeSqlWithPaging(sql,-1);
		if(users == null || users.size()<=0)return null;
		return users.get(0);
	}
}
