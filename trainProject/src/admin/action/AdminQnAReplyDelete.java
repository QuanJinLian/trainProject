package admin.action;

import java.util.Map;

import controls.Controller;
import dao.QnADao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/qnaReplyDelete.do")
public class AdminQnAReplyDelete implements Controller,DataBinding{
	private QnADao qnaDao;
	public AdminQnAReplyDelete setQnADao(QnADao qnaDao) {
		this.qnaDao = qnaDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"qseq", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String qseq = (String)model.get("qseq");
		int result_delete = qnaDao.deleteReply(qseq);
		model.put("qseq", qseq);
		model.put("result_delete", result_delete);
		return "/admin/adminQ&ADetail.jsp";
	}

}
