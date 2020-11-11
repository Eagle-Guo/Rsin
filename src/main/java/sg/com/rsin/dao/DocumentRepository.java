package sg.com.rsin.dao;

import org.springframework.data.repository.CrudRepository;

import sg.com.rsin.entity.Company;
import sg.com.rsin.entity.Document;
import sg.com.rsin.entity.DocumentType;

public interface DocumentRepository extends CrudRepository<Document, String> {
	public Document findByDocumentTypeAndCompany(DocumentType documentType, Company company);
}