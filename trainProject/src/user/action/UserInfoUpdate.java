package user.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controls.Controller;
import dao.UserDao;
import dto.UserVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/user/personalProfile.do")
public class UserInfoUpdate implements Controller,DataBinding {
	private UserDao userDao ; 
	public UserInfoUpdate setUserDao (UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"form", String.class,
				"user", dto.UserVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String form = (String) model.get("form");
		UserVO user = (UserVO) model.get("user");
		HttpSession session =  (HttpSession) model.get("session");
		UserVO memberInfo = (UserVO) session.getAttribute("memberInfo");	
		String id = null ;
		UserVO userinfo = new UserVO() ;
	
		
		if(memberInfo == null) {
			return "/user/login.jsp";
		}else {
			if( form == null) {
				String pwd = user.getPwd();
				String pw1 = user.getPw1();
				String pw2 = user.getPw2();
				String name = user.getName();
				String phone = user.getPhone();
				String zip_num = user.getZip_num();
				String address = user.getAddress();
				String addressDetail = user.getAddressDetail();
				String email = user.getEmail();
				id = user.getId();

				
				if(!pw1.equals("") && !pwd.equals("") && pw1.equals(pw2)) {
					userinfo.setPwd(pw1);  
				}else if(pw1.equals("") && pw2.equals("")) {
					userinfo.setPwd(pwd);
				}
				if(!addressDetail.equals("")) {
					userinfo.setAddress(address +"  "+ addressDetail);
				}else {
					userinfo.setAddress(address);
				}

				userinfo.setId(id);
				userinfo.setName(name);
				userinfo.setPhone(phone);
				userinfo.setEmail(email);
				userinfo.setZip_num(zip_num);
				userinfo.setUseyn("y");
				int result_update = userDao.update(userinfo);
				userinfo = userDao.getUser(id);
				session.setAttribute("memberInfo", userinfo);	
				model.put("userinfo", userinfo);
				model.put("result_update",result_update);
				return "/user/UserInfo.jsp";
			}else {
				id = memberInfo.getId();
				userinfo = userDao.getUser(id);
				model.put("userinfo", userinfo);
				return "/user/UserInfo.jsp";
			}
		}
	}

}
