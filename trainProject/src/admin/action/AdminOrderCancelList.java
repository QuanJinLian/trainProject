package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dto.OrderVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/OrderCancelList.do")
public class AdminOrderCancelList implements Controller,DataBinding{
	private OrderDao orderDao;
	public AdminOrderCancelList setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"cancelyn", String.class,
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String cancelyn = (String) model.get("cancelyn");
		ArrayList<OrderVO> lists = new ArrayList<OrderVO>();
		ArrayList<String> oseqs = orderDao.getOseqsOrderAsc(cancelyn);

		for(String oseq : oseqs) {
			ArrayList<OrderVO> orders = orderDao.getOrderList(oseq);
			ArrayList<String> seatIds  = orderDao.getSeatIds(oseq);
			int price = 0;
			int max = orders.size()-1;
			for(OrderVO order : orders) {
				price +=order.getPrice3();
			}
			OrderVO order = new OrderVO().setDate(orders.get(0).getDate())
															.setTrainName(orders.get(0).getTrainName())
															.setStartStation(orders.get(0).getStartStation())
															.setStartTime(orders.get(0).getStartTime())
															.setEndStation(orders.get(max).getEndStation())
															.setArriveTime(orders.get(max).getArriveTime())
															.setTrainType(orders.get(0).getTrainType())
															.setOseq(orders.get(0).getOseq())
															.setIndate(orders.get(0).getIndate())
															.setPrice1(seatIds.size()) // 예약 매수
															.setPrice3(price)
															.setId(orders.get(0).getId())
															.setCancelyn(orders.get(0).getCancelyn());
			lists.add(order);
		}

		model.put("cancelyn",cancelyn);
		model.put("lists",lists);
		return "/admin/adminOrderCancleList.jsp";
	}


}
