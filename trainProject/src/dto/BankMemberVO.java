package dto;

public class BankMemberVO {
	private int no ; 
	private String accountNum;
	private String name ; 
	private String id;
	private String pw;
	private int balance;
	private String email;
	private String phoneNum;
	private int price;
	private String point;
	private String oseq;
	private int plusPoint;
	
	
	
	public String getEmail() {
		return email;
	}
	public BankMemberVO setEmail(String email) {
		this.email = email;
		return this;
	}
	public int getPlusPoint() {
		return plusPoint;
	}
	public BankMemberVO setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
		return this;
	}
	public String getOseq() {
		return oseq;
	}
	public BankMemberVO setOseq(String oseq) {
		this.oseq = oseq;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public BankMemberVO setPrice(int price) {
		this.price = price;
		return this;
	}
	public String getPoint() {
		return point;
	}
	public BankMemberVO setPoint(String point) {
		this.point = point;
		return this;
	}
	public int getNo() {
		return no;
	}
	public BankMemberVO setNo(int no) {
		this.no = no;
		return this;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public BankMemberVO setAccountNum(String accountNum) {
		this.accountNum = accountNum;
		return this;
	}
	public String getName() {
		return name;
	}
	public BankMemberVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getId() {
		return id;
	}
	public BankMemberVO setId(String id) {
		this.id = id;
		return this;
	}
	public String getPw() {
		return pw;
	}
	public BankMemberVO setPw(String pw) {
		this.pw = pw;
		return this;
	}
	public int getBalance() {
		return balance;
	}
	public BankMemberVO setBalance(int balance) {
		this.balance = balance;
		return this;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public BankMemberVO setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
		return this;
	}
	
}
