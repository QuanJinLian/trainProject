package admin.action;

import java.util.Map;

import controls.Controller;
import dao.QnADao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/qnaReply.do")
public class AdminQnAReply implements Controller, DataBinding {
	private QnADao qnaDao;
	public AdminQnAReply setQnADao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"reply", String.class,
				"qseq", String.class,
				"id", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String reply = (String)model.get("reply");
		String qseq = (String)model.get("qseq");
		String id = (String)model.get("id");
		int result_update = qnaDao.UpdateReply(qseq, reply, id);
		model.put("qseq", qseq);
		model.put("result_update", result_update);
		return "/admin/adminQ&ADetail.jsp";
	}

}
