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
	@Column(name="defunct_flag")
	private boolean defunctFlag;
	
	public StatusCode() {}

	public StatusCode(String statusDesc, boolean defunctFlag) {
		super();
		this.statusDesc = statusDesc;
		this.defunctFlag = defunctFlag;
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
	public boolean isDefunctFlag() {
		return defunctFlag;
	}
	public void setDefunctFlag(boolean defunctFlag) {
		this.defunctFlag = defunctFlag;
	}
}
