package global.sesoc.tp.email;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

@Repository
public class EmailSender {

	@Autowired
	private JavaMailSender mailSender; // xml에 등록한 bean autowired

	public boolean sendMail(String from, String to, String subject, String text)
			throws FileNotFoundException, URISyntaxException {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			message.setFrom(new InternetAddress(from));
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(text, "utf-8", "html");
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
