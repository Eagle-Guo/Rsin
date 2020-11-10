package sg.com.rsin.dao;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.DocumentType;

public interface DocumentTypeRepository extends CrudRepository<DocumentType, String> {
	public DocumentType findByDocumentTypeCode(String documentTypeCode);
}