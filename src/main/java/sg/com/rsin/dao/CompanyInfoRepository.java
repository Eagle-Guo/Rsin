package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.CompanyInfo;

public interface CompanyInfoRepository extends CrudRepository<CompanyInfo, Long> {
	CompanyInfo findById(long id);
	List<CompanyInfo> findByName(String name);
	
	@Query("select ci from CompanyInfo ci, NewCompany c where c.id = ci.newCompany.id and c.id = :id")
	List<CompanyInfo> findByCompanyId(@Param("id") long id);
	
}