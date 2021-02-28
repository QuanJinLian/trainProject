package dto;

import java.sql.Date;

public class TrainTimetableDetailVO {
	private int tdseq;
	private int tdseq1;
	private int tdseq2;
	private int ttseq;
	private String trainNum;
	private Date date;
	private String trainId;
//	private String nosen;
	private String stopId;
	private String startStationName;
	private String endStationName;
	private String startTime;
	private String arriveTime;
	private int stopTime;
	private int price;
	
	public int getTdseq() {
		return tdseq;
	}
	public TrainTimetableDetailVO setTdseq(int tdseq) {
		this.tdseq = tdseq;
		return this;
	}
	public int getTdseq1() {
		return tdseq1;
	}
	public TrainTimetableDetailVO setTdseq1(int tdseq1) {
		this.tdseq1 = tdseq1;
		return this;
	}
	public int getTdseq2() {
		return tdseq2;
	}
	public TrainTimetableDetailVO setTdseq2(int tdseq2) {
		this.tdseq2 = tdseq2;
		return this;
	}
	
	public int getTtseq() {
		return ttseq;
	}
	public TrainTimetableDetailVO setTtseq(int ttseq) {
		this.ttseq = ttseq;
		return this;
	}
	public String getTrainNum() {
		return trainNum;
	}
	public TrainTimetableDetailVO setTrainNum(String trainNum) {
		this.trainNum = trainNum;
		return this;
	}
	public Date getDate() {
		return date;
	}
	public TrainTimetableDetailVO setDate(Date date) {
		this.date = date;
		return this;
	}
	public String getTrainId() {
		return trainId;
	}
	public TrainTimetableDetailVO setTrainId(String trainId) {
		this.trainId = trainId;
		return this;
	}
	public String getStopId() {
		return stopId;
	}
	public TrainTimetableDetailVO setStopId(String stopId) {
		this.stopId = stopId;
		return this;
	}
	public String getStartStationName() {
		return startStationName;
	}
	public TrainTimetableDetailVO setStartStationName(String startStationName) {
		this.startStationName = startStationName;
		return this;
	}
	public String getEndStationName() {
		return endStationName;
	}
	public TrainTimetableDetailVO setEndStationName(String endStationName) {
		this.endStationName = endStationName;
		return this;
	}
	public String getStartTime() {
		return startTime;
	}
	public TrainTimetableDetailVO setStartTime(String startTime) {
		this.startTime = startTime;
		return this;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public TrainTimetableDetailVO setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
		return this;
	}
	public int getStopTime() {
		return stopTime;
	}
	public TrainTimetableDetailVO setStopTime(int stopTime) {
		this.stopTime = stopTime;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public TrainTimetableDetailVO setPrice(int price) {
		this.price = price;
		return this;
	}
	

	
	
}
