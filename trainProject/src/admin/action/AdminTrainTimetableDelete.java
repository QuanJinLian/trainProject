package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainTimetableDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/deleteTrainTimetable.do")
public class AdminTrainTimetableDelete implements Controller,DataBinding {
	
	private TrainTimetableDao trainTimetableDao;
	public AdminTrainTimetableDelete setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}
	
	

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"ttseq", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String ttseq = (String) model.get("ttseq");
		trainTimetableDao.deleteTraintime_detail(ttseq);
		trainTimetableDao.deleteTrainTime(ttseq);
		return "redirect:/trainProject/train/admin/TrainTime.do";
	}

}
