package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.UserRegistration;

public interface UserRegistrationRepository extends JpaRepository<UserRegistration, Long> {
	List<UserRegistration> findByEmail(String email);
	UserRegistration findByUsername(String username);
	
}