package sg.com.rsin.dao;

import java.util.Set;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	Role findById(long id);
	Set<Role> findByName(String name);
	
}