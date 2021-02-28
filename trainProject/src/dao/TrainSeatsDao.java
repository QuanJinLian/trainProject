package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.TrainSeatsVO;
import prepare.Component;

@Component("trainSeatsDao")
public class TrainSeatsDao {
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public int insert (String id, String carriage,String seatType, String seatLocation) throws Exception {
		int resut= 0;
		Connection conn = null;
		Statement stmt = null;
		String sql =  "INSERT INTO seats (train_id, carriage, seat_type, seat_location) values('"
				+id+"','"+carriage+"','"+seatType+"','"+seatLocation+"')";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}	
		return resut;
	}
	
	public int getSeatsCnt(String id) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) from seats Where train_id='"+id+"'";
		int Cnt=0;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				Cnt = rs.getInt(1);
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
		return Cnt;
	}
	
	public ArrayList<TrainSeatsVO> getCarriages(String trainId) throws Exception{
		ArrayList<TrainSeatsVO> carriages = new ArrayList<TrainSeatsVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT distinct carriage, seat_type from train.seats where train_id='"+trainId+"'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				carriages.add(new TrainSeatsVO().setCarriage(rs.getString(1))
												.setSeatType(rs.getString(2)));	
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
		return carriages;
	}
	public ArrayList<TrainSeatsVO> getAllSeats(String trainId, String carriageNum) throws Exception{
		ArrayList<TrainSeatsVO> seats =  new ArrayList<TrainSeatsVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM train.seats where train_id='"+trainId+"' and carriage='"+carriageNum+"'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				seats.add(new TrainSeatsVO().setSeatId(rs.getInt(1))
											.setTrainId(rs.getString(2))
											.setCarriage(rs.getString(3))
											.setSeatType(rs.getString(4))
											.setSeatLocation(rs.getString(5)));
				
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
		return seats;
	}
	public String getSeatType(String seatId) throws Exception{
		String seatType = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT seat_type FROM train.seats WHERE seat_id='"+seatId+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				seatType = rs.getString(1);
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
		return seatType;
	}
	
}
