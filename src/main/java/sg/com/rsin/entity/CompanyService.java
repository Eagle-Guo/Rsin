package sg.com.rsin.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "company_service")
public class CompanyService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int companyType;
    private int openAccount;
    private int nominalDirector;
    private int gstTax;
    private int virtualPhone;
    private int forwardMail;
    private int accounting;
    private int urgentRegistration;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;

    public CompanyService() {}

	public CompanyService(Long id, int companyType, int openAccount, int nominalDirector, int gstTax, int virtualPhone,
			int forwardMail, int accounting, int urgentRegistration, Company company) {
		super();
		this.id = id;
		this.companyType = companyType;
		this.openAccount = openAccount;
		this.nominalDirector = nominalDirector;
		this.gstTax = gstTax;
		this.virtualPhone = virtualPhone;
		this.forwardMail = forwardMail;
		this.accounting = accounting;
		this.urgentRegistration = urgentRegistration;
		this.company = company;
	}

	public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
	public int getCompanyType() {
		return companyType;
	}
	public void setCompanyType(int companyType) {
		this.companyType = companyType;
	}
	public int getOpenAccount() {
		return openAccount;
	}
	public void setOpenAccount(int openAccount) {
		this.openAccount = openAccount;
	}
	public int getNominalDirector() {
		return nominalDirector;
	}
	public void setNominalDirector(int nominalDirector) {
		this.nominalDirector = nominalDirector;
	}
	public int getGstTax() {
		return gstTax;
	}
	public void setGstTax(int gstTax) {
		this.gstTax = gstTax;
	}
	public int getVirtualPhone() {
		return virtualPhone;
	}
	public void setVirtualPhone(int virtualPhone) {
		this.virtualPhone = virtualPhone;
	}
	public int getForwardMail() {
		return forwardMail;
	}
	public void setForwardMail(int forwardMail) {
		this.forwardMail = forwardMail;
	}
	public int getAccounting() {
		return accounting;
	}
	public void setAccounting(int accounting) {
		this.accounting = accounting;
	}
	public int getUrgentRegistration() {
		return urgentRegistration;
	}
	public void setUrgentRegistration(int urgentRegistration) {
		this.urgentRegistration = urgentRegistration;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Company getCompany() {
		return company;
	}
}
