package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dto.OrderVO;
import prepare.Component;

@Component("/train/admin/OrderList.do")
public class AdminOrderList implements Controller{
	private OrderDao orderDao;
	public AdminOrderList setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		ArrayList<String> oseqs = orderDao.getOseqsOrderDesc("%");
		ArrayList<OrderVO> lists = new ArrayList<OrderVO>();
		
		
		for(String oseq : oseqs) {
			ArrayList<OrderVO> orders = orderDao.getOrderList(oseq);
			ArrayList<String> seatIds  = orderDao.getSeatIds(oseq);
			int price = 0;
			int max = orders.size()-1;
			for(OrderVO order : orders) {
				price +=order.getPrice3();
			}
			OrderVO order = new OrderVO().setId(orders.get(0).getId())
															.setDate(orders.get(0).getDate())
															.setTrainName(orders.get(0).getTrainName())
															.setStartStation(orders.get(0).getStartStation())
															.setStartTime(orders.get(0).getStartTime())
															.setEndStation(orders.get(max).getEndStation())
															.setArriveTime(orders.get(max).getArriveTime())
															.setTrainType(orders.get(0).getTrainType())
															.setOseq(oseq)
															.setIndate(orders.get(0).getIndate())
															.setPrice1(seatIds.size()) // 예약 매수
															.setPrice3(price)
															.setCancelyn(orders.get(0).getCancelyn());
			lists.add(order);
		}
		model.put("lists",lists);
		return "/admin/adminOrderList.jsp";
	}

}
