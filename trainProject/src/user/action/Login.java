package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.UserDao;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/login.do")
public class Login implements Controller , DataBinding {
	private UserDao userDao ; 
	public Login setUserDao (UserDao userDao) {
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
			HttpSession session =(HttpSession)model.get("session");
			UserVO memberInfo = userDao.login(user.getId(), user.getPwd());
			if(memberInfo == null) {
				model.put("noMember", "n");
				return "/user/login.jsp";
			}else {
				session.setAttribute("memberInfo", memberInfo);
				return "redirect:/trainProject/train/user/index.do";
			}
		}else {
			return "/user/login.jsp";
		}
	}
	

}
