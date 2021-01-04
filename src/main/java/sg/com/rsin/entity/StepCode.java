package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "step_code")
public class StepCode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="step_desc")
	private String stepDesc;
	@Column(name="display_step")
	private int displayStep;
    
    public StepCode() {}
    
	public StepCode(Long id, String stepDesc, int displayStep) {
		super();
		this.id = id;
		this.stepDesc = stepDesc;
		this.displayStep = displayStep;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String StepDesc() {
		return stepDesc;
	}
	public void setStatusDesc(String stepDesc) {
		this.stepDesc = stepDesc;
	}
	public int getDisplayStep() {
		return displayStep;
	}
	public void setDisplayStep(int displayStep) {
		this.displayStep = displayStep;
	}
}
