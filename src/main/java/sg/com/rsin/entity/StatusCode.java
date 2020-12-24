package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "status_code")
public class StatusCode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="status_desc")
	private String statusDesc;
	@Column(name="display_step")
	private int displayStep;
    
    public StatusCode() {}
    
	public StatusCode(Long id, String statusDesc, int displayStep) {
		super();
		this.id = id;
		this.statusDesc = statusDesc;
		this.displayStep = displayStep;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public int getDisplayStep() {
		return displayStep;
	}
	public void setDisplayStep(int displayStep) {
		this.displayStep = displayStep;
	}
}
