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
@Table(name = "timeline_addition")
public class TimelineAddition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="service_progress")
	private String serviceProgress;
	@Column(name="channel")
	private String channel;
	@ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
	private Company company;
    
    public TimelineAddition() {}

	public TimelineAddition(Long id, String serviceProgress, String channel, Company company) {
		super();
		this.id = id;
		this.serviceProgress = serviceProgress;
		this.channel = channel;
		this.company = company;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getServiceProgress() {
		return serviceProgress;
	}
	public void setServiceProgress(String serviceProgress) {
		this.serviceProgress = serviceProgress;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
