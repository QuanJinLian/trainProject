package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.TrainTimetableDetailVO;
import dto.TrainTimetableVO;
import prepare.Component;

@Component("trainTimetableDao")
public class TrainTimetableDao {
	ArrayList<String> trainNums;
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	public int insertTimetable(String name) throws Exception{
		int result = 0 ;
		Connection conn = null;
		Statement stmt = null;
		String sql ="insert into traintime(train_name) values('"+name+"')";
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
	
	public String getLastTtseq(String name) throws Exception {
		String ttseq = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs= null;
		String sql =  "select max(ttseq) From traintime where train_name ='" + name + "'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				ttseq = rs.getString(1);
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
		return ttseq;
	}
	
	public ArrayList<String> getTtseqs() throws Exception{
		ArrayList<String> ttseqs = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs= null;
		String sql ="SELECT * FROM traintime";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ttseqs.add(rs.getString(1));
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
		
		return ttseqs;
	}
	
	public ArrayList<TrainTimetableDetailVO> getTimetablesBytrainNum(String train_num) throws Exception{
		ArrayList<TrainTimetableDetailVO> timetables = new ArrayList<TrainTimetableDetailVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs= null;
		String sql = "SELECT * FROM traintime_detail WHERE train_num='"+train_num+"'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				TrainTimetableDetailVO table = new TrainTimetableDetailVO().setTdseq(rs.getInt(1))
																						.setTtseq(rs.getInt(2))
																						.setTrainNum(rs.getString(3))
																						.setDate(rs.getDate(4))
																						.setTrainId(rs.getString(5))
																						.setStopId(rs.getString(6))
																						.setStartStationName(rs.getString(7))
																						.setEndStationName(rs.getString(8))
																						.setStartTime(rs.getString(9))
																						.setArriveTime(rs.getString(10))
																						.setStopTime(rs.getInt(11))
																						.setPrice(rs.getInt(12));
				timetables.add(table);																		
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
		return timetables;
	}
	
	public ArrayList<TrainTimetableDetailVO> getTimetables(String ttseqOrTrain_num) throws Exception{
		ArrayList<TrainTimetableDetailVO> timetables = new ArrayList<TrainTimetableDetailVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs= null;
		String sql ;
		int i = ttseqOrTrain_num.length();
//		System.out.println(i);
		if(i > 10 ) {
			sql = "SELECT * FROM traintime_detail WHERE train_num='"+ttseqOrTrain_num+"'";
		}else {
			sql = "SELECT * FROM traintime_detail WHERE ttseq='"+ttseqOrTrain_num+"'";
		}
//		sql = "SELECT * FROM traintime_detail WHERE ttseq='"+ttseq+"'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				TrainTimetableDetailVO table = new TrainTimetableDetailVO().setTdseq(rs.getInt(1))
																						.setTtseq(rs.getInt(2))
																						.setTrainNum(rs.getString(3))
																						.setDate(rs.getDate(4))
																						.setTrainId(rs.getString(5))
																						.setStopId(rs.getString(6))
																						.setStartStationName(rs.getString(7))
																						.setEndStationName(rs.getString(8))
																						.setStartTime(rs.getString(9))
																						.setArriveTime(rs.getString(10))
																						.setStopTime(rs.getInt(11))
																						.setPrice(rs.getInt(12));
				timetables.add(table);																		
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
		return timetables;
	}
	public ArrayList<TrainTimetableDetailVO> getTimetables(int tdseq1, int tdseq2) throws Exception{
		ArrayList<TrainTimetableDetailVO> timetables = new ArrayList<TrainTimetableDetailVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs= null;
		String sql ;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
				sql = "SELECT * FROM traintime_detail WHERE tdseq BETWEEN '"+tdseq1+"' AND '"+tdseq2+"'";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					TrainTimetableDetailVO table = new TrainTimetableDetailVO().setTdseq(rs.getInt(1))
																							.setTtseq(rs.getInt(2))
																							.setTrainNum(rs.getString(3))
																							.setDate(rs.getDate(4))
																							.setTrainId(rs.getString(5))
																							.setStopId(rs.getString(6))
																							.setStartStationName(rs.getString(7))
																							.setEndStationName(rs.getString(8))
																							.setStartTime(rs.getString(9))
																							.setArriveTime(rs.getString(10))
																							.setStopTime(rs.getInt(11))
																							.setPrice(rs.getInt(12));
					timetables.add(table);																		
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
		return timetables;
		
	}
	
	
	public int insertTimetableDetail(String ttseq, String num, Date date,String id, int stopId,String sname, String ename, Time sttime, Time atime, String stime, String price ) throws Exception {
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null;
		String sql = "INSERT INTO traintime_detail (ttseq, train_num, date, train_id, stop_id, start_station_name,"
							+"end_station_name, start_time, arrive_time, stop_time, price) values('"
							+ttseq+"','"+num+"','"+date+"','"+id+"','"+stopId+"','"+sname+"','"+ename+"','"+sttime+"','"+atime+"','"+stime+"','"+price+"')";
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
	
//	public ArrayList<String> getTrainNums() throws Exception{
//		trainNums = new ArrayList<String>();
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		String sql = "SELECT distinct train_num FROM train.traintime ORDER BY date DESC";
//		try {
//			conn = ds.getConnection();
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()){
//				trainNums.add(rs.getString(1));
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (stmt != null) stmt.close();
//				if (conn != null) conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return trainNums;
//	}
	
//	public ArrayList<TrainTimetableVO> getTimeTableList() throws Exception{
//		ArrayList<TrainTimetableVO> timetables = new ArrayList<TrainTimetableVO>();
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		String sql ;
//		getTrainNums();
//		try {
//			conn = ds.getConnection();
//			stmt = conn.createStatement();
//			for(String trainNum : trainNums) {
//				sql = "SELECT * FROM train.traintime WHERE train_num='"+trainNum+"'  ORDER BY stop_id ASC";
//				rs = stmt.executeQuery(sql);
//				TrainTimetableVO timetable = new TrainTimetableVO();
//				while(rs.next()) {
//					if(rs.getInt("stop_id")==0) {
//						timetable.setStartStationName(rs.getString("start_station_name"));
//						timetable.setStartTime(rs.getString("start_time"));
//					}
//					timetable.setTrainNum(rs.getString("train_num"));
//					timetable.setEndStationName(rs.getString("end_station_name"));
//					timetable.setArriveTime(rs.getString("arrive_time"));
//				}
//				timetables.add(timetable);
//			}
//			
//		}catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (stmt != null) stmt.close();
//				if (conn != null) conn.close();
//			} catch (Exception e) {
//			}
//		}
//		
//		return timetables;
//	}
	
	public int deleteTrainTime(String ttseq) throws Exception{
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null;
		String sql ="DELETE FROM traintime WHERE ttseq='"+ttseq+"'";
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
	public int deleteTraintime_detail(String ttseq) throws Exception{
		int result = 0 ; 
		Connection conn = null;
		Statement stmt = null;
		String sql ="DELETE FROM traintime_detail WHERE ttseq='"+ttseq+"'";
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
	
	public ArrayList<Integer> getTdseqs (Date date, String startStation, String endStation, Time time) throws Exception{
		ArrayList<Integer> tdseqs = new ArrayList<Integer>();
//		ArrayList<String> trainNums = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs= null;
		ResultSet rs1 = null;
		String trainNum = null;
//		trainNums.clear();
		
		String sql = "SELECT * FROM traintime_detail WHERE date='" +date 
				+ "' AND start_station_name='"+startStation+"' AND start_time >= '"+time+"' ORDER BY start_time ASC";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String ttseq = rs.getString(2);
				trainNum = rs.getString(3);
//				System.out.println(trainNum);
				String sql1="SELECT * FROM traintime_detail WHERE train_num='"+trainNum
						+"' AND end_station_name='"+endStation+"' AND ttseq='"+ttseq+"'";
				stmt1 = conn.createStatement();
				rs1 = stmt1.executeQuery(sql1);
				while (rs1.next()) {
//					trainNums.add(rs1.getString(3));
					tdseqs.add(rs.getInt(1));
					tdseqs.add(rs1.getInt(1));
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs1 != null) rs1.close();
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(stmt1 != null) stmt1.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return tdseqs;
	}

}
