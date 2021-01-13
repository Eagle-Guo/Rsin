package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.com.rsin.entity.Document;

public interface DocumentRepository extends JpaRepository<Document, String> {
	@Query("select d from Document d where d.documentType.documentTypeCode = :docType and d.userId = :userId and d.company.id = :companyId ")
	public Document findByDocumentTypeAndUserIdAndCompany(@Param("docType") String documentType,
			@Param("userId") String userId, @Param("companyId") Long companyId);
}