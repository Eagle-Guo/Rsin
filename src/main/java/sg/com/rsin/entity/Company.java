package sg.com.rsin.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="backup_name")
	private String backupName;
	@Column(name="type")
	private String type;
	@Column(name="total_stock_capital")
	private float totalStockCapital;
	@Column(name="actual_stock_capital")
	private float actualStockCapital;
	@Column(name="activity_one")
	private String activityOne;
	@Column(name="activity_two")
	private String activityTwo;
	@Column(name="address")
	private String address;
    @Column(name="status")
	private String status;
    @Column(name="total_shareholder")
	private int totalShareholder;
    @Column(name="shareholder_comfirm")
	private int shareholderComfirm;
    @Column(name="created_date")
	private Date createdDate;
    
    @OneToOne(mappedBy = "company")
    private CompanyService serviceList;
    
    @OneToMany(cascade = {CascadeType.ALL})
    private List<CompanyShareholderInfo> shareholderInfoList;
    
    public Company() {}
    
	public Company(Long id, String name, String backupName, String type, float totalStockCapital,
			float actualStockCapital, String activityOne, String activityTwo, String address, String status,
			int totalShareholder, int shareholderComfirm, Date createdDate, CompanyService serviceList,
			List<CompanyShareholderInfo> shareholderInfoList) {
		super();
		this.id = id;
		this.name = name;
		this.backupName = backupName;
		this.type = type;
		this.totalStockCapital = totalStockCapital;
		this.actualStockCapital = actualStockCapital;
		this.activityOne = activityOne;
		this.activityTwo = activityTwo;
		this.address = address;
		this.status = status;
		this.totalShareholder = totalShareholder;
		this.shareholderComfirm = shareholderComfirm;
		this.createdDate = createdDate;
		this.serviceList = serviceList;
		this.shareholderInfoList = shareholderInfoList;
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBackupName() {
		return backupName;
	}
	public void setBackupName(String backupName) {
		this.backupName = backupName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getTotalStockCapital() {
		return totalStockCapital;
	}
	public void setTotalStockCapital(float totalStockCapital) {
		this.totalStockCapital = totalStockCapital;
	}
	public float getActualStockCapital() {
		return actualStockCapital;
	}
	public void setActualStockCapital(float actualStockCapital) {
		this.actualStockCapital = actualStockCapital;
	}
	public String getActivityOne() {
		return activityOne;
	}
	public void setActivityOne(String activityOne) {
		this.activityOne = activityOne;
	}
	public String getActivityTwo() {
		return activityTwo;
	}
	public void setActivityTwo(String activityTwo) {
		this.activityTwo = activityTwo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public CompanyService getServiceList() {
		return serviceList;
	}
	public void setServiceList(CompanyService serviceList) {
		this.serviceList = serviceList;
	}
	public List<CompanyShareholderInfo> getShareholderInfoList() {
		return shareholderInfoList;
	}
	public void setShareholderInfoList(List<CompanyShareholderInfo> shareholderInfoList) {
		this.shareholderInfoList = shareholderInfoList;
	}
}
