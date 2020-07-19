package sg.com.rsin.service;

import java.io.IOException;

import javax.mail.MessagingException;

public interface EmailService {
	
	void sendEmail();
	
	void sendEmail(String content);
	
	void sendEmailWithAttachment() throws MessagingException, IOException;

}
