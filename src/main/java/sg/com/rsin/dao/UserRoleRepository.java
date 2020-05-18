package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.UserRole;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {
	List<UserRole> findById(String id);
	List<UserRole> findByUserId(long userId);
}