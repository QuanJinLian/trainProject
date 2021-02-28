package user.action;

import java.util.ArrayList;
import java.util.Map;

import admin.action.AdminTrainTimetableView;
import controls.Controller;
import dao.TrainTimetableDao;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/viewTrainTimetable.do")
public class TimetableView implements Controller,DataBinding{
	private TrainTimetableDao trainTimetableDao;
	public TimetableView setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
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
//		ArrayList<TrainTimetableDetailVO> timetables = trainTimetableDao.getTimetables(ttseq);
//		int max = timetables.size();
		int max = timetable.size();
		
		
		TrainTimetableDetailVO tt = new TrainTimetableDetailVO().setTrainNum(timetable.get(0).getTrainNum())
																							.setTrainId(timetable.get(0).getTrainId())
																							.setStartTime(String.valueOf(timetable.get(0).getDate()))
																							.setArriveTime(String.valueOf(timetable.get(max-1).getDate()));
						
		model.put("timetables", timetable);
		model.put("tt", tt);
		return "/user/TrainTimetableView.jsp";
	}

}
