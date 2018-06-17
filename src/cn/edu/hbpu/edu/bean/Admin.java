package cn.edu.hbpu.edu.bean;

import java.io.Serializable;

/**
 *     
 * @author Administrator
 *
 */

public class Admin implements Serializable {
	


	private static final long serialVersionUID = 1L;

	private int adminid;
	
	private String username;
	
	private String phone;
	
	private String email;
	
	private String password;
	
	private int type;

	public Admin() {
		super();
	}

	public Admin(int adminid, String username, String phone, String email,
			String password) {
		super();
		this.adminid = adminid;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}

	public int getAdminid() {
		return adminid;
	}

	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", username=" + username
				+ ", phone=" + phone + ", email=" + email + ", password="
				+ password + ", type=" + type + "]";
	}

}
