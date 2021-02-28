package dto;

public class TrainSeatsVO {
	private int seatId;
	private String trainId;
	private String carriage;
	private String seatType;
	private String seatLocation;
	public int getSeatId() {
		return seatId;
	}
	public TrainSeatsVO setSeatId(int seatId) {
		this.seatId = seatId;
		return this;
	}
	public String getTrainId() {
		return trainId;
	}
	public TrainSeatsVO setTrainId(String trainId) {
		this.trainId = trainId;
		return this;
	}
	public String getCarriage() {
		return carriage;
	}
	public TrainSeatsVO setCarriage(String carriage) {
		this.carriage = carriage;
		return this;
	}
	public String getSeatType() {
		return seatType;
	}
	public TrainSeatsVO setSeatType(String seatType) {
		this.seatType = seatType;
		return this;
	}
	public String getSeatLocation() {
		return seatLocation;
	}
	public TrainSeatsVO setSeatLocation(String seatLocation) {
		this.seatLocation = seatLocation;
		return this;
	}
	
}
