package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.Roles;

public interface RoleRepository extends CrudRepository<Roles, Long> {
	Roles findById(long id);
	List<Roles> findByName(String name);
	
}