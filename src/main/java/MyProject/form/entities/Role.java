package MyProject.form.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity implements GrantedAuthority {
	@Column(name = "name",length = 45)
	private String name;
	
	@Column(name = "description", length = 45)
	private String description;

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
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", 
			joinColumns = @JoinColumn(name = "role_id"), 
			inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users = new ArrayList<User>();

	@Override
	public String getAuthority() {		// cai nay de dung cho phuong thuc hasAuthority cua secutity no se tim theo role de phan biet nguoi dung va admin
		// TODO Auto-generated method stub
		return name;
	}
	
	
}
