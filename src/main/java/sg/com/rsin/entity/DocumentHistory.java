package sg.com.rsin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@Table(name = "document_history")
public class DocumentHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="document_path")
	private String documentPath;
	@Column(name="document_name")
	private String documentName;
	@Column(name="reference_no")
	private String referenceNo;
	@Column(name="created_by")
	private String createdBy;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Column(name="created_date")
	private Date createdDate;
    
    @ManyToOne
    @JoinColumn(name = "document_id", nullable = false)
	private Document document;
    
    public DocumentHistory() {}

	public DocumentHistory(Long id, String documentPath, String documentName, String createdBy, Date createdDate, String referenceNo) {
		super();
		this.id = id;
		this.documentPath = documentPath;
		this.documentName = documentName;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.referenceNo = referenceNo;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDocumentPath() {
		return documentPath;
	}
	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
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
	public String getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
}
