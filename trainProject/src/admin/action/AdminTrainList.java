package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.TrainDao;
import dao.TrainSeatsDao;
import dto.TrainVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/TrainList.do")
public class AdminTrainList implements Controller,DataBinding {
	
	private TrainDao trainDao;
	public AdminTrainList setTrainDao(TrainDao trainDao) {
		this.trainDao = trainDao;
		return this;
	}
	private TrainSeatsDao trainSeatsDao;
	public AdminTrainList setTrainSeatsDao(TrainSeatsDao trainSeatsDao) {
		this.trainSeatsDao = trainSeatsDao;
		return this;
	}


	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"to", String.class
		};
	}


	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String to = (String) model.get("to");
		if(to != null) {
			ArrayList<TrainVO> trains = trainDao.getList();
			model.put("trains", trains);
			return "/admin/adminTrainTimetalbel.jsp";
		}else {
			ArrayList<TrainVO> trains = trainDao.getList();
			ArrayList<Integer> seatsCnts = new ArrayList<Integer>();
			for(int i = 0; i< trains.size(); i++) {
				int seatCnt = trainSeatsDao.getSeatsCnt(String.valueOf(trains.get(i).getId()));
				seatsCnts.add(seatCnt);
			}

			model.put("seatsCnts", seatsCnts);
			model.put("trains", trains);
			return "/admin/adminTrainList.jsp";
		}
	}

 }
