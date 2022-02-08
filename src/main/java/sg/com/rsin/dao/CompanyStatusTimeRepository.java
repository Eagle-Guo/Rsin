package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.CompanyStatusTime;

public interface CompanyStatusTimeRepository extends JpaRepository<CompanyStatusTime, Long> {
	@Query("select cst from CompanyStatusTime cst, Company c where c.id = cst.company.id and c.id = :id")
	CompanyStatusTime findByCompanyId (@Param("id") long id);
	
	List<CompanyStatusTime> findByPaymentIsNullOrSignatureIsNullOrUploadfileStatusIsNull();
}