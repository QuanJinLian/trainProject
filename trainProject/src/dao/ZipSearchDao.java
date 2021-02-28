package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.zipCodeBin;
import prepare.Component;

@Component("zipSearchDao")
public class ZipSearchDao {
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public ArrayList<zipCodeBin> getAddressList(String add) throws Exception{
		ArrayList<zipCodeBin> adds  =new ArrayList<>(); 
		String sql = "SELECT * FROM ZIPCODE WHERE DONG LIKE '%" + add + "%'  OR BLDG LIKE '%" + add + "%' ORDER BY SEQ";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

			try {
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					adds.add(new zipCodeBin().setZipcode(rs.getString(1))
														.setSido(rs.getString(2))
														.setGugun(rs.getString(3))
														.setDong(rs.getString(4))
														.setBldg(rs.getString(6))
														.setBunji(rs.getString(7))
														.setSeq(rs.getString(8)));
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}	finally { 
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}catch (Exception e) {}
			}
		return adds;
	}

}
