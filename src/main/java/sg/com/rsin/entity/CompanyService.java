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
@Table(name = "company_service")
public class CompanyService {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private int price;
    
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "company_id", nullable = false)
	private NewCompany newCompany;
    
    public CompanyService() {}

    public CompanyService(Long id, String name, int price, NewCompany newCompany) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.newCompany = newCompany;
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
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
	public NewCompany getNewCompany() {
		return newCompany;
	}
	public void setNewCompany(NewCompany newCompany) {
		this.newCompany = newCompany;
	}
    
    
//    private int companyType;
//    private int accountNo;
//    
//    private int directNo;
//    private int directorYear;
//    
//    private int shareholderNo;
//    private int shareholderYear;
//    
//    private int shareOfficeNo;
//    private int shareOfficeYear;
//    
//    private String trademarkNo;
//    private int trademarkAdditional;
//    
//    private int gstOneTimeRegister;

}
