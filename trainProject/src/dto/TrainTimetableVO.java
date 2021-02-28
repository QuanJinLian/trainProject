package dto;

import java.sql.Date;

public class TrainTimetableVO {
	private int ttseq;
	private String trainName;
	private Date indate;
	public int getTtseq() {
		return ttseq;
	}
	public TrainTimetableVO setTtseq(int ttseq) {
		this.ttseq = ttseq;
		return this;
	}
	public String getTrainName() {
		return trainName;
	}
	public TrainTimetableVO setTrainName(String trainName) {
		this.trainName = trainName;
		return this;
	}
	public Date getIndate() {
		return indate;
	}
	public TrainTimetableVO setIndate(Date indate) {
		this.indate = indate;
		return this;
	}
	

}
