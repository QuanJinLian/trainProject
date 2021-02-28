package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.QnADao;
import dto.QnaTrain;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/writeQ&A.do")
public class WriteQnA implements Controller,DataBinding {
	private QnADao qnADao;
	public WriteQnA setQnADao (QnADao qnADao) {
		this.qnADao= qnADao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form", String.class,
				"content", String.class,
				"subject", String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String) model.get("form");
		String content = (String) model.get("content");
		String subject = (String) model.get("subject");
		HttpSession session =  (HttpSession) model.get("session");
		UserVO memberInfo = (UserVO) session.getAttribute("memberInfo");	
		
		if(memberInfo == null) {
			return "/user/login.jsp";
		}else {
			String id = memberInfo.getId();
			if(form == null) {
				int result_upQ = qnADao.addQuestion(id, content, subject);
				model.put("result_upQ", result_upQ);
				return "/user/WriteQ&A.jsp";
			}else {
				return "/user/WriteQ&A.jsp";
			}
		}
	}

}
