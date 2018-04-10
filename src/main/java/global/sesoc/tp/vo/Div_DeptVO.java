package global.sesoc.tp.vo;

public class Div_DeptVO {

	private int deptDiv;			// 부서구분
	private String deptExp;			// 부서구분 설명
	
	// 기본 생성자
	public Div_DeptVO() {}

	// 전체 생성자
	public Div_DeptVO(int deptDiv, String deptExp) {
		this.deptDiv = deptDiv;
		this.deptExp = deptExp;
	}
	
	// G & S
	public int getDeptDiv() {
		return deptDiv;
	}

	public void setDeptDiv(int deptDiv) {
		this.deptDiv = deptDiv;
	}

	public String getDeptExp() {
		return deptExp;
	}

	public void setDeptExp(String deptExp) {
		this.deptExp = deptExp;
	}

	@Override
	public String toString() {
		return "DeptVO [deptDiv=" + deptDiv + ", deptExp=" + deptExp + "]";
	}
	
	
	
	
	
}
