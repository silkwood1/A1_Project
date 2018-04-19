package global.sesoc.tp.vo;

public class CustomerVO {
	private String userBn; 				//유저 사업자번호
	private int customerNo;				//고객 번호
	private String customerDiv;			//고객 분류
	private String customerBn;			//사업자번호
	private String customerCname;		//상호명
	private String customerName;		//대표자명
	private String customerCellNo;			//휴대전화번호
	private String customerOfficeNo;		//사무실 전화번호
	private String customerFaxNo;		//팩스번호
	private String customerEmail;		//이메일 주소
	private String customerZipcode;		//우편번호
	private String customerAddress;		//상세주소
	private String customerIndate;		//등록 일자
	private String rankDiv;				//고객 등급
	private String inCharge;				//담당자
	private String customerNote;		//비고
	
	public CustomerVO() {}

	public CustomerVO(String userBn, int customerNo, String customerDiv, String customerBn, String customerCname,
			String customerName, String customerCellNo, String customerOfficeNo, String customerFaxNo,
			String customerEmail, String customerZipcode, String customerAddress, String customerIndate, String rankDiv,
			String inCharge, String customerNote) {
		this.userBn = userBn;
		this.customerNo = customerNo;
		this.customerDiv = customerDiv;
		this.customerBn = customerBn;
		this.customerCname = customerCname;
		this.customerName = customerName;
		this.customerCellNo = customerCellNo;
		this.customerOfficeNo = customerOfficeNo;
		this.customerFaxNo = customerFaxNo;
		this.customerEmail = customerEmail;
		this.customerZipcode = customerZipcode;
		this.customerAddress = customerAddress;
		this.customerIndate = customerIndate;
		this.rankDiv = rankDiv;
		this.inCharge = inCharge;
		this.customerNote = customerNote;
	}

	public String getUserBn() {
		return userBn;
	}

	public void setUserBn(String userBn) {
		this.userBn = userBn;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerDiv() {
		return customerDiv;
	}

	public void setCustomerDiv(String customerDiv) {
		this.customerDiv = customerDiv;
	}

	public String getCustomerBn() {
		return customerBn;
	}

	public void setCustomerBn(String customerBn) {
		this.customerBn = customerBn;
	}

	public String getCustomerCname() {
		return customerCname;
	}

	public void setCustomerCname(String customerCname) {
		this.customerCname = customerCname;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerCellNo() {
		return customerCellNo;
	}

	public void setCustomerCellNo(String customerCellNo) {
		this.customerCellNo = customerCellNo;
	}

	public String getCustomerOfficeNo() {
		return customerOfficeNo;
	}

	public void setCustomerOfficeNo(String customerOfficeNo) {
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

	public String getCustomerZipcode() {
		return customerZipcode;
	}

	public void setCustomerZipcode(String customerZipcode) {
		this.customerZipcode = customerZipcode;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerIndate() {
		return customerIndate;
	}

	public void setCustomerIndate(String customerIndate) {
		this.customerIndate = customerIndate;
	}

	public String getRankDiv() {
		return rankDiv;
	}

	public void setRankDiv(String rankDiv) {
		this.rankDiv = rankDiv;
	}

	public String getInCharge() {
		return inCharge;
	}

	public void setInCharge(String inCharge) {
		this.inCharge = inCharge;
	}

	public String getCustomerNote() {
		return customerNote;
	}

	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}

	@Override
	public String toString() {
		return "CustomerVO [userBn=" + userBn + ", customerNo=" + customerNo + ", customerDiv=" + customerDiv
				+ ", customerBn=" + customerBn + ", customerCname=" + customerCname + ", customerName=" + customerName
				+ ", customerCellNo=" + customerCellNo + ", customerOfficeNo=" + customerOfficeNo + ", customerFaxNo="
				+ customerFaxNo + ", customerEmail=" + customerEmail + ", customerZipcode=" + customerZipcode
				+ ", customerAddress=" + customerAddress + ", customerIndate=" + customerIndate + ", rankDiv=" + rankDiv
				+ ", incharge=" + inCharge + ", customerNote=" + customerNote + "]";
	}

	

}
