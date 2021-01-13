package sg.com.rsin.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
	Role findById(long id);
	Set<Role> findByName(String name);
	
}