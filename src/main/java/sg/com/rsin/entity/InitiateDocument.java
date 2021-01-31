package sg.com.rsin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "initiate_document")
public class InitiateDocument {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @Column(name="category")
   	private String category;
    @Column(name="display_sequence")
   	private int displaySequence;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "document_type_code", nullable = false)
    private DocumentType documentType;

    @Column(name="created_by")
	private String createdBy;
    @Column(name="created_date")
	private Date createdDate;
    
    public InitiateDocument() {}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public DocumentType getDocumentType() {
		return documentType;
	}
	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDisplaySequence() {
		return displaySequence;
	}
	public void setDisplaySequence(int displaySequence) {
		this.displaySequence = displaySequence;
	}
}
