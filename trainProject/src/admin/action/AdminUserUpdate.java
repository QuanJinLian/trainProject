package admin.action;

import java.util.Map;

import controls.Controller;
import dao.UserDao;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/UserUpdate.do")
public class AdminUserUpdate implements Controller, DataBinding{
	private UserDao userDao;
	public AdminUserUpdate setUserDao(UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id", String.class,
				"user", dto.UserVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		UserVO user = (UserVO)model.get("user");
		if(user.getName() == null) {
			String id = (String)model.get("id");
			model.put("member", userDao.getUser(id));
			return "/admin/adminMemberInfo.jsp";
		}else{
			userDao.update(user);
			return "redirect:../admin/user.do";
		}
	}

}
