package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderVO {
	private String oseq;
	private String odseq;
	private String id;  // 유저 아이디
	private Timestamp indate;  // 예약 날짜
	private String trainNum;
	private String trainId;
	private String stopId;
	private String seatId;
	private int price1;
	private int price2;
	private int price3;
	private String tickedyn;
	private String cancelyn;
	private String tdseq;
	private String phone;
	private Timestamp date; // 열차 출발 날짜
	private String trainName;
	private String trainType;
	private String carriage;
	private String seatType;
	private String seatLocation;
	private String startStation;
	private String endStation;
	private String startTime;
	private String arriveTime;
	private String cusType;
	
	
	
	
	
	
	public String getTdseq() {
		return tdseq;
	}
	public OrderVO setTdseq(String tdseq) {
		this.tdseq = tdseq;
		return this;
	}
	public String getPhone() {
		return phone;
	}
	public OrderVO setPhone(String phone) {
		this.phone = phone;
		return this;
	}
	public Timestamp getDate() {
		return date;
	}
	public OrderVO setDate(Timestamp date) {
		this.date = date;
		return this;
	}
	public String getTrainName() {
		return trainName;
	}
	public OrderVO setTrainName(String trainName) {
		this.trainName = trainName;
		return this;
	}
	public String getTrainType() {
		return trainType;
	}
	public OrderVO setTrainType(String trainType) {
		this.trainType = trainType;
		return this;
	}
	public String getCarriage() {
		return carriage;
	}
	public OrderVO setCarriage(String carriage) {
		this.carriage = carriage;
		return this;
	}
	public String getSeatType() {
		return seatType;
	}
	public OrderVO setSeatType(String seatType) {
		this.seatType = seatType;
		return this;
	}
	public String getSeatLocation() {
		return seatLocation;
	}
	public OrderVO setSeatLocation(String seatLocation) {
		this.seatLocation = seatLocation;
		return this;
	}
	public String getStartStation() {
		return startStation;
	}
	public OrderVO setStartStation(String startStation) {
		this.startStation = startStation;
		return this;
	}
	public String getEndStation() {
		return endStation;
	}
	public OrderVO setEndStation(String endStation) {
		this.endStation = endStation;
		return this;
	}
	public String getStartTime() {
		return startTime;
	}
	public OrderVO setStartTime(String startTime) {
		this.startTime = startTime;
		return this;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public OrderVO setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
		return this;
	}
	public String getCusType() {
		return cusType;
	}
	public OrderVO setCusType(String cusType) {
		this.cusType = cusType;
		return this;
	}
	public String getOdseq() {
		return odseq;
	}
	public OrderVO setOdseq(String odseq) {
		this.odseq = odseq;
		return this;
	}
	public String getTrainNum() {
		return trainNum;
	}
	public OrderVO setTrainNum(String trainNum) {
		this.trainNum = trainNum;
		return this;
	}
	
	public String getTrainId() {
		return trainId;
	}
	public OrderVO setTrainId(String trainId) {
		this.trainId = trainId;
		return this;
	}
	public String getStopId() {
		return stopId;
	}
	public OrderVO setStopId(String stopId) {
		this.stopId = stopId;
		return this;
	}
	public String getSeatId() {
		return seatId;
	}
	public OrderVO setSeatId(String seatId) {
		this.seatId = seatId;
		return this;
	}
	public int getPrice1() {
		return price1;
	}
	public OrderVO setPrice1(int price1) {
		this.price1 = price1;
		return this;
	}
	public int getPrice2() {
		return price2;
	}
	public OrderVO setPrice2(int price2) {
		this.price2 = price2;
		return this;
	}
	public int getPrice3() {
		return price3;
	}
	public OrderVO setPrice3(int price3) {
		this.price3 = price3;
		return this;
	}
	public String getTickedyn() {
		return tickedyn;
	}
	public OrderVO setTickedyn(String tickedyn) {
		this.tickedyn = tickedyn;
		return this;
	}
	public String getCancelyn() {
		return cancelyn;
	}
	public OrderVO setCancelyn(String cancelyn) {
		this.cancelyn = cancelyn;
		return this;
	}
	public String getOseq() {
		return oseq;
	}
	public OrderVO setOseq(String oseq) {
		this.oseq = oseq;
		return this;
	}
	public String getId() {
		return id;
	}
	public OrderVO setId(String id) {
		this.id = id;
		return this;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public OrderVO setIndate(Timestamp indate) {
		this.indate = indate;
		return this;
	}
}
