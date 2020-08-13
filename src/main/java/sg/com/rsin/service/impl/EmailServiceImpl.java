package sg.com.rsin.service.impl;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import sg.com.rsin.entity.Mail;
import sg.com.rsin.service.EmailService;

@Service
@PropertySource("classpath:global.properties")
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	@Qualifier("freeMarkerConfiguration")
    private Configuration freemarkerConfig;
	
	@Value("${email.send.from}")
	private String sendFrom;
	
	public void sendEmail() {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("yuzhiqwe@gmail.com");
        msg.setTo("yuzhiqwe@gmail.com");

        msg.setSubject("创建新公司 填报资料");
        msg.setText("Hello World \n Spring Boot Email " + new Date());
        mailSender.send(msg);
        System.out.print("Email sent successful!");

    }
	
	public void sendEmail(String content, String toReceipion) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(sendFrom);
        msg.setTo(toReceipion);

        msg.setSubject("创建新公司 确认邮件");
        msg.setText("请点击以下链接完成新公司的注册: " + content);
        mailSender.send(msg);
        System.out.print("Email sent successful!");

    }
	
	/**
	 * Send freemarker template email
	 * @param mail
	 * @throws MessagingException
	 * @throws IOException
	 * @throws TemplateException
	 */
	public void sendSimpleMessage(Mail mail) throws MessagingException, IOException, TemplateException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message,
                MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                StandardCharsets.UTF_8.name());

        //add attachment
        //helper.addAttachment("logo.png", new ClassPathResource("emails/logo.jpg"));

        Template t = freemarkerConfig.getTemplate("newcompany-email.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());

        helper.setFrom(sendFrom);
        helper.setTo(mail.getTo());
        helper.setText(html, true);
        helper.setSubject(mail.getSubject());

        mailSender.send(message);
    }
	
	
	public void sendEmailWithAttachment() throws MessagingException, IOException {

        MimeMessage msg = mailSender.createMimeMessage();

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

        mailSender.send(msg);
    }
}
