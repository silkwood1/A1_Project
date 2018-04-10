package global.sesoc.tp.vo;

public class StaffVO {

	private String staffId;
	private int staffNo;			// 사원 번호
	private int deptDiv;			// 부서 구분
	private int positionDiv;		// 직급 구분
	private String staffName;		// 사원명
	private String staffIdno;		// 사원 주민등록번호
	private String staffCellNo;		// 사원 휴대전화번호
	private String staffTellNo;		// 집전화
	private String staffEmail;		// 이메일
	private String staffZipcode;	// 우편주소
	private String staffAddress;	// 상세주소
	private int staffSalary;		// 월급
	private int bankDiv;			// 은행구분
	private String staffAccountNo;	// 사원 계좌번호
	private String staffNote;		// 비고

	// 기본 생성자
	public StaffVO() {}

	// staff - not null 생성자
	public StaffVO(int staffNo, String staffName, String staffIdno, String staffCellNo) {
		this.staffNo = staffNo;
		this.staffName = staffName;
		this.staffIdno = staffIdno;
		this.staffCellNo = staffCellNo;
	}

	// staff - 전체 생성자
	public StaffVO(int staffNo, int deptDiv, int positionDiv, String staffName, String staffIdno,
			String staffCellNo, String staffTellNo, String staffEmail, String staffZipcode, String staffAddress,
			int staffSalary, int bankDiv, String staffAccountNo, String staffNote) {
		this.staffNo = staffNo;
		this.deptDiv = deptDiv;
		this.positionDiv = positionDiv;
		this.staffName = staffName;
		this.staffIdno = staffIdno;
		this.staffCellNo = staffCellNo;
		this.staffTellNo = staffTellNo;
		this.staffEmail = staffEmail;
		this.staffZipcode = staffZipcode;
		this.staffAddress = staffAddress;
		this.staffSalary = staffSalary;
		this.bankDiv = bankDiv;
		this.staffAccountNo = staffAccountNo;
		this.staffNote = staffNote;
	}

	// G & S
	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public int getDeptDiv() {
		return deptDiv;
	}

	public void setDeptDiv(int deptDiv) {
		this.deptDiv = deptDiv;
	}

	public int getPositionDiv() {
		return positionDiv;
	}

	public void setPositionDiv(int positionDiv) {
		this.positionDiv = positionDiv;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffIdno() {
		return staffIdno;
	}

	public void setStaffIdno(String staffIdno) {
		this.staffIdno = staffIdno;
	}

	public String getStaffCellNo() {
		return staffCellNo;
	}

	public void setStaffCellNo(String staffCellNo) {
		this.staffCellNo = staffCellNo;
	}

	public String getStaffTellNo() {
		return staffTellNo;
	}

	public void setStaffTellNo(String staffTellNo) {
		this.staffTellNo = staffTellNo;
	}

	public String getStaffEmail() {
		return staffEmail;
	}

	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}

	public String getStaffZipcode() {
		return staffZipcode;
	}

	public void setStaffZipcode(String staffZipcode) {
		this.staffZipcode = staffZipcode;
	}

	public String getStaffAddress() {
		return staffAddress;
	}

	public void setStaffAddress(String staffAddress) {
		this.staffAddress = staffAddress;
	}

	public int getStaffSalary() {
		return staffSalary;
	}

	public void setStaffSalary(int staffSalary) {
		this.staffSalary = staffSalary;
	}

	public int getBankDiv() {
		return bankDiv;
	}

	public void setBankDiv(int bankDiv) {
		this.bankDiv = bankDiv;
	}

	public String getStaffAccountNo() {
		return staffAccountNo;
	}

	public void setStaffAccountNo(String staffAccountNo) {
		this.staffAccountNo = staffAccountNo;
	}

	public String getStaffNote() {
		return staffNote;
	}

	public void setStaffNote(String staffNote) {
		this.staffNote = staffNote;
	}

	@Override
	public String toString() {
		return "StaffVO [staffNo=" + staffNo + ", deptDiv="
				+ deptDiv + ", positionDiv=" + positionDiv + ", staffName=" + staffName + ", staffIdno=" + staffIdno
				+ ", staffCellNo=" + staffCellNo + ", staffTellNo=" + staffTellNo + ", staffEmail=" + staffEmail
				+ ", staffZipcode=" + staffZipcode + ", staffAddress=" + staffAddress + ", staffSalary=" + staffSalary
				+ ", bankDiv=" + bankDiv + ", staffAccountNo=" + staffAccountNo + ", staffNote=" + staffNote + "]";
	}
	
	

}
