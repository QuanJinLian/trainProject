package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainDao;
import dao.TrainSeatsDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/insertSeats.do")
public class AdminTrainSeatsInsert implements Controller, DataBinding{

	private TrainSeatsDao trainSeatsDao;
	public AdminTrainSeatsInsert setTrainSeatsDao(TrainSeatsDao trainSeatsDao) {
		this.trainSeatsDao = trainSeatsDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id", String.class,
				"carriages",  String.class,
				"seatsCnts",  String.class,
				"rows",  String.class,
				"types",  String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String id = (String) model.get("id");
		if(model .get("carriages") != null) {
			String[] carriages= ((String) model .get("carriages")).split(",");
			String[] seatsCnts= ((String) model .get("seatsCnts")).split(",");
			String[] rows= ((String) model .get("rows")).split(",");
			String[] types=( (String) model .get("types")).split(",");
			for(int c = 0; c<carriages.length; c++) {

					for(int i = 1;i<=Integer.parseInt(seatsCnts[c]);i++){
						for(int r = 1; r <=Integer.parseInt(rows[c]) ; r ++ ) {
						  String seatLocation =r +String.valueOf(Character.toUpperCase( (char)(96+i)));
						  String carriage = carriages[c];
						  String type =  types[c];
						  trainSeatsDao.insert(id, carriage, type, seatLocation);
						}
					}
				
			}
			return "redirect:../admin/TrainList.do";
		}else {
			model.put("id", id);
			return "/admin/adminTrainSeatInsert.jsp";
		}
	}

}
