package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.SignatureLog;

public interface SignatureLogRepository extends JpaRepository<SignatureLog, Long> {
	@Query("select sl from SignatureLog sl, Company c where c.id = sl.company.id and c.id = :id order by sl.createdDate")
	List<SignatureLog> findByCompanyId (@Param("id") long id);
}
