package springTeam5._05_teacStu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class TeacStudMailService {
	private JavaMailSender mSender;
	
	@Autowired
	public TeacStudMailService(JavaMailSender mSender) {
		this.mSender = mSender;
	}
	
	public void prepareAndSendForTeac(String memberEmailTeac, String memberEmail, String memberName, String memberNameTeac) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true);
			messageHelper.setFrom(memberEmail); //
			messageHelper.setTo(memberEmailTeac);
			messageHelper.setSubject(memberNameTeac+" 先生/女士 您好，MeetBoth上的學生希望聯繫您");
			messageHelper.setText("<html><body><h5 style='font-size: 24px'>"+memberNameTeac+"先生/女士 <br><h5>"
	                +"<p style='font-size: 20px'>您好:</p><br>"+"我是"+memberName+"我在MeetBoth家教網看到您的資訊，對您的課程非常有興趣，希望能得到您的回覆，謝謝。"
					+"<br>"+"<img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth家教網</span></body></html>",true);
		};
		try {
			mSender.send(messagePreparator);
			 System.out.println("sent");
		} catch (MailException e) {
			 System.out.println(e);
//			 runtime exception; compiler will not force you to handle it
		}
	}
	
	public void prepareAndSendForStud(String memberEmailStud, String memberEmail, String memberName, String memberNameStud) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true);
			messageHelper.setFrom(memberEmail);
			messageHelper.setTo(memberEmailStud);
			messageHelper.setSubject(memberNameStud+" 先生/女士 您好，MeetBoth上的教師希望聯繫您");
			messageHelper.setText("<html><body><h5 style='font-size: 20px'>"+memberNameStud+"先生/女士 <br><h5>"
	                +"<p style='font-size: 14px'>您好:<br>"+"我是"+memberName+"我在MeetBoth家教網看到您的資訊，認為自己能符合您的需求，希望能得到您的回覆，謝謝"
					+"<br>"+"<img src='https://upload.cc/i1/2023/02/13/Jid0tu.png'><span style='font-size: 20px'>感謝您使用MeetBoth家教網</span></body></html>",true);
		};
		try {
			mSender.send(messagePreparator);
			 System.out.println("sent");
		} catch (MailException e) {
			 System.out.println(e);
//			 runtime exception; compiler will not force you to handle it
		}
	}
}
