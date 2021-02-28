package dto;

public class adminVO {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	
	public String getId() {
		return id;
	}
	public adminVO setId(String id) {
		this.id = id;
		return this;
	}
	public String getPwd() {
		return pwd;
	}
	public adminVO setPwd(String pwd) {
		this.pwd = pwd;
		return this;
	}
	public String getName() {
		return name;
	}
	public adminVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getPhone() {
		return phone;
	}
	public adminVO setPhone(String phone) {
		this.phone = phone;
		return this;
	}

}
