package springTeam5._01_member.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.websocket.MessageHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

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
	public String mailverify(@RequestParam("email") String email) {
		
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		
		// 建立一封簡單的郵件
//		  SimpleMailMessage message = new SimpleMailMessage();
//		  message.setFrom("meetboth@gmail.com");
//		  message.setTo(email);
//		  message.setSubject("Meet Both Email verification");
//		  message.setText("請在15分鐘內點擊以下網址以驗證您的email: http://localhost:8080/MeetBoth/verify?email="+email+"&token=" + jwtToken);
		  MimeMessagePreparator messagePreparator = mimeMessage -> {
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true); //true是指可以使用html語法
				messageHelper.setFrom("meetboth@gmail.com"); //寄出信件的mail
				messageHelper.setTo(email); //收件者的email
				messageHelper.setSubject("感謝您註冊MeetBoth家教網！"); //信件的抬頭
				//信件的內容
				messageHelper.setText("<html><body><h5 style='font-size: 24px'>請在15分鐘以內點擊連結前往註冊頁面<br><h5>"
		                +"<p style='font-size: 20px'>您的註冊連結:</p><br>"
		                + "<a style='color: red;' href=\""+"http://localhost:8080/MeetBoth/verify?email="+email+"&token="+jwtToken+"\">點我前往</a>"
		                + "<br><img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth，讓我們遇見彼此</span></body></html>",true);
			};
		  // 發送郵件
			try {
				mailSender.send(messagePreparator);
				 System.out.println("sent");
			} catch (MailException e) {
				 System.out.println(e);
//				 runtime exception; compiler will not force you to handle it
			}
			return "_01_member/mailsend";
		}
	
	@PostMapping(path = "verifymember")
	public String verufymember(@RequestParam("idnumber") String idNumber, @RequestParam("account") String account, Model m) {
		List<MemberBean> list = ms.searchMemByAccount(account);
		if (list.size()==0) {
			m.addAttribute("error", "沒有這個人喔！");
			return "_01_member/forgetpassword";			
		}else {
			MemberBean member = list.get(0);			
			if (member.getIdNumber().equals(idNumber)) {
				m.addAttribute("member", member);
				return "_01_member/updatepassword";
			}else {
				m.addAttribute("error", "沒有這個人喔！");
				return "_01_member/forgetpassword";
			}
		}
	}
	
	
	@PostMapping(path = "forgotpassword")
	public String forgotpass(@RequestParam("mail") String email,@RequestParam("account") String account) {
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		List<MemberBean> list = ms.searchMemByAccount(account);
		MemberBean member = list.get(0);
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true); //true是指可以使用html語法
			messageHelper.setFrom("meetboth@gmail.com"); //寄出信件的mail
			messageHelper.setTo(email); //收件者的email
			messageHelper.setSubject("MeetBoth身分驗證：");
			messageHelper.setText("<html><body><h5 style='font-size: 24px'>您好，"+member.getMemName()+"<br><h5>"
		                +"<p style='font-size: 20px'>請在15分鐘以內點擊連結前往更新密碼，您的連結:</p><br>"
		                + "<a style='color: red;' href=\""+"http://localhost:8080/MeetBoth/verifypass?account="+account+"&token="+jwtToken+"\">點我前往</a><br>"
		                +"若您並未變更密碼，請不用理會這封信件。"
		                + "<br><img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth，讓我們遇見彼此</span></body></html>",true);
		};
		// 建立一封簡單的郵件
//		  SimpleMailMessage message = new SimpleMailMessage();
//		  message.setFrom("meetboth@gmail.com");
//		  message.setTo(email);
//		  message.setSubject("Meet Both Email verification");
//		  message.setText("請在15分鐘內點擊以下網址以更新您的密碼: http://localhost:8080/MeetBoth/verifypass?account=" + account + "&token=" + jwtToken);

		  // 發送郵件
		mailSender.send(messagePreparator);
		return "redirect:/index.controller";
	}
	
	
	@PostMapping(path = "updatepass")
	public String updatepass(@RequestParam("mail") String email,@RequestParam("account") String account) {
		System.out.println(email+"and"+account);
		sendVerificationEmail token = new sendVerificationEmail();
		String jwtToken = token.getJwtToken();
		List<MemberBean> list = ms.searchMemByAccount(account);
		MemberBean member = list.get(0);
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true); //true是指可以使用html語法
			messageHelper.setFrom("meetboth@gmail.com"); //寄出信件的mail
			messageHelper.setTo(email); //收件者的email
			messageHelper.setSubject("MeetBoth密碼更新驗證：");
			messageHelper.setText("<html><body><h5 style='font-size: 24px'>您好，"+member.getMemName()+"<br><h5>"
		                +"<p style='font-size: 20px'>請在15分鐘以內點擊連結前往更新密碼，您的連結:</p><br>"
		                + "<a style='color: red;' href=\""+"http://localhost:8080/MeetBoth/verifypass?account="+account+"&token="+jwtToken+"\">點我前往</a><br>"
		                +"若您並未變更密碼，請不用理會這封信件。<br>"
		                + "<img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth，讓我們遇見彼此</span></body></html>",true);
		};
		// 建立一封簡單的郵件
//		  SimpleMailMessage message = new SimpleMailMessage();
//		  message.setFrom("meetboth@gmail.com");
//		  message.setTo(email);
//		  message.setSubject("Meet Both Email verification");
//		  message.setText("請在15分鐘內點擊以下網址以更新您的密碼: http://localhost:8080/MeetBoth/verifypass?account=" + account + "&token=" + jwtToken);

		  // 發送郵件
		mailSender.send(messagePreparator);
		return "redirect:/index.controller";
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
		List<MemberBean> list = ms.searchMemByAccount(account);
		if (list.size() == 0) {
			return "errorpages/notexist";
		}else {	
			MemberBean member = list.get(0);
			member.setPassword(new BCryptPasswordEncoder().encode(pass));
			ms.update(member);
			
			return "_01_member/resetsuccess";
		}
	}
	
	@GetMapping(path = "/mail")
	public String mail() {
		return "_01_member/mail";
	}
	
	
}
