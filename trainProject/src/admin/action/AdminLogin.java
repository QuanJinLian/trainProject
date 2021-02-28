package admin.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.AdminDao;
import dto.adminVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/login.do")
public class AdminLogin implements Controller,DataBinding {
	private AdminDao adminDao;
	public AdminLogin setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form", String.class,
				"loginInfo", dto.adminVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String) model.get("form");
		adminVO admin = (adminVO)model.get("loginInfo");
		if( form == null) {
			adminVO wokerInfo = adminDao.login(admin.getId(), admin.getPwd());
			if(wokerInfo != null) {
				HttpSession session = (HttpSession)model.get("session");
				session.setAttribute("wokerInfo", wokerInfo);
				return "redirect:/trainProject/admin/adminPage.jsp";
			}else {
				model.put("noMember", "n");
				return "/admin/adminLogin.jsp";
			}
		}else {
			return "/admin/adminLogin.jsp";
		}
	}

}
