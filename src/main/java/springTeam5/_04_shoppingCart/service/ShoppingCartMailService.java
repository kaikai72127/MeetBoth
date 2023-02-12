package springTeam5._04_shoppingCart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartMailService {
	private JavaMailSender mailSender;

	@Autowired
	public ShoppingCartMailService(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void prepareAndSendForBuy(String recipient, String memberName,String orderMessage) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true);
<<<<<<< HEAD
			messageHelper.setFrom("meetboth@gmail.com"); //
=======
			messageHelper.setFrom("meetboth@gmail.com");
>>>>>>> origin/_01_Seal
			messageHelper.setTo(recipient);
			messageHelper.setSubject(memberName+" 先生/女士 感謝您使用MeetBoth購物");
			messageHelper.setText("<html><body><h5 style='font-size: 18px'>"+memberName+"先生/女士 感謝您的訂購<br><h5>"
	                +"<p>您的訂單明細:<br>"+orderMessage+"<br>"+"感謝您使用商城購物系統</p></body></html>",true);
		};
		try {
			mailSender.send(messagePreparator);
			 System.out.println("sent");
		} catch (MailException e) {
			 System.out.println(e);
//			 runtime exception; compiler will not force you to handle it
		}
	}
	
	public void prepareAndSendForSale(String recipient, String memberName,String orderMessage) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true);
			messageHelper.setFrom("meetboth@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(memberName+" 先生/女士 您有一筆新訂單，請盡速出貨");
			messageHelper.setText("<html><body><h5 style='font-size: 18px'>"+memberName+"先生/女士 您有一筆新訂單<br><h5>"
	                +"<p>您的訂單與出貨資訊:<br>"+orderMessage+"<br>"+"感謝您使用商城購物系統販商商品</p></body></html>",true);
		};
		try {
			mailSender.send(messagePreparator);
			 System.out.println("sent");
		} catch (MailException e) {
			 System.out.println(e);
//			 runtime exception; compiler will not force you to handle it
		}
	}

}
