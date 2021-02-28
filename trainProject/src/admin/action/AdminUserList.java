package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainTimetableDao;
import dao.UserDao;
import prepare.Component;

@Component("/train/admin/user.do")
public class AdminUserList implements Controller {
	private UserDao userDao;
	public AdminUserList setUserDao(UserDao userDao) {
		this.userDao = userDao;
		return this;
	}
	

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		model.put("members", userDao.getUserList());
		return "/admin/adminUserList.jsp";
	}

}
