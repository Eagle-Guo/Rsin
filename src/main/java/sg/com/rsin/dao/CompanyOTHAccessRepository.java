package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.CompanyOTHAccess;

public interface CompanyOTHAccessRepository extends JpaRepository<CompanyOTHAccess, Long> {
	CompanyOTHAccess findById(long id);
	List<CompanyOTHAccess> findByCompany(String companyId);
}
