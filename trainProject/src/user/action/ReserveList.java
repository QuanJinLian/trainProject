package user.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.OrderDao;
import dto.OrderVO;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/reserveList.do")
public class ReserveList implements Controller , DataBinding{
	private OrderDao orderDao;
	public ReserveList setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form",  String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String)model.get("form");

		HttpSession session =  (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("memberInfo");	
		
		ArrayList<OrderVO> lists = new ArrayList<OrderVO>();
		
		if(user == null ) {
			return "/user/login.jsp";
		}else {
			if(form != null) {
				String id = user.getId();
				ArrayList<String> oseqs = orderDao.getOseqs(id, "1");
				for(String oseq : oseqs) {
					ArrayList<OrderVO> orders = orderDao.getOrderList(oseq);
					ArrayList<String> seatIds  = orderDao.getSeatIds(oseq);
					int price = 0;
					int point =0;
					int max = orders.size()-1;
					Timestamp date = orders.get(0).getIndate();
//					System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS").format(date.getTime()));
					date.setTime(date.getTime() + 5*60*1000);  // 예약시간 + 5분 ( x시x분까지 예약하시오)
					for(OrderVO order : orders) {
						price +=order.getPrice3();
						if(order.getCusType().equals("어른")) {
							point += (int)order.getPrice1()*0.1;
						}
					}
					OrderVO order = new OrderVO().setDate(orders.get(0).getDate())
																	.setTrainName(orders.get(0).getTrainName())
																	.setStartStation(orders.get(0).getStartStation())
																	.setStartTime(orders.get(0).getStartTime())
																	.setEndStation(orders.get(max).getEndStation())
																	.setArriveTime(orders.get(max).getArriveTime())
																	.setTrainType(orders.get(0).getTrainType())
																	.setOseq(oseq)
																	.setIndate(date)
																	.setPrice1(seatIds.size()) // 예약 매수
																	.setPrice2(point)
																	.setPrice3(price);
					lists.add(order);
				}
				model.put("lists",lists);
				return "/user/reserveList.jsp";
			}else {
				return "";
			}
		}
	}

}
