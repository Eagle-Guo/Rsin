package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.CompanyShareholderInfo;

public interface CompanyShareholderInfoRepository extends JpaRepository<CompanyShareholderInfo, Long> {
	CompanyShareholderInfo findById(long id);
	List<CompanyShareholderInfo> findByName(String name);
	List<CompanyShareholderInfo> findByEmailOrderById (String email);
	
	@Query("select csi from CompanyShareholderInfo csi, Company c where c.id = csi.company.id and c.id = :id")
	List<CompanyShareholderInfo> findByCompanyId (@Param("id") long id);
	
	@Query("select csi from CompanyShareholderInfo csi, Company c where c.id = csi.company.id and csi.email = :email and c.id = :id")
	List<CompanyShareholderInfo> findByEmailAndCompanyId (@Param("email")String email, @Param("id") long id);
	
	@Query("select csi from CompanyShareholderInfo csi, Company c where c.id = csi.company.id and csi.name = :name and c.id = :id")
	List<CompanyShareholderInfo> findByNameAndCompanyId (@Param("name")String name, @Param("id") long id);
}