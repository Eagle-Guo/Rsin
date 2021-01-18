package sg.com.rsin.enums;

public enum DocumentTypeCode {
	TYPE_COM_1 ("First Director Meeting Resolution"),
	TYPE_COM_2 ("Secretary Agreement"),
	TYPE_COM_3 ("ANNEX B - Notice for Controllers"),
	TYPE_COM_4 ("Application of Shares"),
	TYPE_COM_5 ("Client Acceptance Form"),
	TYPE_COM_6 ("Form 45 / 201"),
	TYPE_COM_7 ("Share Certificate"),
	TYPE_COM_8 ("Nominee's+Dir's+Authrn_Final"),

	TYPE_COM_9 ("Constitution of Company"),
	TYPE_COM_10 ("Attached AML/CFT Report"),
	TYPE_COM_11 ("Certificate of Incorporation"),
	TYPE_COM_12 ("Risk Assessment"),
	TYPE_COM_13 ("Risk Assessment Checklist"),
	TYPE_COM_14 ("Company info"),
	TYPE_COM_15 ("Register of Charges"),
	TYPE_COM_16 ("Register of Secretary"),
	
	TYPE_PER_1 ("IC Front"),
	TYPE_PER_2 ("IC Back"),
	TYPE_PER_3 ("Passport"),
	TYPE_PER_4 ("Chinese IC"),
	TYPE_PER_5 ("Resident Proof"),
	TYPE_PER_6 ("Selfie With Passport");
	
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
