package sg.com.rsin.enums;

public enum UserStatus {
	ACTIVE("active"),
	INACTIVE("inactive"),
	LOCKED("locked");
	
	private final String description;

	UserStatus (String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
	
}
