package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.CompanyOTHAccess;
import sg.com.rsin.entity.CompanyService;

public interface CompanyServiceRepository extends CrudRepository<CompanyService, Long> {
	CompanyService findById(long id);
	List<CompanyService> findByCompany(String companyId);
	
}