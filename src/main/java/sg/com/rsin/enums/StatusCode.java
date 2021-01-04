package sg.com.rsin.enums;

public enum StatusCode {
	Pending("待处理"),
	Complete("已完成");
	
	private final String description;

	StatusCode (String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
}
