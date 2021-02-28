package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.OrderVO;
import oracle.net.aso.r;
import prepare.Component;

@Component("orderDao")
public class OrderDao {	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	public ArrayList<String> getOseqsOrderDesc(String cancelyn) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> oseqs = new ArrayList<String>();
		String sql =  "SELECT distinct OSEQ  FROM order_view  where cancelyn like '%" +cancelyn+"%' ORDER BY oseq DESC";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				oseqs.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return oseqs;
	}
	
	public ArrayList<String> getOseqsOrderAsc(String cancelyn) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> oseqs = new ArrayList<String>();
		String sql =  "SELECT distinct OSEQ  FROM order_view  where cancelyn like '%" +cancelyn+"%' ORDER BY oseq ASC";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				oseqs.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return oseqs;
	}
	
	public ArrayList<String> getOseqs(String id ,String ticketyn) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> oseqs = new ArrayList<String>();
		String sql =  "SELECT distinct OSEQ  FROM order_view  where ID='" 
						+id+"' and tickedyn like '%" +ticketyn+"%' ORDER BY oseq DESC";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				oseqs.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return oseqs;
	}

	public String getMaxOseq(String id) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int result_addOrder;
		String sql;
		String oseq = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "insert into orders_train (id) values ('" + id + "')";
			result_addOrder = stmt.executeUpdate(sql);
			if (result_addOrder != -1) {
				sql = "select max(oseq) From orders_train where id ='" + id + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					oseq = rs.getString(1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return oseq;
	}
	
	public ArrayList<String> getSeatIds(String oseq) throws Exception{
		ArrayList<String> seatIds = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT distinct seat_id  FROM order_view  where oseq='" +oseq+"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				seatIds.add(rs.getString(1));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return seatIds;
	}
	

	public int insertOrderDetail(String oseq, String tdseq, String seat_id, int price1, int price2, int price3, String cusType) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int result_addOrderDetail = 0;
		String sql;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "insert into order_detail_train (oseq, tdseq, seat_id, price1, price2, price3, cusType) values ('"
					+ oseq + "','" + tdseq + "','" + seat_id+ "','" +price1 + "','" + price2 + "','" 
					+ price3+ "','" + cusType + "')";
			result_addOrderDetail = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result_addOrderDetail;
	}
	
	public int getOrderSeatsCnt(int tdseq1, int tdseq2) throws Exception{
		int Cnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(distinct seat_id) FROM order_view  where  tdseq between '"+tdseq1+"' and '"+tdseq2+"'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				Cnt = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return Cnt;
	}
	
	public ArrayList<OrderVO> getOrderSeats(String tdseq1, String tdseq2 , String carriage) throws Exception{
		ArrayList<OrderVO> seatids = new ArrayList<OrderVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT distinct seat_id,seat_location  FROM order_view  where  tdseq between '"+tdseq1
				+"' and '"+tdseq2+"' and carriage='" +carriage+"' and cancelyn='n'";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
//			System.out.println(rs.next());
			while (rs.next()){
				OrderVO saleSeat = new OrderVO().setSeatId(rs.getString(1))
																	.setSeatLocation(rs.getString(2));
				seatids.add(saleSeat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return seatids;
	}

	
	public ArrayList<OrderVO> getOrderList(String oseq,String seatId) throws Exception{
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM order_view  where oseq='"+oseq+"' and seat_id='"+seatId+"'"; 
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				OrderVO order = new OrderVO().setOseq(rs.getString(1))
																   .setOdseq(rs.getString(2))
																   .setTdseq(rs.getString(3))
																   .setId(rs.getString(4))
																   .setPhone(rs.getString(5))
																   .setIndate(Timestamp.valueOf(rs.getString(6)))
																   .setTrainNum(rs.getString(7))
																   .setTrainId(rs.getString(8))
																   .setDate(Timestamp.valueOf(rs.getString(9)))
																   .setTrainName(rs.getString(10))
																   .setTrainType(rs.getString(11))
																   .setSeatId(rs.getString(12))
																   .setCarriage(rs.getString(13))
																   .setSeatType(rs.getString(14))
																   .setSeatLocation(rs.getString(15))
																   .setStopId(rs.getString(16))
																   .setStartStation(rs.getString(17))
																   .setEndStation(rs.getString(18))
																   .setStartTime(rs.getString(19))
																   .setArriveTime(rs.getString(20))
																   .setPrice1(rs.getInt(21))
																   .setPrice2(rs.getInt(22))
																   .setPrice3(rs.getInt(23))
																   .setCusType(rs.getString(24))
																   .setTickedyn(rs.getString(25))
																   .setCancelyn(rs.getString(26));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	
	public ArrayList<OrderVO> getOrderList(String oseq) throws Exception{
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM order_view  where oseq='"+oseq+"'"; 
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				OrderVO order = new OrderVO().setOseq(rs.getString(1))
																   .setOdseq(rs.getString(2))
																   .setTdseq(rs.getString(3))
																   .setId(rs.getString(4))
																   .setPhone(rs.getString(5))
																   .setIndate(Timestamp.valueOf(rs.getString(6)))
																   .setTrainNum(rs.getString(7))
																   .setTrainId(rs.getString(8))
																   .setDate(Timestamp.valueOf(rs.getString(9)))
																   .setTrainName(rs.getString(10))
																   .setTrainType(rs.getString(11))
																   .setSeatId(rs.getString(12))
																   .setCarriage(rs.getString(13))
																   .setSeatType(rs.getString(14))
																   .setSeatLocation(rs.getString(15))
																   .setStopId(rs.getString(16))
																   .setStartStation(rs.getString(17))
																   .setEndStation(rs.getString(18))
																   .setStartTime(rs.getString(19))
																   .setArriveTime(rs.getString(20))
																   .setPrice1(rs.getInt(21))
																   .setPrice2(rs.getInt(22))
																   .setPrice3(rs.getInt(23))
																   .setCusType(rs.getString(24))
																   .setTickedyn(rs.getString(25))
																   .setCancelyn(rs.getString(26));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	public int deleteOrderByOseq(String oseq) throws Exception{
		int result_order = 0 ; 
		int result_orderDetail = 0 ;
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		ResultSet rs = null;
		String sql ;
		try {
			stmt = conn.createStatement();
			sql = "SELECT oseq FROM order_detail_train WHERE tickedyn='1' and oseq='"+oseq+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				sql = "DELETE FROM orders_train WHERE oseq='"+oseq+"'";
				result_order = stmt.executeUpdate(sql);
				if(result_order != -1) {
					sql =  "DELETE FROM order_detail_train WHERE tickedyn='1' and oseq='"+oseq+"'";
					result_orderDetail = stmt.executeUpdate(sql);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result_orderDetail;
	}
	public int setResult(String oseq) throws Exception {
		int result =0; 
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		String sql =  "UPDATE order_detail_train SET tickedyn='2' WHERE oseq='"+oseq+"'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public int setCancleyn(String oseq,String cancelyn) throws Exception {
		int result =0; 
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		String sql =  "UPDATE order_detail_train SET cancelyn='"+cancelyn+"' WHERE oseq='"+oseq+"'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public int setCancleyn(String oseq,String cancelyn, String seatId) throws Exception {
		int result =0; 
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		String sql =  "UPDATE order_detail_train SET cancelyn='"+cancelyn+"' WHERE oseq='"+oseq+"' and seat_id='"+seatId+"'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public boolean findOseq(String oseq,String tickedyn) throws Exception{
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = "SELECT oseq FROM order_detail_train WHERE oseq='"+oseq+"' and tickedyn like '%"+tickedyn+"%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			result = rs.next();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public int getCancelCnt() throws Exception{
		int cnt = 0 ;
		Connection conn = ds.getConnection(); 
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(distinct oseq) FROM order_detail_train WHERE cancelyn='y'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		return cnt ;
	}
	
}
