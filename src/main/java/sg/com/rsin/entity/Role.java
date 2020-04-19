package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Role {
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    private Integer id;
    @Column(name = "ROLE_NAME", unique = true, nullable = false, length = 50)
    private String RoleName;
	
    
    public Role(Integer id, String roleName) {
		super();
		this.id = id;
		RoleName = roleName;
	}
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
    
    
}
