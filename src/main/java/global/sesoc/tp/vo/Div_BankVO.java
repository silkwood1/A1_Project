package global.sesoc.tp.vo;

public class Div_BankVO {

	private int bankDiv;			// 은행구분
	private String bankExp;			// 은행 설명
	
	// 기본 생성자
	public Div_BankVO() {}

	// 전체 생성자
	public Div_BankVO(int bankDiv, String bankExp) {
		this.bankDiv = bankDiv;
		this.bankExp = bankExp;
	}

	// G & S
	public int getBankDiv() {
		return bankDiv;
	}

	public void setBankDiv(int bankDiv) {
		this.bankDiv = bankDiv;
	}

	public String getBankExp() {
		return bankExp;
	}

	public void setBankExp(String bankExp) {
		this.bankExp = bankExp;
	}

	@Override
	public String toString() {
		return "BankVO [bankDiv=" + bankDiv + ", bankExp=" + bankExp + "]";
	}

}
