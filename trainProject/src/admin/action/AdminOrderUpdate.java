package admin.action;

import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/orderUpdate.do")
public class AdminOrderUpdate implements Controller,DataBinding {
	private OrderDao orderDao;
	public AdminOrderUpdate setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"oseq", String.class,
				"results", String.class,
				"seatIds", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String[]  results = ((String)model.get("results")).split(",");
		String[]  seatIds = ((String)model.get("seatIds")).split(",");
		String oseq = (String)model.get("oseq");
		int result_update = 0; 
		for(int i = 0; i < results.length; i++) {
			result_update += orderDao.setCancleyn(oseq, results[i], seatIds[i]);
		}
		model.put("oseq", oseq);
		model.put("result_update", result_update);
		return "/admin/adminOrderDetail.jsp";
	}

}
