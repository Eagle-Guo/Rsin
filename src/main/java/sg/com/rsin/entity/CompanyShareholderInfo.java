package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "company_shareholder_info")
public class CompanyShareholderInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @Column(name="position_type")
	private String positionType;
    @Column(name="name")
	private String name;
    @Column(name="gender")
	private String gender;
    @Column(name="nationality")
	private String nationality;
    @Column(name="ic_type")
	private String icType;
    @Column(name="ic_number")
	private String icNumber;
    @Column(name="email")
	private String email;
    @Column(name="contact_number")
	private String contactNumber;
    @Column(name="issue_stock_amount")
	private int issueStockAmount;
    @Column(name="actual_stock_amount")
	private int actualStockAmount;
    @Column(name="value_per_stock")
	private int valuePerStock;
    @Column(name="address")
	private String address;
    @Column(name="seq")
	private int seq;
    @Column(name="signature_name")
	private String signatureName;
    @Column(name="signature_path")
	private String signaturePath;
    @Column(name="ip")
	private String ip;
    @Column(name="checksum")
	private String checksum;
	@Column(name="status")
	private boolean status;
    @Column(name="lock_flag")
	private boolean lockFlag;

	//@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

	public CompanyShareholderInfo() {}

	public CompanyShareholderInfo(Long id, String positionType, String name, String gender, String nationality,
			String icType, String icNumber, String email, String contactNumber, int issueStockAmount,
			int actualStockAmount, int valuePerStock, String address, int seq, String signatureName, 
			String ip, String checksum, boolean status, boolean lockFlag, String signaturePath,  Company company) {
		super();
		this.id = id;
		this.positionType = positionType;
		this.name = name;
		this.gender = gender;
		this.nationality = nationality;
		this.icType = icType;
		this.icNumber = icNumber;
		this.email = email;
		this.contactNumber = contactNumber;
		this.issueStockAmount = issueStockAmount;
		this.actualStockAmount = actualStockAmount;
		this.valuePerStock = valuePerStock;
		this.address = address;
		this.seq = seq;
		this.signatureName = signatureName;
		this.signaturePath = signaturePath;
		this.ip = ip;
		this.checksum = checksum;
		this.status = status;
		this.company = company;
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
	public String getPositionType() {
		return positionType;
	}
	public void setPositionType(String positionType) {
		this.positionType = positionType;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getIcType() {
		return icType;
	}
	public void setIcType(String icType) {
		this.icType = icType;
	}
	public String getIcNumber() {
		return icNumber;
	}
	public void setIcNumber(String icNumber) {
		this.icNumber = icNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public int getIssueStockAmount() {
		return issueStockAmount;
	}
	public void setIssueStockAmount(int issueStockAmount) {
		this.issueStockAmount = issueStockAmount;
	}
	public int getActualStockAmount() {
		return actualStockAmount;
	}
	public void setActualStockAmount(int actualStockAmount) {
		this.actualStockAmount = actualStockAmount;
	}
	public int getValuePerStock() {
		return valuePerStock;
	}
	public void setValuePerStock(int valuePerStock) {
		this.valuePerStock = valuePerStock;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSignatureName() {
		return signatureName;
	}
	public void setSignatureName(String signatureName) {
		this.signatureName = signatureName;
	}
	public String getSignaturePath() {
		return signaturePath;
	}
	public void setSignaturePath(String signaturePath) {
		this.signaturePath = signaturePath;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getChecksum() {
		return checksum;
	}
	public void setChecksum(String checksum) {
		this.checksum = checksum;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public boolean isLockFlag() {
		return lockFlag;
	}
	public void setLockFlag(boolean lockFlag) {
		this.lockFlag = lockFlag;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
