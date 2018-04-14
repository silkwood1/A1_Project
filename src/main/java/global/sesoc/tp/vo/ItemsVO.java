package global.sesoc.tp.vo;

public class ItemsVO {
	private int itemNum;
	private String userBn;	//유저 사업자번호
	private String itemDiv; // 품목구분
	private String itemExp; // 품목구분 설명
	private String itemCode; // 품목코드
	private String itemName; // 품목명
	private String itemPrice1; // 단위 원가(구매가)
	private String itemPrice2; // 단위 판매가
	private String itemQuantity; // 재고
	private String itemIndate;
	

	// 기본 생성자
	public ItemsVO() {
	}

	// tb_itemDiv 생성자
	public ItemsVO(String itemDiv, String itemExp) {
		this.itemDiv = itemDiv;
		this.itemExp = itemExp;
	}

	// items - not null 생성자
	public ItemsVO(String itemDiv, String itemCode, String itemName) {
		this.itemDiv = itemDiv;
		this.itemCode = itemCode;
		this.itemName = itemName;
	}

	// items - 전체 생성자
	public ItemsVO(String userBn, String itemDiv, String itemCode, String itemName, String itemPrice1, String itemPrice2,
			String itemQuantity) {
		this.userBn = userBn;
		this.itemDiv = itemDiv;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemPrice1 = itemPrice1;
		this.itemPrice2 = itemPrice2;
		this.itemQuantity = itemQuantity;
	}

	// G & S
	public String getItemDiv() {
		return itemDiv;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemIndate() {
		return itemIndate;
	}

	public String getUserBn() {
		return userBn;
	}

	public void setUserBn(String userBn) {
		this.userBn = userBn;
	}

	public void setItemIndate(String itemIndate) {
		this.itemIndate = itemIndate;
	}

	public void setItemDiv(String itemDiv) {
		this.itemDiv = itemDiv;
	}

	public String getItemExp() {
		return itemExp;
	}

	public void setItemExp(String itemExp) {
		this.itemExp = itemExp;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemPrice1() {
		return itemPrice1;
	}

	public void setItemPrice1(String itemPrice1) {
		this.itemPrice1 = itemPrice1;
	}

	public String getItemPrice2() {
		return itemPrice2;
	}

	public void setItemPrice2(String itemPrice2) {
		this.itemPrice2 = itemPrice2;
	}

	public String getItemQuantity() {
		return itemQuantity;
	}

	public void setItemQuantity(String itemQuantity) {
		this.itemQuantity = itemQuantity;
	}

	@Override
	public String toString() {
		return "ItemsVO [userBn=" + userBn + ", itemDiv=" + itemDiv + ", itemExp=" + itemExp + ", itemCode=" + itemCode
				+ ", itemName=" + itemName + ", itemPrice1=" + itemPrice1 + ", itemPrice2=" + itemPrice2
				+ ", itemQuantity=" + itemQuantity + ", itemIndate=" + itemIndate + "]";
	}

}
