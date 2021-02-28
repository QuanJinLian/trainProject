package user.action;


import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dto.OrderVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/ticketView.do")
public class ViewTicket implements Controller , DataBinding{
	private OrderDao orderDao;
	public ViewTicket setOrderDao ( OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"oseq", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String oseq = (String) model.get("oseq");
		ArrayList<String> seatIds = orderDao.getSeatIds(oseq);
		
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
																.setIndate(orderLists.get(0).getIndate())
																.setTrainType(orderLists.get(0).getTrainType())
																.setDate(orderLists.get(0).getDate())
																.setId(orderLists.get(0).getId())
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
		
		model.put("viewList", viewList);
		return "/user/ticketView.jsp";
	}

}
