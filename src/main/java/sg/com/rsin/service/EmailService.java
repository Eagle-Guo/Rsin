package sg.com.rsin.service;

import java.io.IOException;
import javax.mail.MessagingException;

//import freemarker.template.TemplateException;
import sg.com.rsin.entity.Mail;

public interface EmailService {
	
	void sendEmail();
	
	void sendEmail(String content, String toRecipient);
	
	void sendEmailWithAttachment() throws MessagingException, IOException;
	
	void sendSimpleMessage(Mail mail) throws MessagingException, IOException;

	void sendEmail(Mail mail);
}
