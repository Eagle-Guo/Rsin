package sg.com.rsin.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "company_status_time")
public class CompanyStatusTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date services;
	private Date information;
	private Date payment;
	private Date signature;
	private Date uploadfile;

	//@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

	public CompanyStatusTime() {}

	public CompanyStatusTime(Long id, Date services, Date information, Date payment, 
			Date signature, Date uploadfile,  Company company) {
		super();
		this.id = id;
		this.services = services;
		this.information = information;
		this.payment = payment;
		this.signature = signature;
		this.uploadfile = uploadfile;
		this.company = company;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getServices() {
		return services;
	}
	public void setServices(Date services) {
		this.services = services;
	}
	public Date getInformation() {
		return information;
	}
	public void setInformation(Date information) {
		this.information = information;
	}
	public Date getPayment() {
		return payment;
	}
	public void setPayment(Date payment) {
		this.payment = payment;
	}
	public Date getSignature() {
		return signature;
	}
	public void setSignature(Date signature) {
		this.signature = signature;
	}
	public Date getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(Date uploadfile) {
		this.uploadfile = uploadfile;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
