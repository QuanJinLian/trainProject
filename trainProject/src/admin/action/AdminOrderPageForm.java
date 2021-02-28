package admin.action;

import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import prepare.Component;

@Component("/train/admin/trainOrderPage.do")
public class AdminOrderPageForm implements Controller{
	private OrderDao orderDao;
	public AdminOrderPageForm setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int cancelCnt = orderDao.getCancelCnt();
		model.put("cancelCnt", cancelCnt);
//		System.out.println(cancelCnt);
		return "/admin/adminOrderPage.jsp";
	}

}
