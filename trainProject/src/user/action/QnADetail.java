package user.action;

import java.util.Map;

import controls.Controller;
import dao.QnADao;
import dto.QnaTrain;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/qnaDetail.do")
public class QnADetail implements Controller,DataBinding {
	private QnADao qnADao;
	public QnADetail setQnADao (QnADao qnADao) {
		this.qnADao= qnADao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"qseq", String.class,
				"update", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String qseq = (String) model.get("qseq");
		String content = (String) model.get("update");
		if(content == null) {
			QnaTrain qna = qnADao.viewQusetionDetail(qseq);
			model.put("qna", qna);
			return "/user/QnADetail.jsp";
		}else {
			int resultUp = qnADao.updateContent(content, qseq);
			QnaTrain qna = qnADao.viewQusetionDetail(qseq);
			model.put("qna", qna);
			model.put("resultUp", resultUp);
			return "/user/QnADetail.jsp";
		}
	}

}
