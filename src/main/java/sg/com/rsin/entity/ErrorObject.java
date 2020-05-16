package sg.com.rsin.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ErrorObject {
	String errorCode;
	String errorMessage;
	
	ErrorObject() {}
	
	public ErrorObject(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public ErrorObject(String errorCode, String errorMessage) {
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}
	
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
}
