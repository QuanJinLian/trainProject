package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.BankMemberDao;
import dao.OrderDao;
import dao.UserDao;
import dto.BankMemberVO;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/pay.do")
public class Pay implements Controller,DataBinding {
	private UserDao userDao;
	public Pay setUserDao (UserDao userDao) {
		this.userDao = userDao;
		return this;
	}
	
	private OrderDao orderDao;
	public Pay setOrderDao (OrderDao orderDao) {
		this.orderDao = orderDao;
		return this;
	}
	
	private BankMemberDao bankMemberDao;
	public Pay setBankMemberDao (BankMemberDao bankMemberDao) {
		this.bankMemberDao = bankMemberDao;
		return this;
	}
	 

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form",  String.class,
				"oseq", String.class,
				"point", String.class,
				"total", String.class,
				"id", String.class,
				"bank", dto.BankMemberVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String)model.get("form");
		String oseq = (String)model.get("oseq");
		String point = (String)model.get("point");
		String total = (String)model.get("total");
		String id = (String)model.get("id");
		BankMemberVO bank = (BankMemberVO) model.get("bank");
		HttpSession session =  (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("memberInfo");	
		int result = -1;
		int pointMinus = 0;
		
		if(form != null) { 
			int havingP = userDao.getPoint(id);
			model.put("havingP", havingP);
			model.put("oseq", oseq);
			model.put("point", point);
			model.put("total", total);
			return "/user/payForm.jsp";
		}else {
			String accountNum =bank.getAccountNum();
			String getpoint = bank.getPoint();
			String name = bank.getName();
			String pw = bank.getPw();
			String id1 = user.getId();
			String oseq1 = bank.getOseq();
			int price = bank.getPrice();
			int pointPlus = bank.getPlusPoint();
			if(!getpoint.equals("")){
				pointMinus = Integer.parseInt(getpoint);
			}
			int point_after = userDao.getPoint(id1)-pointMinus+pointPlus;  // 사용한  포인트를 -해주고 적립할 포인트를 +해준다
			boolean findOseq = orderDao.findOseq(oseq1,"%");
//			System.out.println(userDao.getPoint(user.getId()));
//			System.out.println(pointMinus);
//			System.out.println(pointPlus);
			
			if(findOseq) {   // 시간 초과 안됐을때
				boolean oseqTicketyn = orderDao.findOseq(oseq, "1");
				if(oseqTicketyn) {
					if(!accountNum.equals("")&&!pw.equals("")&&!name.equals("")) {
						String balance = bankMemberDao.getBalance(name, pw, accountNum);
						if(balance != null && !balance.equals("X")) {
							int balanceInt = Integer.parseInt(balance);
							if(balanceInt >= (price-pointMinus)) { // 인증 성공 및 잔고 update
								balanceInt = balanceInt -(price-pointMinus);
								result = bankMemberDao.setBalance(balanceInt, accountNum);   //은행잔고 셋팅
								userDao.setPoint(id1, point_after);   // 사용자의 포인트를 셋팅				
								orderDao.setResult(oseq1);   // order테이블 tickedyn 2로 바꿔서 발권완료 상태로 만들어줌
							}else {
								result = -1;  //  비번, 계좌번호, 이름 인증 성공 BUT 잔고 부족
							}
						}else {
							result = -2;   // 입력한 비번 or 계좌번호 or 이름 인증 실패
						}
					}else {
						System.out.println("point_after" +point_after);
						result = userDao.setPoint(id1, point_after);   // 사용자의 포인트를 셋팅
						result = orderDao.setResult(oseq1);   // order테이블 tickedyn 2로 바꿔서 발권완료 상태로 만들어줌			
					}
				}else {
					result = -4; //이미 결제된 예약번호임
				}
			}else {
				result = -3;  //시간이 초과되어 결제 실패하였습니다
			}
			model.put("result", result);
			return "/user/payForm.jsp";
		}
		
	}
	

}
