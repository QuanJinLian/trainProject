package admin.action;

import java.util.Map;

import controls.Controller;
import dao.QnADao;
import dto.QnaTrain;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/qnaDetail.do")
public class AdminQnADetail implements Controller, DataBinding{
	private QnADao qnaDao;
	public AdminQnADetail setQnADao(QnADao qnaDao) {
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
		QnaTrain qna = qnaDao.viewQusetionDetail(qseq);
		model.put("qna", qna);
		return "/admin/adminQ&ADetail.jsp";
	}

}
