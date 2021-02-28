package dto;

import java.sql.Date;

public class TrainVO {
	private int id;
	private String name;
	private String type;
	private String stmt;
	private Date start_date;
	private Date end_date;
	private String seatsCnt;
	
	
	public String getSeatsCnt() {
		return seatsCnt;
	}
	public TrainVO setSeatsCnt(String seatsCnt) {
		this.seatsCnt = seatsCnt;
		return this;
	}
	public int getId() {
		return id;
	}
	public TrainVO setId(int id) {
		this.id = id;
		return this;
	}
	public String getName() {
		return name;
	}
	public TrainVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getType() {
		return type;
	}
	public TrainVO setType(String type) {
		this.type = type;
		return this;
	}
	public String getStmt() {
		return stmt;
	}
	public TrainVO setStmt(String stmt) {
		this.stmt = stmt;
		return this;
	}
	public Date getStart_date() {
		return start_date;
	}
	public TrainVO setStart_date(Date start_date) {
		this.start_date = start_date;
		return this;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public TrainVO setEnd_date(Date end_date) {
		this.end_date = end_date;
		return this;
	}
	

}
