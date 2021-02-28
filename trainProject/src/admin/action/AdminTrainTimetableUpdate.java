//package admin.action;
//
//import java.util.ArrayList;
//import java.util.Map;
//
//import controls.Controller;
//import dao.TrainTimetableDao;
//import dto.TrainTimetableVO;
//import prepare.Component;
//import prepare.DataBinding;
//
//@Component("/train/admin/updateTrainTimetable.do")
//public class AdminTrainTimetableUpdate implements Controller,DataBinding{
//	private TrainTimetableDao trainTimetableDao;
//	public AdminTrainTimetableUpdate setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
//		this.trainTimetableDao = trainTimetableDao;
//		return this;
//	}
//
//	@Override
//	public Object[] getDataBinders() {
//		return new Object[] {
//				"ttseq", String.class,
//				"trainNum", String.class,
//				"startStations", String.class,
//				"startTimes", String.class,
//				"endStations", String.class,
//				"endTimes", String.class,
//				"prices", String.class,
//				"stoptimes", String.class
//		};
//	}
//
//	@Override
//	public String execute(Map<String, Object> model) throws Exception {
//		String ttseq = (String) model.get("ttseq");
//		String trainNum = (String) model.get("trainNum");
//		String startStations = (String) model.get("startStations");
//		String startTimes = (String) model.get("startTimes");
//		String endStations = (String) model.get("endStations");
//		String endTimes = (String) model.get("endTimes");
//		String prices = (String) model.get("prices");
//		String stoptimes = (String) model.get("stoptimes");
//		if(startStations != null) {
//			
//		}else {
//			ArrayList<TrainTimetableVO> timetable = trainTimetableDao.getTimetables(ttseq);
//			TrainTimetableVO table = new TrainTimetableVO().setTrainId(timetable.get(0).getTrainId());
//		}
//		return null;
//	}
//
//}
