package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.UserRegistration;

public interface UserRegistrationRepository extends CrudRepository<UserRegistration, Long> {
	List<UserRegistration> findByEmail(String email);
	UserRegistration findByUsername(String username);
	
	/*
	 * void insertEmployee(Employee cus); void insertEmployees(List<Employee>
	 * employees); List<Employee> getAllEmployees(); Employee getEmployeeById(String
	 * empId);
	 */
}