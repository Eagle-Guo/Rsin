package sg.com.rsin.enums;

public enum TimeLineType {
	TYPE_1 ("年审"),
	TYPE_2 ("ECI申报"),
	TYPE_3 ("消费税"),
	TYPE_4 ("所得税报税"),
	TYPE_5 ("所得锐缴税"),
	TYPE_6 ("其他");
	
	private final String description;

	TimeLineType (String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getDisplayValue() {
		return getDescription();
	}
}
