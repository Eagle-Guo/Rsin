package sg.com.rsin.entity;

import java.util.List;

import sg.com.rsin.enums.ResponseCode;

public class CommonResponse {
	String plainBody;
	List<String> bodyList;
	ResponseCode responseCode;
	List<ErrorObject> errorList;
	
	public String getPlainBody() {
		return plainBody;
	}
	public void setPlainBody(String plainBody) {
		this.plainBody = plainBody;
	}
	public List<String> getBodyList() {
		return bodyList;
	}
	public void setBodyList(List<String> bodyList) {
		this.bodyList = bodyList;
	}
	public ResponseCode getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(ResponseCode responseCode) {
		this.responseCode = responseCode;
	}
	public List<ErrorObject> getErrorList() {
		return errorList;
	}
	public void setErrorList(List<ErrorObject> errorList) {
		this.errorList = errorList;
	}

}
