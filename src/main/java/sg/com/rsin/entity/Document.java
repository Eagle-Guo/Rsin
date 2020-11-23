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
@Table(name = "document")
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="document_path")
	private String documentPath;
	@Column(name="document_name")
	private String documentName;
	@Column(name="created_by")
	private String createdBy;
    @Column(name="created_date")
	private Date createdDate;
    @Column(name="reference_no")
	private String referenceNo;
    
    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "document_type_code", nullable = false)
    private DocumentType documentType;
    
    public Document() {}

	public Document(Long id, String documentPath, String documentName, String createdBy, Date createdDate,
			String referenceNo, Company company, DocumentType documentType) {
		super();
		this.id = id;
		this.documentPath = documentPath;
		this.documentName = documentName;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.referenceNo = referenceNo;
		this.company = company;
		this.documentType = documentType;
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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public DocumentType getDocumentType() {
		return documentType;
	}

	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}
}
