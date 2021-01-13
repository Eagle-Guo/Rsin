package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.DocumentType;

public interface DocumentTypeRepository extends JpaRepository<DocumentType, String> {
	public DocumentType findByDocumentTypeCode(String documentTypeCode);
}