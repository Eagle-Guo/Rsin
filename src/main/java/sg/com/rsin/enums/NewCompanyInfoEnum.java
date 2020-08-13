package sg.com.rsin.enums;

public enum NewCompanyInfoEnum {
	SERVICES("services"),
	COMPANYINFOS("companyInfos"),
	SHAREHOLDERINFOS("shareholderInfos");
	
	private final String description;

	NewCompanyInfoEnum (String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
}
