package sg.com.rsin.enums;

public enum DocumentTypeCode {
	TYPE1 ("First Director Meeting Resolution"),
	TYPE2 ("Secretary Agreement"),
	TYPE3 ("ANNEX B - Notice for Controllers"),
	TYPE4 ("Application of Shares"),
	TYPE5 ("Client Acceptance Form"),
	TYPE6 ("Form 45 / 201"),
	TYPE7 ("Share Certificate"),
	TYPE8 ("Nominee's+Dir's+Authrn_Final");
	
	private final String description;

	DocumentTypeCode (String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
}
