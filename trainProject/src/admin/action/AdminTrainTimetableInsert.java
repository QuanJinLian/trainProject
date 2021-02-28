package admin.action;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;

import controls.Controller;
import dao.TrainTimetableDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/insertTimetable.do")
public class AdminTrainTimetableInsert implements Controller, DataBinding{
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	private TrainTimetableDao trainTimetableDao;
	public AdminTrainTimetableInsert setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id", String.class,
				"name", String.class,
				"startDate", String.class,
				"endDate", String.class,
				"startStations", String.class,
				"startTimes", String.class,
				"endStations", String.class,
				"endTimes", String.class,
				"prices", String.class,
				"stoptimes", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String num ;
		String id = (String)model.get("id");
		String name = (String)model.get("name");
		String startDate =(String)model.get("startDate");
		String endDate = (String)model.get("endDate");
		
		Date sdate = Date.valueOf(startDate);
		Date edate = Date.valueOf(endDate);

		Calendar calendar = new GregorianCalendar(); 
		
		String startStations [] = ((String)model.get("startStations")).split(",");
		String startTimes [] = ((String)model.get("startTimes")).split(",");
		String endStations [] = ((String)model.get("endStations")).split(",");
		String endTimes [] = ((String)model.get("endTimes")).split(",");
		String prices [] = ((String)model.get("prices")).split(",");
		String stoptimes [] = ((String)model.get("stoptimes")).split(",");
		
		
		int result = trainTimetableDao.insertTimetable(name);
		if(result != -1 ) {
			String ttseq = trainTimetableDao.getLastTtseq(name);
			
			for(int i = 0 ; i < getDayDiffer(sdate, edate)+1; i++) {
				calendar.setTime(sdate); 
				calendar.add(calendar.DATE,i);
				num = df.format(calendar.getTime()) + name;
				
				for(int j = 0 ; j < startStations.length ; j++) {
					Time startTime = Time.valueOf(startTimes[j]);
					Time endTime = Time.valueOf(endTimes[j]);
					trainTimetableDao.insertTimetableDetail(ttseq, num, Date.valueOf(df.format(calendar.getTime())), id, j, startStations[j], endStations[j], startTime, endTime, stoptimes[j], prices[j]);
				}
			}
		}
		return "redirect:/trainProject/train/admin/TrainTime.do";
	}
	
	public int getDayDiffer(Date startDate, Date endDate) throws ParseException {
		// 시작일부터 종료일까지 날짜 카운트
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        long startDateTime = dateFormat.parse(dateFormat.format(startDate)).getTime();
        long endDateTime = dateFormat.parse(dateFormat.format(endDate)).getTime();
        return (int) ((endDateTime - startDateTime) / (1000 * 3600 * 24));		
	}
        
		

}
