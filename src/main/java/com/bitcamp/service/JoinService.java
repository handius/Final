package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bitcamp.DAO.MailCertDAO;
import com.bitcamp.DAO.MailUtils;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.JoinMapper;

@Service("joinService")
public class JoinService {

	@Autowired
	JoinMapper joinMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MailCertDAO mailCertDAO;

	public int userIdCheckService(String user_id) {	//중복 ID 체크
		return joinMapper.userIdCheck(user_id);
	}

	public void userRegisterService(String user_id, String user_password, String user_name, String user_email, String user_address) throws Exception{
		
		System.out.println(user_id+ user_password+ user_name+user_email+user_address);
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);
		dto.setUser_password(user_password);	//암호화 해야됨
		dto.setUser_name(user_name);
		dto.setUser_email(user_email);
		dto.setUser_address(user_address);
		dto.setUser_certstatus(0);
		
		String authKey = mailCertDAO.createKey();
		dto.setUser_certkey(authKey);
		
		joinMapper.userRegister(dto);
		
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("Handius 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/controller/join/joinConfirm?user_id=").append(dto.getUser_id()).append("&user_email=")
				.append(dto.getUser_email()).append("&user_certkey=").append(authKey).append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("handius00@gmail.com", "핸디어스");
		sendMail.setTo(dto.getUser_email());
		sendMail.send();
	}

	public void updateCertStatusService(String user_id, String user_email, String user_certkey) {
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);
		dto.setUser_email(user_email);
		
		System.out.println("값이 ");
		/*System.out.println(joinMapper.compareCertKey(dto));
		if(joinMapper.compareCertKey(dto)==1) {
			joinMapper.updateCertStatus(user_id);			
		}*/
	}
	

}
