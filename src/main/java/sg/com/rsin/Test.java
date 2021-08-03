package sg.com.rsin;

public class Test {

	public enum Programming {
		TYPE_1 ("年审"),
		TYPE_2 ("ECI申报"),
		TYPE_3 ("消费税申报"),
		TYPE_4 ("所得税报税"),
		TYPE_5 ("所得税缴税"),
		TYPE_6 ("其他");
		
		private final String description;

		Programming (String description) {
			this.description = description;
		}
		
		public String getDescription() {
			return description;
		}

		public String getDisplayValue() {
			return getDescription();
		}
	}
	
	public static void main(String[] args) {
		for (Programming obj : Programming.values()) {
            System.out.println(obj.description);
        }
	}

}
