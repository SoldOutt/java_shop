package MyProject.form.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
	@Column(name = "user_name", length = 45, nullable = false)
	private String userName;
	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	@Column(name = "subject", length = 100, nullable = false)
	private String subject;   
	@Column(name = "message", length = 1000, nullable = false)
	private String message;

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
