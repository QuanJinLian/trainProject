package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import dto.adminVO;
import prepare.Component;

@Component("adminDao")
public class AdminDao {
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public adminVO login(String id, String pwd) throws Exception{
		adminVO admin = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM admin WHERE ID='"+id+"' and pwd='"+pwd+"'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				admin= new adminVO().setId(rs.getString(1))
						 .setPwd(rs.getString(2))
						 .setName(rs.getString(3))
						 .setPhone(rs.getString(4));
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
		return admin;
	}
	
}
