package springTeam5._01_member.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._01_member.model.sendVerificationEmail;

@Controller
public class MailVerification {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService ms;
	
	@PostMapping(path = "/mailVerify.controller")
	public String mailverify(@RequestParam("value") String email) {
		
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		
		// 建立一封簡單的郵件
		  SimpleMailMessage message = new SimpleMailMessage();
		  message.setFrom("meetboth@gmail.com");
		  message.setTo(email);
		  message.setSubject("Meet Both Email verification");
		  message.setText("請在15分鐘內點擊以下網址以驗證您的email: http://localhost:8080/MeetBoth/verify?email="+email+"&token=" + jwtToken);

		  // 發送郵件
		  mailSender.send(message);
		  return "_01_member/mailsend";
		}
	
	@PostMapping(path = "forgotpassword")
	public String forgotpass(@RequestParam("mail") String email,@RequestParam("account") String account) {
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		
		// 建立一封簡單的郵件
		  SimpleMailMessage message = new SimpleMailMessage();
		  message.setFrom("meetboth@gmail.com");
		  message.setTo(email);
		  message.setSubject("Meet Both Email verification");
		  message.setText("請在15分鐘內點擊以下網址以更新您的密碼: http://localhost:8080/MeetBoth/verifypass?account="+account+"&token=" + jwtToken);

		  // 發送郵件
		  mailSender.send(message);
		  return "/";
	}
	
	@GetMapping(path = "/verify")
	public String verify(@RequestParam("token") String token, @RequestParam("email") String email, Model m) {
		try {

			String secretKey = "本丸大家族";
			Claims claims = Jwts.parser().setSigningKey(secretKey.getBytes(StandardCharsets.UTF_8))
					.parseClaimsJws(token).getBody();
			
			System.out.println("Subject: " + claims.getSubject());
			System.out.println("Expiration: " + claims.getExpiration());
			
			m.addAttribute("member", email);
			return "_01_member/register";
		} catch (Exception e) {
			System.out.println("Invalid Token");
			return "errorpages/invalid";
		}
	}
	
	@GetMapping(path = "/verifypass")
	public String verifypass(@RequestParam("token") String token, @RequestParam("account") String account, Model m) {
		try {
			
			String secretKey = "本丸大家族";
			Claims claims = Jwts.parser().setSigningKey(secretKey.getBytes(StandardCharsets.UTF_8))
					.parseClaimsJws(token).getBody();
			
			System.out.println("Subject: " + claims.getSubject());
			System.out.println("Expiration: " + claims.getExpiration());
			
			m.addAttribute("account", account);
			return "_01_member/resetpassword";
		} catch (Exception e) {
			System.out.println("Invalid Token");
			return "errorpages/invalid";
		}
	}
	
	@PostMapping(path = "/resetpass")
	public String restpass(@RequestParam("account") String account, @RequestParam("password") String pass) {
		MemberBean newMem = new MemberBean();
		List<MemberBean> list = ms.searchMemByAccount(account);
		if (list.size() == 0) {
			return "errorpages/notexist";
		}else {	
			MemberBean member = list.get(0);
			newMem.setMemberID(member.getMemberID());
			newMem.setPassword(pass);
			return "_01_member/resetsuccess";
		}
	}
	
	@GetMapping(path = "/mail")
	public String mail() {
		return "_01_member/mail";
	}
	
	
}
