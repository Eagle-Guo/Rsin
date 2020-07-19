package sg.com.rsin.service.impl;

import java.io.IOException;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import sg.com.rsin.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendEmail() {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("yuzhiqwe@gmail.com");
        msg.setTo("yuzhiqwe@gmail.com");

        msg.setSubject("创建新公司 填报资料");
        msg.setText("Hello World \n Spring Boot Email " + new Date());
        javaMailSender.send(msg);
        System.out.print("Email sent successful!");

    }
	
	public void sendEmail(String content) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("yuzhiqwe@gmail.com");
        msg.setTo("yuzhiqwe@gmail.com");

        msg.setSubject("创建新公司 填报资料");
        msg.setText("你输入的资料是: " + content);
        javaMailSender.send(msg);
        System.out.print("Email sent successful!");

    }
	
	public void sendEmailWithAttachment() throws MessagingException, IOException {

        MimeMessage msg = javaMailSender.createMimeMessage();

        // true = multipart message
        MimeMessageHelper helper = new MimeMessageHelper(msg, true);
        msg.setFrom("yuzhiqwe@gmail.com");
        helper.setTo("yuzhiqwe@email");

        helper.setSubject("Testing from Spring Boot");

        // default = text/plain
        //helper.setText("Check attachment for image!");

        // true = text/html
        helper.setText("<h1>Check attachment for image!</h1>", true);

		// hard coded a file path
        //FileSystemResource file = new FileSystemResource(new File("path/android.png"));

        helper.addAttachment("my_photo.png", new ClassPathResource("android.png"));

        javaMailSender.send(msg);

    }
}
