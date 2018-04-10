package global.sesoc.tp.vo;

public class Div_RankVO {

	public int rankDiv;					// 회원등급구분
	public String rankExp;				// 회원등급 설명
	
	// 기본 생성자
	public Div_RankVO() {}

	// 전체 생성자
	public Div_RankVO(int rankDiv, String rankExp) {
		this.rankDiv = rankDiv;
		this.rankExp = rankExp;
	}

	// G & S
	public int getRankDiv() {
		return rankDiv;
	}

	public void setRankDiv(int rankDiv) {
		this.rankDiv = rankDiv;
	}

	public String getRankExp() {
		return rankExp;
	}

	public void setRankExp(String rankExp) {
		this.rankExp = rankExp;
	}

	@Override
	public String toString() {
		return "RankVO [rankDiv=" + rankDiv + ", rankExp=" + rankExp + "]";
	}
	
	
	
}
