package sg.com.rsin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import java.util.Date;

@Entity
public class Users {

	@GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    private Integer id;
    @Column(name = "USER_NAME", unique = true, nullable = false, length = 50)
    private String username;
    @Column(name = "PASSWORD", unique = false, nullable = false, length = 50)
    private String password;
    @Column(name = "STATUS", unique = false, nullable = false, length = 50)
    private String status;
    @Column(name = "ENABLED", columnDefinition = "tinyint(1) default '0'")
    private boolean enabled;
    @Column(name = "EXPIRE_DATE", unique = false, nullable = true, length = 50)
    private Date expireDate;
    @Column(name = "LOGIN_DATE", unique = false, nullable = true, length = 50)
    private Date loginDate;
    @Column(name = "FAIL_COUNT", unique = false, nullable = true, length = 2)
    private int failCount;

    public Users() {
    }

    public Users(String username, String password, String status, boolean enabled, Date expireDate, Date loginDate,	int failCount) {
	        this.username = username;
	        this.password = password;
	        this.status = status;
	        this.enabled = enabled;
	        this.expireDate = expireDate;
	        this.loginDate = loginDate;
	        this.failCount = failCount;
	    }
	    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public int getFailCount() {
		return failCount;
	}

	public void setFailCount(int failCount) {
		this.failCount = failCount;
	}

		@Override
	    public String toString() {
	        return "Permission{" +
	                "id=" + id +
	                ", username='" + username + '\'' +
	                ", password='" + password + '\'' +
	                ", status='" + status + '\'' +
	                ", enabled=" + enabled +
	                ", expireDate=" + expireDate +
	                ", loginDate=" + loginDate +
	                ", failCount='" + failCount + '\'' +
	                '}';
	    }

}
