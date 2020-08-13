package sg.com.rsin.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class NewCompany {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @Column(name="status")
	private String status;
    @Column(name="total_shareholder")
	private int totalShareholder;
    @Column(name="shareholder_comfirm")
	private int shareholderComfirm;
    @Column(name="created_date")
	private Date createdDate;
    
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "service_id")
    private List<CompanyService> serviceList;
    
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "info_id")
    private List<CompanyInfo> infoList;
    
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "shareholder_info_id")
    private List<CompanyShareholderInfo> shareholderInfoList;
    
    public NewCompany() {}
    
	public NewCompany(Long id, String status, int totalShareholder, int shareholderComfirm, Date createdDate,
			List<CompanyService> serviceList, List<CompanyInfo> infoList,
			List<CompanyShareholderInfo> shareholderInfoList) {
		super();
		this.id = id;
		this.status = status;
		this.totalShareholder = totalShareholder;
		this.shareholderComfirm = shareholderComfirm;
		this.createdDate = createdDate;
		this.serviceList = serviceList;
		this.infoList = infoList;
		this.shareholderInfoList = shareholderInfoList;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotalShareholder() {
		return totalShareholder;
	}
	public void setTotalShareholder(int totalShareholder) {
		this.totalShareholder = totalShareholder;
	}
	public int getShareholderComfirm() {
		return shareholderComfirm;
	}
	public void setShareholderComfirm(int shareholderComfirm) {
		this.shareholderComfirm = shareholderComfirm;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public List<CompanyService> getServiceList() {
		return serviceList;
	}
	public void setServiceList(List<CompanyService> serviceList) {
		this.serviceList = serviceList;
	}
	public List<CompanyInfo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<CompanyInfo> infoList) {
		this.infoList = infoList;
	}
	public List<CompanyShareholderInfo> getShareholderInfoList() {
		return shareholderInfoList;
	}
	public void setShareholderInfoList(List<CompanyShareholderInfo> shareholderInfoList) {
		this.shareholderInfoList = shareholderInfoList;
	}
}
