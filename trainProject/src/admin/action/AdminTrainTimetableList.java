package admin.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.TrainTimetableDao;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/TrainTime.do")
public class AdminTrainTimetableList implements Controller{
	private TrainTimetableDao trainTimetableDao;
	public AdminTrainTimetableList setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}


	@Override
	public String execute(Map<String, Object> model) throws Exception {
		ArrayList<String> ttseqs = trainTimetableDao.getTtseqs();
		ArrayList<TrainTimetableDetailVO> timetables = new ArrayList<TrainTimetableDetailVO>();
		String trainNum = null;
		for(String ttseq : ttseqs) {
			ArrayList<TrainTimetableDetailVO> tables = trainTimetableDao.getTimetables(ttseq);
			int max = tables.size()-1;
			TrainTimetableDetailVO timetable = new TrainTimetableDetailVO().setTrainNum(tables.get(0).getTrainNum()+" - "+tables.get(max).getTrainNum())
																						   .setStartStationName(tables.get(0).getStartStationName())
																						   .setEndStationName(tables.get(max).getEndStationName())
																						   .setStartTime(tables.get(0).getStartTime())
																						   .setArriveTime(tables.get(max).getArriveTime())
																						   .setTtseq(Integer.parseInt(ttseq));
			timetables.add(timetable);
			trainNum = tables.get(0).getTrainNum();
		}
		model.put("trainNum", trainNum);
		model.put("timetables", timetables);
		return "/admin/adminTrainTimetableList.jsp";
	}

}
