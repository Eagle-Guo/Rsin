package sg.com.rsin.vo;

public class OnlineSignatureVO {
	private String userName;
	private String address;
	private String shareholderAndStock;
	private boolean bDirector;
	private boolean bShareholder;
	private boolean bNamedDirector;
	private String allSignatureStatus;

	public OnlineSignatureVO() {
	}

	public OnlineSignatureVO(String userName, String address, String shareholderAndStock, 
			boolean bDirector, boolean bShareholder, boolean bNamedDirector, String allSignatureStatus) {
		super();
		this.userName = userName;
		this.address = address;
		this.shareholderAndStock = shareholderAndStock;
		this.bDirector = bDirector;
		this.bShareholder = bShareholder;
		this.bNamedDirector = bNamedDirector;
		this.allSignatureStatus = allSignatureStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShareholderAndStock() {
		return shareholderAndStock;
	}
	public void setShareholderAndStock(String shareholderAndStock) {
		this.shareholderAndStock = shareholderAndStock;
	}
	public boolean isbDirector() {
		return bDirector;
	}
	public void setbDirector(boolean bDirector) {
		this.bDirector = bDirector;
	}
	public boolean isbShareholder() {
		return bShareholder;
	}
	public void setbShareholder(boolean bShareholder) {
		this.bShareholder = bShareholder;
	}
	public boolean isbNamedDirector() {
		return bNamedDirector;
	}
	public void setbNamedDirector(boolean bNamedDirector) {
		this.bNamedDirector = bNamedDirector;
	}
	public String getAllSignatureStatus() {
		return allSignatureStatus;
	}
	public void setAllSignatureStatus(String allSignatureStatus) {
		this.allSignatureStatus = allSignatureStatus;
	}
}
