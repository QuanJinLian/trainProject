package admin.action;

import java.util.Map;

import controls.Controller;
import prepare.Component;

@Component("/train/admin/loginForm.do")
public class AdminLoginForm implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "redirect:/trainProject/admin/adminLogin.jsp";
	}

}
