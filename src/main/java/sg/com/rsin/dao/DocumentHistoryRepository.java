package sg.com.rsin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.DocumentHistory;

public interface DocumentHistoryRepository extends JpaRepository<DocumentHistory, String> {
	DocumentHistory findByReferenceNo(String referenceNo);
	
	List<DocumentHistory> findByDocumentIdOrderByIdDesc(Long id);
}