package util;

import mail.GoogleMail;

public class Mail {
	public static void main(String args[]) {
		try {
			GoogleMail.Send("quanjl0710", "bbexhbhbkaopspif", "micka772@naver.com", "인증번호 인증", "확인");
		}catch(Exception e) {};
	}
}
