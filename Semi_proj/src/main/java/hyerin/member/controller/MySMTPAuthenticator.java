package hyerin.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MySMTPAuthenticator extends Authenticator{
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("testhyerin25","xndotuxgpenikyhd");
		//xndotuxgpenikyhd 는 Google에 로그인하기 위한 앱비밀번호
	}
}
