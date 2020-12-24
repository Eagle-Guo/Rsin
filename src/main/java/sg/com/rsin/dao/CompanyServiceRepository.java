package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.CompanyService;

public interface CompanyServiceRepository extends CrudRepository<CompanyService, Long> {
	CompanyService findById(long id);

	@Query("select cs from CompanyService cs, Company c where c.id = cs.company.id and c.id = :id")
	CompanyService findByCompanyId(@Param("id") long id);
	
}