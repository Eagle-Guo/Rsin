package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.CompanyStatusTime;

public interface CompanyStatusTimeRepository extends CrudRepository<CompanyStatusTime, Long> {
	@Query("select cst from CompanyStatusTime cst, Company c where c.id = cst.company.id and c.id = :id")
	CompanyStatusTime findByCompanyId (@Param("id") long id);
}