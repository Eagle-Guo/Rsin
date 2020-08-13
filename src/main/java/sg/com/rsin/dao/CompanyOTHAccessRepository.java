package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.CompanyOTHAccess;

public interface CompanyOTHAccessRepository extends CrudRepository<CompanyOTHAccess, Long> {
	CompanyOTHAccess findById(long id);
	List<CompanyOTHAccess> findByNewCompany(String newCompanyId);
}
