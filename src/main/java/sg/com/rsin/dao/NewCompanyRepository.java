package sg.com.rsin.dao;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.NewCompany;

public interface NewCompanyRepository extends CrudRepository<NewCompany, Long> {
	NewCompany findById(long id);
	
}