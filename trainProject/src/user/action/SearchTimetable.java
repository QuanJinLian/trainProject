package user.action;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import admin.action.AdminTrainTimetableList;
import controls.Controller;
import dao.OrderDao;
import dao.TrainSeatsDao;
import dao.TrainTimetableDao;
import dto.TrainTimetableDetailVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/searchTimetable.do")
public class SearchTimetable implements Controller,DataBinding {
	private TrainTimetableDao trainTimetableDao;
	public SearchTimetable setTrainTimetableDao(TrainTimetableDao trainTimetableDao) {
		this.trainTimetableDao = trainTimetableDao;
		return this;
	}
	
	private TrainSeatsDao trainSeatsDao;
	public SearchTimetable setTrainSeatsDao(TrainSeatsDao trainSeatsDao) {
		this.trainSeatsDao = trainSeatsDao;
		return this;
	}
	private OrderDao orderDao;
	public SearchTimetable setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}

	
	

	@Override
	public Object[] getDataBinders() {
//		adult=1&disabled=0&children=0&old=0&year=2020&month=11&day=19&hour=21&directyn=y
		return new Object[] {
				"adult", Integer.class,
				"disabled", Integer.class,
				"children", Integer.class,
				"old", Integer.class,
				"year", Integer.class,
				"month", Integer.class,
				"day", Integer.class,
				"hour", Integer.class,
				"startStation", String.class,
				"endStation", String.class,
				"directyn", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int adult = (int)model.get("adult");
		int disabled = (int)model.get("disabled");
		int children = (int)model.get("children");
		int old = (int)model.get("old");
		int year = (int)model.get("year");
		int month = (int)model.get("month");
		int day = (int)model.get("day");
		int hour = (int)model.get("hour");
		String startStation = (String) model.get("startStation");
		String endStation = (String) model.get("endStation");
		String directyn = (String)model.get("directyn");
		Calendar now = Calendar.getInstance();
		int date_now = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DAY_OF_MONTH);
		int date_checked = year*10000 + month*100 + day;

		Time time = new Time(hour, 0, 0);
		
		if(date_now == date_checked) { // 검색한 날짜가 현재 날짜랑 같을때 시간을 검사 해주고  무조건 현재 이후인 시간으로 검색
			if(hour <= now.get(Calendar.HOUR_OF_DAY)) {
				time.setHours(now.get(Calendar.HOUR_OF_DAY));
				time.setMinutes(now.get(Calendar.MINUTE));
				time.setSeconds(now.get(Calendar.SECOND));
				hour = now.get(Calendar.HOUR_OF_DAY);
			}else {
				time.setHours(hour);
				time.setMinutes(0);
				time.setSeconds(0);
			}
		}

		
		Date date = new Date((year-1900), (month-1), day);
		
		ArrayList<TrainTimetableDetailVO> timetables = new ArrayList<TrainTimetableDetailVO>();

		ArrayList<Integer> seatCnts = new ArrayList<Integer>();
		
		
		ArrayList<Integer> tdseqs = trainTimetableDao.getTdseqs(date, startStation, endStation, time);

		
		for(int i = 0 ; i< tdseqs.size(); i+=2) {
			ArrayList<TrainTimetableDetailVO> tables = trainTimetableDao.getTimetables(tdseqs.get(i), tdseqs.get(i+1));
			String trainId = tables.get(0).getTrainId();
			int price = 0;
			int max = tables.size();
			for(TrainTimetableDetailVO table : tables) {  //가격을 계산한다 
				price += table.getPrice();
			}
			TrainTimetableDetailVO ttd = new TrainTimetableDetailVO().setTrainNum(tables.get(0).getTrainNum())
																	.setTtseq(tables.get(0).getTtseq())
																	.setTdseq1(tdseqs.get(i))
																	.setTdseq2(tdseqs.get(i+1))
																	.setTrainId(tables.get(0).getTrainId())
																	.setStartStationName(tables.get(0).getStartStationName())
																	.setEndStationName(tables.get(max-1).getEndStationName())
																	.setStartTime(tables.get(0).getStartTime())
																	.setArriveTime(tables.get(max-1).getArriveTime())
																	.setPrice(price);
			timetables.add(ttd);
			int seatCnt = trainSeatsDao.getSeatsCnt(trainId)- orderDao.getOrderSeatsCnt(tdseqs.get(i), tdseqs.get(i+1));
			seatCnts.add(seatCnt);
		}
			now.set(year, month-1, day);
			int lastDay = now.getActualMaximum(Calendar.DATE);
			model.put("timetables", timetables);
			model.put("seatCnts", seatCnts);
			model.put("startStation", startStation);
			model.put("endStation", endStation);
			model.put("adult",adult);
			model.put("disabled",disabled);
			model.put("children",children);
			model.put("old",old);
			model.put("year", year);
			model.put("month", month);
			model.put("day", day);
			model.put("hour", hour);
			model.put("lastDay", lastDay);
			return "/user/index.jsp";
	}

}
