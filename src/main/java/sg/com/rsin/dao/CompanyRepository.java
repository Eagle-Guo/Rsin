package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
	public Company findByName(String name); 
}