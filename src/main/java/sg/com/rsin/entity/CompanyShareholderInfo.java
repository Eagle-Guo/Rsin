package sg.com.rsin.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	private String positionType;
	private String name;
	private String gender;
	private String nationality;
	private String icType;
	private String icNumber;
	private String email;
	private String contactNumber;
	private int issueStockAmount;
	private int actualStockAmount;
	private int valuePerStock;
	private String address;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

	public CompanyShareholderInfo() {}

	public CompanyShareholderInfo(Long id, String positionType, String name, String gender, String nationality,
			String icType, String icNumber, String email, String contactNumber, int issueStockAmount,
			int actualStockAmount, int valuePerStock, String address, Company company) {
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
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
