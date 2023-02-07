package springTeam5._01_member.controller;

import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
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
		  message.setFrom("meetboth@gmail.com");
		  message.setTo(email);
		  message.setSubject("Meet Both Email verification");
		  message.setText("請在15分鐘內點擊以下網址以驗證您的email: http://localhost:8080/MeetBoth/verify?token=" + jwtToken);

		  // 發送郵件
		  mailSender.send(message);
		}
	
	@GetMapping(path = "/verify")
	public String verify(@RequestParam("token") String token) {
		try {

			String secretKey = "本丸大家族";
			Claims claims = Jwts.parser().setSigningKey(secretKey.getBytes(StandardCharsets.UTF_8))
					.parseClaimsJws(token).getBody();
			
			System.out.println("Subject: " + claims.getSubject());
			System.out.println("Expiration: " + claims.getExpiration());
			
			return "errorpages/success";
		} catch (Exception e) {
			System.out.println("Invalid Token");
			return "errorpages/invalid";
		}
	}
	
	@GetMapping(path = "/mail")
	public String mail() {
		return "_01_member/mail";
	}
	
	
}
