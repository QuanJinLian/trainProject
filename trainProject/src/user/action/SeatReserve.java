package user.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dao.TrainSeatsDao;
import dao.TrainTimetableDao;
import dto.OrderVO;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/seatReserve.do")
public class SeatReserve implements Controller, DataBinding{
	
	private TrainTimetableDao trainTimetableDao;
	public SeatReserve setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}

	private OrderDao orderDao;
	public SeatReserve setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}


	private TrainSeatsDao trainSeatDao;
	public SeatReserve setTrainSeatsDao(TrainSeatsDao trainSeatDao) {
		this.trainSeatDao = trainSeatDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"adult", Integer.class,
				"disabled", Integer.class,
				"children", Integer.class,
				"old", Integer.class,
				"trainId",  String.class,
				"tdseq1", String.class,
				"tdseq2", String.class,
				"seatIds", String.class,
				"id", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Integer adult = (Integer)model.get("adult");
		Integer disabled = (Integer)model.get("disabled");
		Integer children = (Integer)model.get("children");
		Integer old = (Integer)model.get("old");
		String trainId = (String) model.get("trainId");
		String tdseq1 = (String) model.get("tdseq1");
		String tdseq2 = (String) model.get("tdseq2");
		String seatIds [] = ((String) model.get("seatIds")).split(",");
		String id = (String) model.get("id");
		
		String oseq = orderDao.getMaxOseq(id);
		int point = 0;
		int price = 0;    // 시트별 구간별 가격
		int price_down=0;
		
		ArrayList<TrainTimetableDetailVO> tables = trainTimetableDao.getTimetables(Integer.parseInt(tdseq1), Integer.parseInt(tdseq2));

			for(int i = 0 ; i < adult ; i++) {   // 어른 오더 생성
				for(TrainTimetableDetailVO table : tables) { 
					if(trainSeatDao.getSeatType(seatIds[i]).equals("일반")){
						price =table.getPrice();
					}else if(trainSeatDao.getSeatType(seatIds[i]).equals("특실")){
						price =(int)(table.getPrice()*1.1);
					}
					point += (int)(price*0.1);
					orderDao.insertOrderDetail(oseq, String.valueOf(table.getTdseq()), seatIds[i], price, 0, price, "어른");
				}
			}
			for(int i = 0 ; i < disabled; i++) {    // 장애인 오더 생성
				for(TrainTimetableDetailVO table : tables) { 
					if(trainSeatDao.getSeatType(seatIds[i+adult]).equals("일반")){
						price =table.getPrice();
					}else if(trainSeatDao.getSeatType(seatIds[i+adult]).equals("특실")){
						price =(int)(table.getPrice()*1.1);
					}
					price_down =(int)(price*0.5);
					orderDao.insertOrderDetail(oseq, String.valueOf(table.getTdseq()), seatIds[i+adult], price, price_down, price_down, "중경증");
				}
			}
			for(int i = 0 ; i < children; i++) {  // 어린이 오더 생성
				for(TrainTimetableDetailVO table : tables) {  
					if(trainSeatDao.getSeatType(seatIds[i+adult+disabled]).equals("일반")){
						price =table.getPrice();
					}else if(trainSeatDao.getSeatType(seatIds[i+adult+disabled]).equals("특실")){
						price =(int)(table.getPrice()*1.1);
					}
					price_down =(int)(price*0.5);
					orderDao.insertOrderDetail(oseq, String.valueOf(table.getTdseq()), seatIds[i+adult+disabled], price, price_down, price_down, "어린이");
				}
			}
			for(int i = 0 ; i < old; i++) {    // 경로 오더 생성
				for(TrainTimetableDetailVO table : tables) { 
					if(trainSeatDao.getSeatType(seatIds[i+adult+disabled+children]).equals("일반")){
						price =table.getPrice();
					}else if(trainSeatDao.getSeatType(seatIds[i+adult+disabled+children]).equals("특실")){
						price =(int)(table.getPrice()*1.1);
					}
					price_down =(int)(price*0.5);
					orderDao.insertOrderDetail(oseq, String.valueOf(table.getTdseq()), seatIds[i+adult+disabled+children], price, price_down, price_down, "경로");
				}
			}
			
			ArrayList<OrderVO> viewList = new ArrayList<OrderVO>();
			
			for(String seatId : seatIds ) {
				ArrayList<OrderVO> orderLists = orderDao.getOrderList(oseq, seatId);
				int max= orderLists.size()-1;
				int price1 = 0;
				int price2 = 0;
				int price3 = 0;
				for(OrderVO orderList : orderLists) {  // 가격을 계산한다
					price1 += orderList.getPrice1();
					price2 += orderList.getPrice2();
					price3 += orderList.getPrice3();
				}
				OrderVO orderList = new OrderVO().setTrainNum(orderLists.get(0).getTrainNum())
																	.setTrainType(orderLists.get(0).getTrainType())
																	.setStartStation(orderLists.get(0).getStartStation())
																	.setEndStation(orderLists.get(max).getEndStation())
																	.setStartTime(orderLists.get(0).getStartTime())
																	.setArriveTime(orderLists.get(max).getArriveTime())
																	.setPrice1(price1)
																	.setPrice2(price2)
																	.setPrice3(price3)
																	.setSeatType(orderLists.get(0).getSeatType())
																	.setCarriage(orderLists.get(0).getCarriage())
																	.setSeatId(orderLists.get(0).getSeatId())
																	.setSeatLocation(orderLists.get(0).getSeatLocation())
																	.setCusType(orderLists.get(0).getCusType())
																	.setOseq(orderLists.get(0).getOseq());
				viewList.add(orderList);
			}

			Thread thread = thread(oseq) ;
			thread.start();
			model.put("viewList", viewList);
			model.put("point", point);
			
			return "/user/reservePage.jsp";
	}
	
	
	public Thread thread(String oseq) {
		Thread thread = new Thread() {
			int minute = 5;
			public void run() {
				while(true) {
					minute--;
					if(minute ==0) {
						try {
							orderDao.deleteOrderByOseq(oseq);
						} catch (Exception e) { e.printStackTrace(); }
						minute =5;
						break;
					}
					try {
						Thread.sleep(60000);
					}catch (Exception e) {}
				}
			}
		};
		return thread;
	}


}
