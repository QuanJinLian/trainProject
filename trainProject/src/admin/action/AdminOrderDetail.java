package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dto.OrderVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/orderDetail.do")
public class AdminOrderDetail implements Controller,DataBinding {
	private OrderDao orderDao;
	public AdminOrderDetail setOrderDao(OrderDao orderDao) {
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
		ArrayList<String> seatsId = orderDao.getSeatIds(oseq);
		ArrayList<OrderVO> lists = new ArrayList<OrderVO>();
		
		for(String seatId : seatsId) {
			ArrayList<OrderVO> orders = orderDao.getOrderList(oseq, seatId);
			int max = orders.size()-1;
			int price = 0;

			for(OrderVO order : orders) {
				price +=order.getPrice3();
			}
			OrderVO order = new OrderVO().setId(orders.get(0).getId())
														.setOseq(oseq)
														.setIndate(orders.get(0).getIndate())
														.setDate(orders.get(0).getDate())
														.setTrainType(orders.get(0).getTrainType())
														.setTrainName(orders.get(0).getTrainName())
														.setSeatId(orders.get(0).getSeatId())
														.setCarriage(orders.get(0).getCarriage())
														.setSeatType(orders.get(0).getSeatType())
														.setSeatLocation(orders.get(0).getSeatLocation())
														.setStartStation(orders.get(0).getStartStation())
														.setStartTime(orders.get(0).getStartTime())
														.setEndStation(orders.get(max).getEndStation())
														.setArriveTime(orders.get(max).getArriveTime())
														.setPrice3(price)
														.setCusType(orders.get(0).getCusType())
														.setCancelyn(orders.get(0).getCancelyn());
			lists.add(order);				
		}
		model.put("orderDetail",lists);
		return "/admin/adminOrderDetail.jsp";
	}

}
