package admin.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import prepare.Component;

@Component("/train/admin/logout.do")
public class AdminLogout implements Controller{
	

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("session") !=null){
			HttpSession session = (HttpSession) model.get("session");
			session.invalidate();
		}
		return "redirect:/trainProject/train/admin/loginForm.do";
	}

}
