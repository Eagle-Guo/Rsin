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
	@Column(name="created_by")
	private String createdBy;
    @Column(name="created_date")
	private Date createdDate;
    @Column(name="user_id")
	private String userId;
    
    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "document_type_code", nullable = false)
    private DocumentType documentType;
    
    public Document() {}

	public Document(Long id, String createdBy, Date createdDate,
			String userId, Company company, DocumentType documentType) {
		super();
		this.id = id;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.company = company;
		this.documentType = documentType;
	}

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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
