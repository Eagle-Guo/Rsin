package sg.com.rsin.enums;

import java.io.Serializable;

public enum ErrorCode implements Serializable {
	USER_NAME_NULL ("User name is null"),
	PASSWORD_NULL("Password is null"),
	EMAIL_NULL ("Email is null");
	
	private final String description;

	ErrorCode (String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
	
}
