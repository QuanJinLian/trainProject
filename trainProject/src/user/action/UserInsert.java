package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.UserDao;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/memberJoinin.do")
public class UserInsert implements Controller, DataBinding {
	private UserDao userDao ; 
	public UserInsert setUserDao (UserDao userDao) {
		this.userDao = userDao;
		return this;
	}
	

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form", String.class,
				"user", dto.UserVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String) model.get("form");
		UserVO user = (UserVO) model.get("user");
		if( form == null) {
			userDao.insert(user);
			HttpSession session =(HttpSession)model.get("session");
			UserVO memberInfo = userDao.login(user.getId(), user.getPwd());
			session.setAttribute("memberInfo", memberInfo);
			return "/user/index.jsp";
		}else {
			return "/user/UserInsert.jsp";
		}
	}

}
