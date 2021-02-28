package admin.action;

import java.util.Map;

import controls.Controller;
import dao.OrderDao;
import dao.QnADao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/QnADelete.do")
public class AdminQnADelete implements Controller, DataBinding {
	private QnADao qnaDao;
	public AdminQnADelete setQnADao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"qseqs", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String[]  qseqs = ((String)model.get("qseqs")).split(",");
		for(String qseq : qseqs) {
			qnaDao.DeleteQnA(qseq);
		}
		return "redirect:/trainProject/train/admin/qna.do";
	}

}
