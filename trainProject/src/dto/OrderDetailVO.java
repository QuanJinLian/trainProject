package dto;

public class OrderDetailVO {
	private int odseq;
	private int oseq; 
	private String trainNum;
	private int stopId;
	private String seatId;
	private int price1;
	private int price2;
	private int price3;
	private String tickedyn;
	private String cancelyn;
	
	
	public int getOdseq() {
		return odseq;
	}
	public OrderDetailVO setOdseq(int odseq) {
		this.odseq = odseq;
		return this;
	}
	public int getOseq() {
		return oseq;
	}
	public OrderDetailVO setOseq(int oseq) {
		this.oseq = oseq;
		return this;
	}
	public String getTrainNum() {
		return trainNum;
	}
	public OrderDetailVO setTrainNum(String trainNum) {
		this.trainNum = trainNum;
		return this;
	}
	public int getStopId() {
		return stopId;
	}
	public OrderDetailVO setStopId(int stopId) {
		this.stopId = stopId;
		return this;
	}
	public String getSeatId() {
		return seatId;
	}
	public OrderDetailVO setSeatId(String seatId) {
		this.seatId = seatId;
		return this;
	}
	public int getPrice1() {
		return price1;
	}
	public OrderDetailVO setPrice1(int price1) {
		this.price1 = price1;
		return this;
	}
	public int getPrice2() {
		return price2;
	}
	public OrderDetailVO setPrice2(int price2) {
		this.price2 = price2;
		return this;
	}
	public int getPrice3() {
		return price3;
	}
	public OrderDetailVO setPrice3(int price3) {
		this.price3 = price3;
		return this;
	}
	public String getTickedyn() {
		return tickedyn;
	}
	public OrderDetailVO setTickedyn(String tickedyn) {
		this.tickedyn = tickedyn;
		return this;
	}
	public String getCancelyn() {
		return cancelyn;
	}
	public OrderDetailVO setCancelyn(String cancelyn) {
		this.cancelyn = cancelyn;
		return this;
	}
	
	
}
