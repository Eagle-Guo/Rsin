package sg.com.rsin.vo;

public class OnlineSignatureVO {
	private String userName;
	private String address;
	private String shareholderAndStock;
	private boolean isDirector;
	private boolean isShareholder;
	private boolean isNamedDirector;
	private boolean allSignatureFinished;

	public OnlineSignatureVO() {
	}

	public OnlineSignatureVO(String userName, String address, String shareholderAndStock, 
			boolean isDirector, boolean isShareholder, boolean isNamedDirector, boolean allSignatureFinished) {
		super();
		this.userName = userName;
		this.address = address;
		this.shareholderAndStock = shareholderAndStock;
		this.isDirector = isDirector;
		this.isShareholder = isShareholder;
		this.isNamedDirector = isNamedDirector;
		this.allSignatureFinished = allSignatureFinished;
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
	public boolean isDirector() {
		return isDirector;
	}
	public void setDirector(boolean isDirector) {
		this.isDirector = isDirector;
	}
	public boolean isShareholder() {
		return isShareholder;
	}
	public void setShareholder(boolean isShareholder) {
		this.isShareholder = isShareholder;
	}
	public boolean isNamedDirector() {
		return isNamedDirector;
	}
	public void setNamedDirector(boolean isNamedDirector) {
		this.isNamedDirector = isNamedDirector;
	}
	public boolean isAllSignatureFinished() {
		return allSignatureFinished;
	}
	public void setAllSignatureFinished(boolean allSignatureFinished) {
		this.allSignatureFinished = allSignatureFinished;
	}
}
