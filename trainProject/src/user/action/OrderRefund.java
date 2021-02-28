package user.action;

import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/UserRefund.do")
public class OrderRefund implements Controller,DataBinding{
	private OrderDao orderDao;
	public OrderRefund setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"oseq", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String oseq = (String) model.get("oseq");
		int result_cancle = orderDao.setCancleyn(oseq, "y");  // n->디폴트(캔슬한적없음) //  y->환불신청 // p->처리중// c->처리완료(금액이체완료) 
		model.put("result_cancle", result_cancle);
		return "/user/orderList.jsp";
	}

}
