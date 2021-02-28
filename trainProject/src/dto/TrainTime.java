package dto;

import java.sql.Date;

public class TrainTime {
	private String trainNum;
	private String trainId;
//	private String nosen;
	private String stopId;
	private String startStationName;
	private String endStationName;
	private Date startTime;
	private Date arriveTime;
	private int stopTime;
	private int price;
	public String getTrainNum() {
		return trainNum;
	}
	public TrainTime setTrainNum(String trainNum) {
		this.trainNum = trainNum;
		return this;
	}
	public String getTrainId() {
		return trainId;
	}
	public TrainTime setTrainId(String trainId) {
		this.trainId = trainId;
		return this;
	}
	public String getStopId() {
		return stopId;
	}
	public TrainTime setStopId(String stopId) {
		this.stopId = stopId;
		return this;
	}
	public String getStartStationName() {
		return startStationName;
	}
	public TrainTime setStartStationName(String startStationName) {
		this.startStationName = startStationName;
		return this;
	}
	public String getEndStationName() {
		return endStationName;
	}
	public TrainTime setEndStationName(String endStationName) {
		this.endStationName = endStationName;
		return this;
	}
	public Date getStartTime() {
		return startTime;
	}
	public TrainTime setStartTime(Date startTime) {
		this.startTime = startTime;
		return this;
	}
	public Date getArriveTime() {
		return arriveTime;
	}
	public TrainTime setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
		return this;
	}
	public int getStopTime() {
		return stopTime;
	}
	public TrainTime setStopTime(int stopTime) {
		this.stopTime = stopTime;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public TrainTime setPrice(int price) {
		this.price = price;
		return this;
	}
	
	
}
