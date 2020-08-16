package sg.com.rsin.dao;

import java.util.List;

//import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
//import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import sg.com.rsin.entity.UserRegistration;

//@RepositoryRestResource(collectionResourceRel="", path="")
public interface UserRegistrationRepository extends CrudRepository<UserRegistration, Long> {
	List<UserRegistration> findByEmail(String email);
	UserRegistration findByUsername(String username);
	
}