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
@Table(name = "signature_log")
public class SignatureLog {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="action_type")
	private String actionType;
	@Column(name="action_desc")
	private String actionDesc;
	@Column(name="created_by")
	private String createdBy;
    @Column(name="created_date")
	private Date createdDate;
    
    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

    public SignatureLog() {}

	public SignatureLog(String actionType, String actionDesc, String createdBy, Date createdDate,
			Company company) {
		super();
		this.actionType = actionType;
		this.actionDesc = actionDesc;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.company = company;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getActionType() {
		return actionType;
	}
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
	public String getActionDesc() {
		return actionDesc;
	}
	public void setActionDesc(String actionDesc) {
		this.actionDesc = actionDesc;
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
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
    
}
