package sg.com.rsin.entity;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

import sg.com.rsin.enums.UserStatus;

@Entity
@Table(name = "users")
public class UserRegistration {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
    private long id;
	
	@Column(name = "username", length = 50)
	private String username;
	
	@Column(name = "first_name", length = 50)
	private String firstName;
	
	@Column(name = "last_name", length = 50)
	private String lastName;
	
	@Column(name = "email", length = 50)
	private String email;
	
	@Column(name = "phone", length = 50)
	private String phone;
	
	@Column(name = "password", length = 120)
	private String password;
	
	@Column(name = "status", length = 50)
	private UserStatus status;
	
	private boolean enabled = true;
	
	@Column(name = "expire_date")
	private Date expireDate;
	
	@Column(name = "login_date")
	private Date loginDate;
	
	@Column(name = "fail_count")
	private int failCount;
	
	@Column(name = "country", length = 50)
	private String country;
	
	@Column(name = "province", length = 50)
	private String province;
	
	@Column(name = "city", length = 50)
	private String city;
	
	@Column(name = "postal_code", length = 10)
	private String postalCode;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name="user_role",joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
	    inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
	private Set<Role> roles;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserStatus getStatus() {
		return status;
	}
	public void setStatus(UserStatus status) {
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
}
