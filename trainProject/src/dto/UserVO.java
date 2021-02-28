package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class UserVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String zip_num;
	private String address;
	private String addressDetail;
	private String phone;
	private String useyn;
	private Timestamp indate;
	private int point;
	private String pw1;
	private String pw2;
	
	
	public int getPoint() {
		return point;
	}
	public UserVO setPoint(int point) {
		this.point = point;
		return this; 
	}
	
	public String getPw1() {
		return pw1;
	}
	public UserVO setPw1(String pw1) {
		this.pw1 = pw1;
		return this; 
	}
	public String getPw2() {
		return pw2;
	}
	public UserVO setPw2(String pw2) {
		this.pw2 = pw2;
		return this; 
	}
	public String getId() {
		return id;
	}
	public UserVO setId(String id) {
		this.id = id;
		return this; 
	}
	public String getPwd() {
		return pwd;
	}
	public UserVO setPwd(String pwd) {
		this.pwd = pwd;
		return this; 
	}
	public String getName() {
		return name;
	}
	public UserVO setName(String name) {
		this.name = name;
		return this; 
	}
	public String getEmail() {
		return email;
	}
	public UserVO setEmail(String email) {
		this.email = email;
		return this; 
	}
	public String getZip_num() {
		return zip_num;
	}
	public UserVO setZip_num(String zip_num) {
		this.zip_num = zip_num;
		return this; 
	}
	public String getAddress() {
		return address;
	}
	public UserVO setAddress(String address) {
		this.address = address;
		return this; 
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public UserVO setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
		return this; 
	}
	public String getPhone() {
		return phone;
	}
	public UserVO setPhone(String phone) {
		this.phone = phone;
		return this; 
	}
	public String getUseyn() {
		return useyn;
	}
	public UserVO setUseyn(String useyn) {
		this.useyn = useyn;
		return this; 
	}
	public Timestamp getIndate() {
		return indate;
	}
	public UserVO setIndate(Timestamp indate) {
		this.indate = indate;
		return this; 
	}
	
	
	

}
