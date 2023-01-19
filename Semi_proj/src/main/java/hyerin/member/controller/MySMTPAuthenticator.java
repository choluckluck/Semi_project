package hyerin.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MySMTPAuthenticator extends Authenticator{
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("zpzpr625","ptvzlvrvqafyochj");
		//ptvzlvrvqafyochj 는 Google에 로그인하기 위한 앱비밀번호
	}
}
