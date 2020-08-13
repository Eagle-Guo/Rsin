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
@Table(name = "company_info")
public class CompanyInfo {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String description;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "company_id", nullable = false)
	private NewCompany newCompany;
	
	public CompanyInfo() {}
	
	public CompanyInfo(Long id, String name, String description, NewCompany newCompany) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public NewCompany getNewCompany() {
		return newCompany;
	}
	public void setNewCompany(NewCompany newCompany) {
		this.newCompany = newCompany;
	}
}
