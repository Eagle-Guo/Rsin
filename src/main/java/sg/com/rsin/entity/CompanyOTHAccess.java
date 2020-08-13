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
@Table(name = "company_othaccess")
public class CompanyOTHAccess {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "company_id", nullable = false)
	private NewCompany newCompany;
	
	@Column(name="org_pass_t")
	private String OrgPassword;
	@Column(name="pw_start_date")
	private Date PWStartDate;
	@Column(name="pw_end_date")
	private Date PWEndDate;
	private boolean flag;
	private int count;
	private Date createdDate;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "shareholder_id", nullable = false)
	private CompanyShareholderInfo companyShareholderInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public NewCompany getNewCompany() {
		return newCompany;
	}

	public void setNewCompany(NewCompany newCompany) {
		this.newCompany = newCompany;
	}

	public String getOrgPassword() {
		return OrgPassword;
	}

	public void setOrgPassword(String orgPassword) {
		OrgPassword = orgPassword;
	}

	public Date getPWStartDate() {
		return PWStartDate;
	}

	public void setPWStartDate(Date pWStartDate) {
		PWStartDate = pWStartDate;
	}

	public Date getPWEndDate() {
		return PWEndDate;
	}

	public void setPWEndDate(Date pWEndDate) {
		PWEndDate = pWEndDate;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public CompanyShareholderInfo getCompanyShareholderInfo() {
		return companyShareholderInfo;
	}

	public void setCompanyShareholderInfo(CompanyShareholderInfo companyShareholderInfo) {
		this.companyShareholderInfo = companyShareholderInfo;
	}
}
