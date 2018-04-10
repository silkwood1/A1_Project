package global.sesoc.tp.vo;

public class Div_CustomerVO {

	public int customerDiv;				// 고객분류
	public String customerExp;			// 고객분류 설명
	
	// 기본 생성자
	public Div_CustomerVO() {}

	// 전체 생성자
	public Div_CustomerVO(int customerDiv, String customerExp) {
		this.customerDiv = customerDiv;
		this.customerExp = customerExp;
	}

	// G & S
	public int getCustomerDiv() {
		return customerDiv;
	}

	public void setCustomerDiv(int customerDiv) {
		this.customerDiv = customerDiv;
	}

	public String getCustomerExp() {
		return customerExp;
	}

	public void setCustomerExp(String customerExp) {
		this.customerExp = customerExp;
	}

	@Override
	public String toString() {
		return "Div_CustomerVO [customerDiv=" + customerDiv + ", customerExp=" + customerExp + "]";
	}
	
	
	
	
}
