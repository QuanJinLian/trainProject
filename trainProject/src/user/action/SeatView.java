package user.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dao.TrainSeatsDao;
import dto.OrderVO;
import dto.TrainSeatsVO;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/seatView.do")
public class SeatView  implements Controller, DataBinding{
	private OrderDao orderDao;
	public SeatView setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	private TrainSeatsDao trainSeatDao;
	public SeatView setTrainSeatsDao(TrainSeatsDao trainSeatDao) {
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
				"carriage", String.class,
				"trainId",  String.class,
				"tdseq1", String.class,
				"tdseq2", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		ArrayList<TrainSeatsVO> carriages;
		ArrayList<TrainSeatsVO> allSeats ;
		ArrayList<OrderVO> saleSeats;
		String carriageNum ;
		Integer adult = (Integer)model.get("adult");
		Integer disabled = (Integer)model.get("disabled");
		Integer children = (Integer)model.get("children");
		Integer old = (Integer)model.get("old");
		String trainId = (String) model.get("trainId");
		String tdseq1 = (String) model.get("tdseq1");
		String tdseq2 = (String) model.get("tdseq2");
		String carriage = (String) model.get("carriage");

		carriages = trainSeatDao.getCarriages(trainId);
		if(carriage == null) {
			carriageNum = carriages.get(0).getCarriage();
		}else {
			carriageNum = carriage;
		}
		allSeats = trainSeatDao.getAllSeats(trainId, carriageNum);
		saleSeats = orderDao.getOrderSeats(tdseq1, tdseq2, carriageNum);
		
//		System.out.println(saleSeats.size());
//		System.out.println(saleSeats.get(0).getSeatId());


		model.put("adult", adult);
		model.put("disabled", disabled);
		model.put("children", children);
		model.put("old", old);
		model.put("trainId", trainId);
		model.put("tdseq1", tdseq1);
		model.put("tdseq2", tdseq2);
		model.put("carriageNum", carriageNum);
		model.put("carriages", carriages);
		model.put("allSeats", allSeats);
		model.put("saleSeats", saleSeats);
		return "/user/SelectSeats.jsp";
	}

}
