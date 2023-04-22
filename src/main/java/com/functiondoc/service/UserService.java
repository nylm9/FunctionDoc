package com.functiondoc.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.functiondoc.dao.UserDAO;
import com.functiondoc.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	UserDAO userdao;

	// 회원가입 처리
	public void userRegister(UserDTO userRegister) {

		int insertResult = userdao.userRegister(userRegister);

		System.out.println(insertResult);

	}

	// 아이디 체크
	public String registerIdCheck(String registerId) {

		String selectResult = userdao.registerIdCheck(registerId);

		System.out.println("selectResult : " + selectResult);

		if (selectResult != null) {
			return "unavailable";
		} else {
			return "available";
		}

	}

	/* 이메일 전송 관련 소스 */
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;

	public void RandomNumber() {
		// 난수 생성 6자리
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}

	public String registerEmail(String email) {
		// 이메일 양식 작성
		RandomNumber();
		String setFrom = "eto3e40@gmail.com";
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다.";
		String content = "저희 홈페이지에 방문해주셔서 감사합니다." + "<br><br>" + "해당 인증번호는 " + authNumber + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	};

	public void mailSend(String setFrom, String toMail, String title, String content) {
		// 이메일 전송
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	};

}
