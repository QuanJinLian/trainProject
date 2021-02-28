package admin.action;

import java.util.Map;

import controls.Controller;
import dao.QnADao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/qna.do")
public class AdminQnAList implements Controller{
	private QnADao qnaDao;
	public AdminQnAList setQnADao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		model.put("qnas", qnaDao.qnaList());
		return "/admin/adminQnAList.jsp";
	}

}
