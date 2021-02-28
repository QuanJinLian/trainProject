package user.action;

import java.util.Map;

import admin.action.AdminUserJoinOut;
import controls.Controller;
import dao.UserDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/UserJoinOut.do")
public class UserJoinOut implements Controller,DataBinding {
	private UserDao userDao;
	public UserJoinOut setUserDao(UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String id = (String)model.get("id");
		model.put("joinOutResult", userDao.joinOut(id));
		return "/user/UserInfo.jsp";
	}

}
