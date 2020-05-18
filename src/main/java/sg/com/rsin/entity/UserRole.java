package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_role")
public class UserRole {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
	
    @Column(name = "user_id", unique = true, nullable = false, length = 50)
    private long userId;
    
    @Column(name = "role_id", unique = true, nullable = false, length = 50)
    private long roleId;
	
    public UserRole() {}
    
    public UserRole(long id, long userId, long roleId) {
		this.id = id;
		this.userId = userId;
		this.roleId = roleId;
	}
    
    public UserRole( long userId, long roleId) {
		this.userId = userId;
		this.roleId = roleId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
}
