package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_DeptVO;

/**
 * 부서구분
 */
public interface Div_DeptMapper {
	// 저장
	public int insert_deptDiv(Div_DeptVO dept);
	// 수정
	public int update_deptDiv(Div_DeptVO dept);
	// 삭제
	public int delete_deptDiv(Div_DeptVO dept);
	// 중복 찾기
	public Div_DeptVO select_deptDiv(String deptExp);

}
