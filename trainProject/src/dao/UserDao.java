package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.UserVO;
import prepare.Component;

@Component("userDao")
public class UserDao {

	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public int insert(UserVO user) throws Exception{
		String sql ;
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null;
		String add = user.getAddress() + " "+ user.getAddressDetail();
		if(user.getEmail() == null) {
			sql = "insert into user (id, pwd, name, zip_num, address, phone) values ('"
					+user.getId()+"','"+user.getPwd()+"','"+user.getName()+"','"+user.getZip_num()
					+"','"+add+"','"+user.getPhone()+"')";
		}else {
			sql = "insert into user(id, pwd, name, email, zip_num, address, phone) values ('"
					+user.getId()+"','"+user.getPwd()+"','"+user.getName()+"','"+user.getEmail()
					+"','"+user.getZip_num()+"','"+add+"','"+user.getPhone()+"')";
			
		}

		try {
			conn = ds.getConnection();
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
	
	public int joinOut(String id) throws Exception{
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null; 
		String sql  = "UPDATE user SET useyn='n' WHERE ID='"+id+"'";
		try {
			conn = ds.getConnection();
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
	
	public int update(UserVO user) throws Exception{
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null; 
		String add ;
		if(user.getAddressDetail() != null) {
			add = user.getAddress() + " " + user.getAddressDetail();
		}else {
			add = user.getAddress();
		}
		String sql = "";
		if(user.getPwd() == null) {
			sql = "UPDATE user SET useyn='"+user.getUseyn()+"', NAME='"+user.getName()+"', PHONE='"+user.getPhone()+"', ZIP_NUM='"+user.getZip_num()+"', ADDRESS='"+add+"' WHERE ID='"+user.getId()+"'";
		}else {

			sql = "UPDATE user SET useyn='"+user.getUseyn()+"', NAME='"+user.getName()+"', PHONE='"+user.getPhone()+"', pwd='"+user.getPwd()+"', ZIP_NUM='"+user.getZip_num()+"', ADDRESS='"+add+"' WHERE ID='"+user.getId()+"'";
		}
		try {
			conn = ds.getConnection();
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
	
	public UserVO getUser(String id) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE ID='"+id+"'";
		 try {
			 conn = ds.getConnection();
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				 return new UserVO().setId(rs.getString("id"))
												.setPwd(rs.getString("pwd"))
												.setName(rs.getString("name"))
												.setEmail(rs.getString("email"))
												.setZip_num(rs.getString("zip_num"))
												.setAddress(rs.getString("address"))
												.setPhone(rs.getString("phone"))
												.setUseyn(rs.getString("useyn"))
												.setIndate(Timestamp.valueOf(rs.getString("indate")));
				 
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
	
	public UserVO login(String id, String pwd) throws Exception {
		Connection conn = ds.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs= null;
		UserVO user = null;
		try {
			stmt = conn.prepareStatement("SELECT * FROM user WHERE useyn='y' and id=? AND pwd=?");
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			if(rs.next()) {
				user = new UserVO().setId(rs.getString("id"))
											.setPwd(rs.getString("pwd"))
											.setName(rs.getString("name"))
											.setEmail(rs.getString("email"))
											.setZip_num(rs.getString("zip_num"))
											.setAddress(rs.getString("address"))
											.setPhone(rs.getString("phone"))
											.setUseyn(rs.getString("useyn"))
											.setIndate(Timestamp.valueOf(rs.getString("indate")));

			}
		}catch(SQLException e) {
			throw e;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return user;
	}
	
	public ArrayList<UserVO> getUserList() throws Exception{
		ArrayList<UserVO> users = new ArrayList<UserVO>();
		Connection conn = ds.getConnection();
		Statement stmt = null;
		ResultSet rs= null;
		String sql = "SELECT * FROM user";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserVO user = new UserVO().setId(rs.getString("id"))
														.setPwd(rs.getString("pwd"))
														.setName(rs.getString("name"))
														.setEmail(rs.getString("email"))
														.setZip_num(rs.getString("zip_num"))
														.setAddress(rs.getString("address"))
														.setPhone(rs.getString("phone"))
														.setUseyn(rs.getString("useyn"))
														.setIndate(Timestamp.valueOf(rs.getString("indate")));
				users.add(user);

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return users;
	}
	
	public int getPoint(String id) {
		String sql;
		int point =0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "SELECT point from user where id='"+id+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				point = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return point;
	}
	
	public int setPoint (String id, int point) {
		String sql;
		int result =0;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "UPDATE user SET POINT='"+point+"' WHERE ID='"+id+"'";
			result = stmt.executeUpdate(sql);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return result;
	}
	
	
	public int changeStmt(String id, String useyn) throws Exception {
		String sql ;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "UPDATE user SET USEYN='"+useyn+"' WHERE ID='"+id+"'";
			return stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return 0;
	}

	public int deleteMember(String id) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql =  "DELETE FROM user WHERE id='"+id+"'";
			return stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return 0;
		
	}
}
