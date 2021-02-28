package admin.action;

import java.sql.Connection;
import java.util.Map;

import javax.sql.DataSource;

import controls.Controller;
import dao.UserDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/UserDelete.do")
public class AdminUserDelete implements Controller, DataBinding{
	private UserDao userDao;
	public AdminUserDelete setUserDao(UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"ids", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String[]  ids = ((String)model.get("ids")).split(",");
		for(String id : ids) {
			userDao.deleteMember(id);
		}
		return "redirect:../train/admin/user.do";
	}

}
