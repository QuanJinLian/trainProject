package user.action;

import java.util.Map;

import controls.Controller;
import dao.ZipSearchDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/zipcode.do")
public class ZipcodeSearch implements Controller, DataBinding {
	private ZipSearchDao zipSearchDao;
	public ZipcodeSearch setZipSearchDao(ZipSearchDao zipSearchDao) {
		this.zipSearchDao = zipSearchDao;
		return this;
	}
	

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"add", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String add = (String) model.get("add");
		model.put("adds", zipSearchDao.getAddressList(add));
		return "/user/zipCodeSearch.jsp";
	}

}
