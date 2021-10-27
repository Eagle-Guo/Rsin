package sg.com.rsin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SpringBootFormHandingApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootFormHandingApplication.class, args);
	}
}