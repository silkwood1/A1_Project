package global.sesoc.tp.vo;

public class Div_PositionVO {

	private int positionDiv;		// 직급 구분
	private String positionExp;		// 설명
	private int positionLosal;		// 최소 급여
	
	// 기본 생성자
	public Div_PositionVO() {}

	// not null 생성자
	public Div_PositionVO(int positionDiv, String positionExp) {
		this.positionDiv = positionDiv;
		this.positionExp = positionExp;
	}

	// 전체 생성자
	public Div_PositionVO(int positionDiv, String positionExp, int positionLosal) {
		this.positionDiv = positionDiv;
		this.positionExp = positionExp;
		this.positionLosal = positionLosal;
	}

	// G & S
	public int getPositionDiv() {
		return positionDiv;
	}

	public void setPositionDiv(int positionDiv) {
		this.positionDiv = positionDiv;
	}

	public String getPositionExp() {
		return positionExp;
	}

	public void setPositionExp(String positionExp) {
		this.positionExp = positionExp;
	}

	public int getPositionLosal() {
		return positionLosal;
	}

	public void setPositionLosal(int positionLosal) {
		this.positionLosal = positionLosal;
	}

	@Override
	public String toString() {
		return "PositionVO [positionDiv=" + positionDiv + ", positionExp=" + positionExp + ", positionLosal="
				+ positionLosal + "]";
	}
	
}
