package sg.com.rsin.dao;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.Company;

public interface CompanyRepository extends CrudRepository<Company, Long> {
	public Company findByName(String name); 
}