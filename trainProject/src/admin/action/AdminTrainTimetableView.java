package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.TrainTimetableDao;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/viewTrainTimetable.do")
public class AdminTrainTimetableView implements Controller,DataBinding {
	private TrainTimetableDao trainTimetableDao;
	public AdminTrainTimetableView setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}


	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"trainNum", String.class,
				"ttseq", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String trainNum = (String) model.get("trainNum");
		String ttseq = (String) model.get("ttseq");
		ArrayList<TrainTimetableDetailVO> timetable = trainTimetableDao.getTimetablesBytrainNum(trainNum);
		ArrayList<TrainTimetableDetailVO> timetables = trainTimetableDao.getTimetables(ttseq);
		int max = timetables.size();
		
		
		TrainTimetableDetailVO tt = new TrainTimetableDetailVO().setTrainId(timetables.get(0).getTrainId())
																			.setStartTime(String.valueOf(timetables.get(0).getDate()))
																			.setArriveTime(String.valueOf(timetables.get(max-1).getDate()));
		
		model.put("timetables", timetable);
		model.put("tt", tt);
		return "/admin/adminTrainTimetableView.jsp";
	}

}
