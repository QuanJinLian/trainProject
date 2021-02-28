package user.action;

import java.util.Calendar;
import java.util.Map;

import controls.Controller;
import prepare.Component;

@Component("/train/user/index.do")
public class Index implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH)+1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int lastDay = now.getActualMaximum(Calendar.DATE);
		
		model.put("year", year);
		model.put("month", month);
		model.put("day", day);
		model.put("hour", hour);
		model.put("lastDay", lastDay);
		return "/user/index.jsp";
	}
}
