package global.sesoc.tp.vo;

public class TradeVO {

	private String 	userBn;   	// 유저 사업자번호
	private	int 	tradeNo; 	// 번호
	private	String	tradeDiv;  	// 거래구분
	private String 	customerNo;	// 거래처
	private	String 	itemCode;	// 품목
	private	String 	tradeQuantity;	// 거래량
	private String		tradePayable;	// 미지급금
	private String 	tradeReceivable;	// 미수금
	private String 	tradeTotal;		// 총액
	private String 	paymentDiv;		// 결제수단 분휴 
	private String 	tradeIndate;	// 거래 일자
	private String 	tradeNote;		// 구분코
	private int tradeStatus;		// 거래상태 (0, 1)
	
	public TradeVO() {}

	public TradeVO(String userBn, int tradeNo, String tradeDiv, String customerNo, String itemCode, String tradeQuantity,
			String tradePayable, String tradeReceivable, String tradeTotal, String paymentDiv, String tradeIndate,
			String tradeNote, int tradeStatus) {
		super();
		this.userBn = userBn;
		this.tradeNo = tradeNo;
		this.tradeDiv = tradeDiv;
		this.customerNo = customerNo;
		this.itemCode = itemCode;
		this.tradeQuantity = tradeQuantity;
		this.tradePayable = tradePayable;
		this.tradeReceivable = tradeReceivable;
		this.tradeTotal = tradeTotal;
		this.paymentDiv = paymentDiv;
		this.tradeIndate = tradeIndate;
		this.tradeNote = tradeNote;
		this.tradeStatus = tradeStatus;
	}
	
	public String getUserBn() {
		return userBn;
	}
	public void setUserBn(String userBn) {
		this.userBn = userBn;
	}
	public int getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}
	public String getTradeDiv() {
		return tradeDiv;
	}
	public void setTradeDiv(String tradeDiv) {
		this.tradeDiv = tradeDiv;
	}
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getTradeQuantity() {
		return tradeQuantity;
	}
	public void setTradeQuantity(String tradeQuantity) {
		this.tradeQuantity = tradeQuantity;
	}
	public String getTradePayable() {
		return tradePayable;
	}
	public void setTradePayable(String tradePayable) {
		this.tradePayable = tradePayable;
	}
	public String getTradeReceivable() {
		return tradeReceivable;
	}
	public void setTradeReceivable(String tradeReceivable) {
		this.tradeReceivable = tradeReceivable;
	}
	public String getTradeTotal() {
		return tradeTotal;
	}
	public void setTradeTotal(String tradeTotal) {
		this.tradeTotal = tradeTotal;
	}
	public String getPaymentDiv() {
		return paymentDiv;
	}
	public void setPaymentDiv(String paymentDiv) {
		this.paymentDiv = paymentDiv;
	}
	public String getTradeIndate() {
		return tradeIndate;
	}
	public void setTradeIndate(String tradeIndate) {
		this.tradeIndate = tradeIndate;
	}
	public String getTradeNote() {
		return tradeNote;
	}
	public void setTradeNote(String tradeNote) {
		this.tradeNote = tradeNote;
	}
	
	public int getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(int tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	
	@Override
	public String toString() {
		return "TradeVO [userBn=" + userBn + ", tradeNo=" + tradeNo + ", tradeDiv=" + tradeDiv + ", customerNo="
				+ customerNo + ", itemCode=" + itemCode + ", tradeQuantity=" + tradeQuantity + ", tradePayable="
				+ tradePayable + ", tradeReceivable=" + tradeReceivable + ", tradeTotal=" + tradeTotal + ", paymentDiv="
				+ paymentDiv + ", tradeIndate=" + tradeIndate + ", tradeNote=" + tradeNote + ", tradeStatus = " + tradeStatus + "]";
	}
	
	
	

	
}
