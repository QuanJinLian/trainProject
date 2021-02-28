package user.action;

import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/deleteReserve.do")
public class DeleteReserve implements Controller, DataBinding{
	private OrderDao orderDao;
	public DeleteReserve setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"oseq", String.class,
				"form", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String oseq = (String)model.get("oseq");
		String form = (String)model.get("form");
		if(form != null) {
			boolean findOseq = orderDao.findOseq(oseq, "1");
			if(findOseq) {
				int resultDelete = orderDao.deleteOrderByOseq(oseq);
				return "redirect:../user/reserveList.do?form=";
			}else {
				int resultDelete = -3;
				model.put("resultDelete", resultDelete);
				return "/user/reserveList.jsp";
			}
		}else{
			boolean findOseq = orderDao.findOseq(oseq, "1");
			if(findOseq) {
				int resultDelete = orderDao.deleteOrderByOseq(oseq);
				model.put("resultDelete", resultDelete);
			}else {
				int resultDelete = -3;
				model.put("resultDelete", resultDelete);
			}
			return "/user/reservePage.jsp";
		}
	}

}
