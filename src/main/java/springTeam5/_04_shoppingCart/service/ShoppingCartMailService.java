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

	//寄給購買者的訂單
	public void prepareAndSendForBuy(String recipient, String memberName,String orderMessage) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true); //true是指可以使用html語法
			messageHelper.setFrom("meetboth@gmail.com"); //寄出信件的mail
			messageHelper.setTo(recipient); //收件者的email
			messageHelper.setSubject(memberName+" 先生/女士 感謝您使用MeetBoth購物"); //信件的抬頭
			//信件的內容
			messageHelper.setText("<html><body><h5 style='font-size: 24px'>"+memberName+"先生/女士 感謝您的訂購<br><h5>"
	                +"<p style='font-size: 20px'>您的訂單明細:</p><br>"+orderMessage+"<br>"+"<img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth商城</span></body></html>",true);
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
			messageHelper.setText("<html><body><h5 style='font-size: 20px'>"+memberName+"先生/女士 您有一筆新訂單<br><h5>"
	                +"<p style='font-size: 14px'>您的訂單與出貨資訊:<br>"+orderMessage+"<br>"+"感謝您使用商城購物系統販商商品</p></body></html>",true);
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
