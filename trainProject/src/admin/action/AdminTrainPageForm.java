package admin.action;

import java.util.Map;

import controls.Controller;
import prepare.Component;

@Component("/train/admin/trainPageForm.do")
public class AdminTrainPageForm implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "/admin/adminTrainPage.jsp";
	}
}
