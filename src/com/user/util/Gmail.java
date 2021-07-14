package com.user.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	//계정 정보를 넣는다
	//외부 라이브러리 2개를 사용
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("?", "?");
	}
	
}