package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.TrainVO;
import dto.adminVO;
import prepare.Component;

@Component("trainDao")
public class TrainDao {
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public int insert(TrainVO train)throws Exception{
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		String sql = "INSERT INTO train (train_name, train_type, stmt, start_date) values('"
							+train.getName()+"','"+train.getType()+"','"+train.getStmt()+"', now())";
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
	
	public ArrayList<TrainVO> getList() throws Exception{
		ArrayList<TrainVO> trains = new ArrayList<TrainVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TRAIN";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				TrainVO train = new TrainVO().setId(rs.getInt(1))
						 								   .setName(rs.getString(2))
						 								   .setType(rs.getString(3))
						 								   .setStmt(rs.getString(4))
						 								   .setStart_date(rs.getDate(5))
						 								   .setEnd_date(rs.getDate(6));
				trains.add(train);
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
		return trains;
	}
	
	public TrainVO selectOneById(String id) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TRAIN WHERE train_id='"+id+"'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return new TrainVO().setId(rs.getInt(1))
											   .setName(rs.getString(2))
											   .setType(rs.getString(3))
											   .setStmt(rs.getString(4))
											   .setStart_date(rs.getDate(5))
											   .setEnd_date(rs.getDate(6));
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

	public int update(TrainVO train) throws Exception{
		int result = 0;
		Connection conn= null;
		Statement stmt = null;
		String sql ;
		if(!train.getStmt().equals("중단")) {
			sql =  "UPDATE train SET train_name='"+train.getName()+"', train_type='"+train.getType()
			+"', stmt='"+train.getStmt()+"', end_date=null WHERE train_id='"+train.getId()+"'";
		}else {
			sql =  "UPDATE train SET train_name='"+train.getName()+"', train_type='"+train.getType()
			+"', stmt='"+train.getStmt()+"', end_date=now() WHERE train_id='"+train.getId()+"'";
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
	
	public int deleteById(String id) throws Exception{
		int result = 0;
		Connection conn= null;
		Statement stmt = null;
		String sql = "DELETE FROM train WHERE train_id='" + id +"'" ;
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
}
