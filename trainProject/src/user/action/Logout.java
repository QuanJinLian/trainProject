package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.UserDao;
import prepare.Component;

@Component("/train/user/logout.do")
public class Logout implements Controller {
	private UserDao userDao;
	public Logout setUserDao (UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("session") !=null){
			HttpSession session = (HttpSession) model.get("session");
			session.invalidate();
		}
		return "redirect:/trainProject/train/user/index.do";
	}

}
