package admin.action;

import java.util.Map;

import controls.Controller;
import dao.UserDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/UserJoinOut.do")
public class AdminUserJoinOut implements Controller, DataBinding {
	private UserDao userDao;
	public AdminUserJoinOut setUserDao(UserDao userDao) {
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
		model.put("member", userDao.joinOut(id));
		return "redirect:../admin/user.do";
	}

}
