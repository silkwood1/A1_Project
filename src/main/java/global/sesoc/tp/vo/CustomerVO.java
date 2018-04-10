package global.sesoc.tp.vo;

public class CustomerVO {
	private int customerDiv;
	private int customerNo;
	private String customerRegDate;
	private String customerBsn;
	private String customerComName;
	private String customerName;
	private int customerCellNo;
	private int customerOfficeNo;
	private String customerFaxNo;
	private String customerEmail;
	private String customerPost;
	private String customerAddr;
	private String customerHandler;
	private String customerNote;

	public CustomerVO() {

	}

	public CustomerVO(int customerDiv, int customerNo, String customerRegDate, String customerBsn,
			String customerComName, String customerName, int customerCellNo, int customerOfficeNo, String customerFaxNo,
			String customerEmail, String customerPost, String customerAddr, String customerHandler,
			String customerNote) {
		super();
		this.customerDiv = customerDiv;
		this.customerNo = customerNo;
		this.customerRegDate = customerRegDate;
		this.customerBsn = customerBsn;
		this.customerComName = customerComName;
		this.customerName = customerName;
		this.customerCellNo = customerCellNo;
		this.customerOfficeNo = customerOfficeNo;
		this.customerFaxNo = customerFaxNo;
		this.customerEmail = customerEmail;
		this.customerPost = customerPost;
		this.customerAddr = customerAddr;
		this.customerHandler = customerHandler;
		this.customerNote = customerNote;
	}

	public int getCustomerDiv() {
		return customerDiv;
	}

	public void setCustomerDiv(int customerDiv) {
		this.customerDiv = customerDiv;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerRegDate() {
		return customerRegDate;
	}

	public void setCustomerRegDate(String customerRegDate) {
		this.customerRegDate = customerRegDate;
	}

	public String getCustomerBsn() {
		return customerBsn;
	}

	public void setCustomerBsn(String customerBsn) {
		this.customerBsn = customerBsn;
	}

	public String getCustomerComName() {
		return customerComName;
	}

	public void setCustomerComName(String customerComName) {
		this.customerComName = customerComName;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public int getCustomerCellNo() {
		return customerCellNo;
	}

	public void setCustomerCellNo(int customerCellNo) {
		this.customerCellNo = customerCellNo;
	}

	public int getCustomerOfficeNo() {
		return customerOfficeNo;
	}

	public void setCustomerOfficeNo(int customerOfficeNo) {
		this.customerOfficeNo = customerOfficeNo;
	}

	public String getCustomerFaxNo() {
		return customerFaxNo;
	}

	public void setCustomerFaxNo(String customerFaxNo) {
		this.customerFaxNo = customerFaxNo;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPost() {
		return customerPost;
	}

	public void setCustomerPost(String customerPost) {
		this.customerPost = customerPost;
	}

	public String getCustomerAddr() {
		return customerAddr;
	}

	public void setCustomerAddr(String customerAddr) {
		this.customerAddr = customerAddr;
	}

	public String getCustomerHandler() {
		return customerHandler;
	}

	public void setCustomerHandler(String customerHandler) {
		this.customerHandler = customerHandler;
	}

	public String getCustomerNote() {
		return customerNote;
	}

	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}

	@Override
	public String toString() {
		return "CustomerVO [customerDiv=" + customerDiv + ", customerNo=" + customerNo + ", customerRegDate="
				+ customerRegDate + ", customerBsn=" + customerBsn + ", customerComName=" + customerComName
				+ ", customerName=" + customerName + ", customerCellNo=" + customerCellNo + ", customerOfficeNo="
				+ customerOfficeNo + ", customerFaxNo=" + customerFaxNo + ", customerEmail=" + customerEmail
				+ ", customerPost=" + customerPost + ", customerAddr=" + customerAddr + ", customerHandler="
				+ customerHandler + ", customerNote=" + customerNote + "]";
	}
	

}
