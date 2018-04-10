package global.sesoc.tp.vo;

public class TradeVO {
	private int tradeNo;			// 거래 일련번호
	private int tradeDiv;			// 거래분류
	private String tradeExp;		// 거래분류 설명
	private String itemCode;		// 품목코드
	private String customerBn;		// 고객 사업자번호
	private int tradeQuantity;		// 거래량
	private int paymentDiv;			// 결제수단
	private int tradePayable;		// 미지급금
	private int tradeReceivable;	// 미수금
	private int tradeTotal;			// 거래총액
	private String tradeNote;		// 비고

	// 기본 생성자
	public TradeVO() {}

	// tb_tradeDiv 생성자
	public TradeVO(int tradeDiv, String tradeExp) {
		this.tradeDiv = tradeDiv;
		this.tradeExp = tradeExp;
	}

	// trade - not null 생성자
	public TradeVO(int tradeNo, int tradeDiv, String itemCode, String customerBn, int tradeTotal) {
		this.tradeNo = tradeNo;
		this.tradeDiv = tradeDiv;
		this.itemCode = itemCode;
		this.customerBn = customerBn;
		this.tradeTotal = tradeTotal;
	}

	// trade - 전체 생성자
	public TradeVO( int tradeNo, int tradeDiv, String itemCode, String customerBn, int tradeQuantity, int paymentDiv,
			int tradePayable, int tradeReceivable, int tradeTotal, String tradeNote) {
		this.tradeNo = tradeNo;
		this.tradeDiv = tradeDiv;
		this.itemCode = itemCode;
		this.customerBn = customerBn;
		this.tradeQuantity = tradeQuantity;
		this.paymentDiv = paymentDiv;
		this.tradePayable = tradePayable;
		this.tradeReceivable = tradeReceivable;
		this.tradeTotal = tradeTotal;
		this.tradeNote = tradeNote;
	}

	// G & S
	public int getTradeDiv() {
		return tradeDiv;
	}

	public void setTradeDiv(int tradeDiv) {
		this.tradeDiv = tradeDiv;
	}

	public String getTradeExp() {
		return tradeExp;
	}

	public void setTradeExp(String tradeExp) {
		this.tradeExp = tradeExp;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getCustomerBn() {
		return customerBn;
	}

	public void setCustomerBn(String customerBn) {
		this.customerBn = customerBn;
	}

	public int getTradeQuantity() {
		return tradeQuantity;
	}

	public void setTradeQuantity(int tradeQuantity) {
		this.tradeQuantity = tradeQuantity;
	}

	public int getPaymentDiv() {
		return paymentDiv;
	}

	public void setPaymentDiv(int paymentDiv) {
		this.paymentDiv = paymentDiv;
	}

	public int getTradePayable() {
		return tradePayable;
	}

	public void setTradePayable(int tradePayable) {
		this.tradePayable = tradePayable;
	}

	public int getTradeReceivable() {
		return tradeReceivable;
	}

	public void setTradeReceivable(int tradeReceivable) {
		this.tradeReceivable = tradeReceivable;
	}

	public int getTradeTotal() {
		return tradeTotal;
	}

	public void setTradeTotal(int tradeTotal) {
		this.tradeTotal = tradeTotal;
	}

	public String getTradeNote() {
		return tradeNote;
	}

	public void setTradeNote(String tradeNote) {
		this.tradeNote = tradeNote;
	}

	@Override
	public String toString() {
		return "TradeVO [tradeNo=" + tradeNo + ", tradeDiv=" + tradeDiv + ", tradeExp=" + tradeExp + ", itemCode="
				+ itemCode + ", customerBn=" + customerBn + ", tradeQuantity=" + tradeQuantity + ", paymentDiv="
				+ paymentDiv + ", tradePayable=" + tradePayable + ", tradeReceivable=" + tradeReceivable
				+ ", tradeTotal=" + tradeTotal + ", tradeNote=" + tradeNote + "]";
	}
	
}
