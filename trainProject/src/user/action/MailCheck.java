package user.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.BankMemberDao;
import dao.UserDao;
import dto.BankMemberVO;
import dto.OrderVO;
import dto.UserVO;
import mail.GoogleMail;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/mailCheck.do")
public class MailCheck implements Controller, DataBinding{
	String code_random;
	
	
	private BankMemberDao bankMemberDao;
	public MailCheck setUserDao(BankMemberDao bankMemberDao) {
		this.bankMemberDao = bankMemberDao;
		return this ;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"email", String.class,
				"emailR", String.class,
//				"name", String.class,
				"checkNum",String.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String email = (String) model.get("email");
//		String name = (String) model.get("name");
		int result = -10;

//		HttpSession session =  (HttpSession) model.get("session");
//		UserVO user = (UserVO) session.getAttribute("memberInfo");	
		
//		ArrayList<OrderVO> lists = new ArrayList<OrderVO>();
		
//		if(user == null ) {
//			return "/user/login.jsp";
//		}else {
			if(email != null ) {
//				String name = user.getName();
//				String checkName = bankMemberDao.check(email, name);
//				if(checkName != null ){
					randomCode();
//					System.out.println("발송 : " +code_random);
					thread().start();
					String msg = "인증번호는: " +code_random; 
					try {
						GoogleMail.Send("quanjl0710", "bbexhbhbkaopspif", email, "인증번호", msg);
					}catch(Exception e) {};
					result = -13;
					model.put("email", email);
					model.put("resultMail", result);
//					System.out.println("result : " +result);
					return "/user/certify.jsp";
//				}else {
//					result = -11;
//					model.put("resultMail", result);
//					return "/user/certify.jsp";
//				}
			}else {
				String checkNum = (String) model.get("checkNum");
				String emailR = (String) model.get("emailR");
//				System.out.println("checkNum" +checkNum);
//				System.out.println("code_random"+ code_random);
				if(code_random == null) {
					result = -12;
					model.put("resultMail", result);
					return "/user/certify.jsp";
				}else {
					if(code_random.equals(checkNum)) {
						result = 0;
						model.put("email", emailR);
						model.put("resultMail", result);
						return "/user/certify.jsp";
					}else {
						result = -12;
						model.put("resultMail", result);
						return "/user/certify.jsp";
					}
				}
			}
//		}
	}
	
	public String randomCode() {
		int i1 = (int) (java.lang.Math.random() * 10);
		int i2 = (int) (java.lang.Math.random() * 10);
		int i3 = (int) (java.lang.Math.random() * 10);
		int i4 = (int) (java.lang.Math.random() * 10);
		code_random=String.valueOf(i1)+""+ String.valueOf(i2)+"" 
									+ String.valueOf(i3)+""+String.valueOf(i4);
		
		return code_random;
	}
	
	public Thread thread() {
		Thread thread = new Thread() {
			int minute = 30;
			public void run() {
				while(true) {
					minute--;
					if(minute ==0) {
						code_random= null;
						minute =30;
						break;
					}
					try {
						Thread.sleep(1000);
					}catch (Exception e) {}
				}
			}
		};
		return thread;
	}

}
