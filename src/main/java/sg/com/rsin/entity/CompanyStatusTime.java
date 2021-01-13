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
@Table(name = "company_status_time")
public class CompanyStatusTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @Column(name="services")
	private Date services;
    @Column(name="information")
	private Date information;
    @Column(name="payment")
	private Date payment;
    @Column(name="payment_status")
	private int paymentStatus;
    @Column(name="signature")
	private Date signature;
    @Column(name="signature_status")
   	private int signatureStatus;
    @Column(name="uploadfile")
	private Date uploadfile;
    @Column(name="uploadfile_status")
   	private int uploadfileStatus;

	@ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

	public CompanyStatusTime() {}

	public CompanyStatusTime(Long id, Date services, Date information, Date payment, int paymentStatus, Date signature,
			int signatureStatus, Date uploadfile, int uploadfileStatus, Company company) {
		super();
		this.id = id;
		this.services = services;
		this.information = information;
		this.payment = payment;
		this.paymentStatus = paymentStatus;
		this.signature = signature;
		this.signatureStatus = signatureStatus;
		this.uploadfile = uploadfile;
		this.uploadfileStatus = uploadfileStatus;
		this.company = company;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public int getSignatureStatus() {
		return signatureStatus;
	}
	public void setSignatureStatus(int signatureStatus) {
		this.signatureStatus = signatureStatus;
	}
	public int getUploadfileStatus() {
		return uploadfileStatus;
	}
	public void setUploadfileStatus(int uploadfileStatus) {
		this.uploadfileStatus = uploadfileStatus;
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
