package sg.com.rsin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import sg.com.rsin.entity.InitiateDocument;

public interface InitiateDocumentRepository extends JpaRepository<InitiateDocument, String> {
}