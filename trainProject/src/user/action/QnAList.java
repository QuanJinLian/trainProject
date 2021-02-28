package user.action;

import java.util.ArrayList;
import java.util.Map;

import controls.Controller;
import dao.QnADao;
import dto.QnaTrain;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/qnaList.do")
public class QnAList implements Controller, DataBinding {
	private QnADao qnADao;
	public QnAList setQnADao (QnADao qnADao) {
		this.qnADao= qnADao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"pageNo", String.class,
				"viewCnt_onePage", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int pageNo = Integer.parseInt((String) model.get("pageNo"));
		int viewCnt_onePage = Integer.parseInt((String) model.get("viewCnt_onePage")) ;

		int pageCnt = qnADao.pageCnt(viewCnt_onePage);
		ArrayList<QnaTrain> qnas = qnADao.qnaList(pageNo);
		
		model.put("pageCnt", pageCnt);
		model.put("viewCnt_onePage", viewCnt_onePage);
		model.put("pageNo", pageNo);
		model.put("qnas", qnas);

		return "/user/Q&A.jsp";
	}

}
