package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import dto.BankMemberVO;
import prepare.Component;

@Component("bankMemberDao")
public class BankMemberDao {
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	public String getBalance(String name, String pw, String accountNum)throws Exception{
		String balance = null;
		Connection conn = ds.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql ;
		String pwd = null;
		try {
			sql = "SELECT pw FROM MEMBER WHERE NAME='"+name+"' AND accountNum='"+accountNum+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				pwd = rs.getString(1);
				pwd = pwd.substring(0, 2);
				if(pwd.equals(pw)) {
					sql = "SELECT balance FROM MEMBER  WHERE NAME='"+name+"' AND accountNum='"+accountNum+"'";
					rs = stmt.executeQuery(sql);
					if(rs.next()) {
						balance = rs.getString(1);
					}
				}else {
					balance = "X";
				}	
			}else {
				balance = "X";
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try {
		    	if(rs != null) rs.close();
		    	if(stmt != null) stmt.close();
		    	if(conn != null) conn.close();
		    }catch (Exception e) {}
		}
		return balance; 
	}
	
	public int setBalance(int balance, String accountNum) throws Exception{
		int result = 0;
		Connection conn = ds.getConnection();
		Statement stmt = null;
		String sql =  "UPDATE member SET balance='"+balance+"' WHERE accountNum='"+accountNum+"'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try {
		    	if(stmt != null) stmt.close();
		    	if(conn != null) conn.close();
		    }catch (Exception e) {}
		}
		return result;
	}
	public String check(String email, String name) throws Exception{
		Connection conn = ds.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT name FROM MEMBER WHERE EMAIL='"+email+ "' AND NAME='"+name+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
		    try {
		    	if(rs != null) rs.close();
		    	if(stmt != null) stmt.close();
		    	if(conn != null) conn.close();
		    }catch (Exception e) {}
		}
		return null;
	}

}
