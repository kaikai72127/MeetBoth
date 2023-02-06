package springTeam5._01_member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._01_member.model.sendVerificationEmail;

@Controller
public class MailVerification {

	@Autowired
	private JavaMailSender mailSender;
	
	@PostMapping(path = "/mailVerify.controller")
	public void mailverify(@RequestParam("value") String email) {
		
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		
		// 建立一封簡單的郵件
		  SimpleMailMessage message = new SimpleMailMessage();
		  message.setFrom("noreply@example.com");
		  message.setTo(email);
		  message.setSubject("Email verification");
		  message.setText("Please click the following link to verify your email: http://example.com/verify?token=" + jwtToken);

		  // 發送郵件
		  mailSender.send(message);
		}
	
	@GetMapping(path = "/mail")
	public String mail() {
		return "_01_member/email";
	}
	
	
}
