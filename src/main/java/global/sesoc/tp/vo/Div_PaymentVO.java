package global.sesoc.tp.vo;

public class Div_PaymentVO {

	private int paymentDiv;			// 결제분류
	private String paymentExp;		// 결제분류 설명
	
	// 기본 생성자
	public Div_PaymentVO() {}

	// 전체 생성자
	public Div_PaymentVO(int paymentDiv, String paymentExp) {
		this.paymentDiv = paymentDiv;
		this.paymentExp = paymentExp;
	}

	// G & S
	public int getPaymentDiv() {
		return paymentDiv;
	}

	public void setPaymentDiv(int paymentDiv) {
		this.paymentDiv = paymentDiv;
	}

	public String getPaymentExp() {
		return paymentExp;
	}

	public void setPaymentExp(String paymentExp) {
		this.paymentExp = paymentExp;
	}

	@Override
	public String toString() {
		return "PaymentVO [paymentDiv=" + paymentDiv + ", paymentExp=" + paymentExp + "]";
	}
	
	
}
