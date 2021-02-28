package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.QnaTrain;
import prepare.Component;

@Component("qnaDao")
public class QnADao {
	
	int listCnt ;   //db의 갯수 구해오기 
	int viewCnt_onePage = 5; // 한페이지에 보여지는 양
	int pageCnt = 0;    //페이지 수량
	
	private DataSource ds;
	public void setDataSoure(DataSource ds) {
		this.ds = ds;
	}
	
	
	public int listCnt()  throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		listCnt =0;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT count(*) FROM QNA"; 
			rs = stmt.executeQuery(sql); 
			if(rs.next()) {
				listCnt = rs.getInt(1);
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
		return listCnt;
	}
	
	public int pageCnt()  throws Exception {
		try {
			listCnt();
		}catch (Exception e) {}
		if(listCnt % viewCnt_onePage ==0 && listCnt > viewCnt_onePage) {
			pageCnt = listCnt / viewCnt_onePage;
		}else if(listCnt % viewCnt_onePage !=0 || listCnt < viewCnt_onePage) {
			pageCnt = listCnt / viewCnt_onePage + 1;
		}
		return pageCnt;
	}
	
	public int pageCnt(int viewCnt_onePage) throws Exception  {
		try {
			this.viewCnt_onePage = viewCnt_onePage;
			listCnt();
		}catch (Exception e) {}
		if(listCnt % viewCnt_onePage ==0 && listCnt > viewCnt_onePage) {
			pageCnt = listCnt / viewCnt_onePage;
		}else if(listCnt % viewCnt_onePage !=0 || listCnt < viewCnt_onePage) {
			pageCnt = listCnt / viewCnt_onePage + 1;
		}
		return pageCnt;
	}
	
	public ArrayList<QnaTrain> qnaList(int pageNo) throws Exception{
		ArrayList<QnaTrain> qnaList = new ArrayList<QnaTrain>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate("SET @CNT=0");
			stmt.executeUpdate("UPDATE QNA SET QNA.qseq=@CNT:=@CNT+1");
			String sql = "SELECT * FROM QNA ORDER BY QSEQ DESC LIMIT "+((pageNo-1)*viewCnt_onePage)+","+viewCnt_onePage;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				qnaList.add(new QnaTrain().setQseq(rs.getInt(1))
											.setSubject(rs.getString(2))
											.setContent(rs.getString(3))
											.setReply(rs.getString(4))
											.setId(rs.getString(5))
											.setRep(rs.getString(6))
											.setIndate(Timestamp.valueOf(rs.getString(7)))
											.setRep_id(rs.getString(8)));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return qnaList;
	}
	
	public ArrayList<QnaTrain> qnaList() throws Exception{
		ArrayList<QnaTrain> qnaList = new ArrayList<QnaTrain>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate("SET @CNT=0");
			stmt.executeUpdate("UPDATE QNA SET QNA.qseq=@CNT:=@CNT+1");
			String sql = "SELECT * FROM QNA ORDER BY QSEQ DESC ";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				QnaTrain qna = new QnaTrain().setQseq(rs.getInt(1))
														.setSubject(rs.getString(2))
														.setContent(rs.getString(3))
														.setReply(rs.getString(4))
														.setId(rs.getString(5))
														.setRep(rs.getString(6))
														.setIndate(Timestamp.valueOf(rs.getString(7)))
														.setRep_id(rs.getString(8));
				qnaList.add(qna);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return qnaList;
	}
	
	public int updateContent(String content, String qseq) throws Exception{
		int result = -1;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE qna set content='"+content+"' WHERE qseq='"+qseq+"'";
			result = stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return result;
		
	}
	
	public int addQuestion(String id, String content, String subject)  throws Exception{
		Connection conn = null;
		Statement stmt = null;
		try {
			conn =ds.getConnection();
			stmt = conn.createStatement();
			String sql ="insert into qna ( subject, content, id) values('"+subject+"', '"+content+"', '"+id+"')";
			return stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return 0;
	}
	
	public int deleteReply(String qseq) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE QNA SET reply='' , rep_id='' , REP='1' WHERE QSEQ='"+qseq+"'";
			return stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return 0;
	}
	
	public QnaTrain viewQusetionDetail(String qseq)  throws Exception{
		QnaTrain qna = new QnaTrain();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM QNA WHERE QSEQ='"+qseq+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				qna.setQseq(rs.getInt(1))
				.setSubject(rs.getString(2))
				.setContent(rs.getString(3))
				.setReply(rs.getString(4))
				.setId(rs.getString(5))
				.setRep(rs.getString(6))
				.setIndate(Timestamp.valueOf(rs.getString(7)))
				.setRep_id(rs.getString(8));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return qna;
	}
	
	
	
	public int UpdateReply(String qseq, String reply, String id)  throws Exception{
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE QNA SET reply='"+reply+"' , rep_id='"+id+"' , REP='2' WHERE QSEQ='"+qseq+"'";
			return stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return 0;
	}
	
	public int DeleteQnA(String qseq) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql =  "DELETE FROM qna WHERE qseq='"+qseq+"'";
			return stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return 0;
	}
	
}
