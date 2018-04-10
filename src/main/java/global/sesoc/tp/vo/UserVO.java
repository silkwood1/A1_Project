package global.sesoc.tp.vo;

public class UserVO {
	private String userId;
	private String userPassword;
	private String userBn;				//사업자 등록번호
	private String userCname;			//회사명
	private String userName;			//대표자명
	private String userCellNo;			//핸드폰번호
	private String userOfficeNo;		//사무실번호
	private String userFaxNo;			//팩스번호
	private String userEmail;			//이메일 주소
	private String userZipcode;			//우편번호
	private String userAddress;		//주소
	
	public UserVO() {}	//기본 생성자
	
	//제약조건이 걸려있는 친구들의 생성자
	public UserVO(String userId, String userPassword, String userBn, String userCname, String userName, String userCellNo, String userEmail,
			String userZipcode, String userAddress) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userBn = userBn;
		this.userCname = userCname;
		this.userName = userName;
		this.userCellNo = userCellNo;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress = userAddress;
	}
	
	//전체 생성자
	public UserVO(String userId, String userPassword, String userBn, String userCname, String userName,
			String userCellNo, String userOfficeNo, String userFaxNo, String userEmail, String userZipcode,
			String userAddress) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userBn = userBn;
		this.userCname = userCname;
		this.userName = userName;
		this.userCellNo = userCellNo;
		this.userOfficeNo = userOfficeNo;
		this.userFaxNo = userFaxNo;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress = userAddress;
	}
	
	//아이디 찾기용
	public UserVO(String userName, String userEmail) {
		this.userName = userName;
		this.userEmail = userEmail;
	}
	
	//비밀번호 찾기용
	public UserVO(String userId, String userName, String userEmail) {
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
	}
	
	public String getUserBn() {
		return userBn;
	}


	public void setUserBn(String userBn) {
		this.userBn = userBn;
	}

	public String getUserCname() {
		return userCname;
	}

	public void setUserCname(String userCname) {
		this.userCname = userCname;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCellNo() {
		return userCellNo;
	}

	public void setUserCellNo(String userCellNo) {
		this.userCellNo = userCellNo;
	}

	public String getUserOfficeNo() {
		return userOfficeNo;
	}

	public void setUserOfficeNo(String userOfficeNo) {
		this.userOfficeNo = userOfficeNo;
	}

	public String getUserFaxNo() {
		return userFaxNo;
	}

	public void setUserFaxNo(String userFaxNo) {
		this.userFaxNo = userFaxNo;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPassword=" + userPassword + ", userBn=" + userBn + ", userCname="
				+ userCname + ", userName=" + userName + ", userCellNo=" + userCellNo + ", userOfficeNo=" + userOfficeNo
				+ ", userFaxNo=" + userFaxNo + ", userEmail=" + userEmail + ", userZipcode=" + userZipcode
				+ ", userAddress=" + userAddress + "]";
	}
	
}
