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
    
    @Column(name="category")
   	private String category;
    @Column(name="display_sequence")
   	private int displaySequence;
    @Column(name="document_desc")
   	private String documentDesc;
    @Column(name="document_desc_cn")
   	private String documentDesccn;
    @Column(name="lock_flag")
	private boolean lockFlag;

    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;
    
    @ManyToOne()
    @JoinColumn(name = "document_type_code", nullable = false)
    private DocumentType documentType;
    
    public Document() {}

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
	public String getDocumentDesc() {
		return documentDesc;
	}
	public void setDocumentDesc(String documentDesc) {
		this.documentDesc = documentDesc;
	}
	public String getDocumentDesccn() {
		return documentDesccn;
	}
	public void setDocumentDesccn(String documentDesccn) {
		this.documentDesccn = documentDesccn;
	}
	public boolean isLockFlag() {
		return lockFlag;
	}
	public void setLockFlag(boolean lockFlag) {
		this.lockFlag = lockFlag;
	}
}
