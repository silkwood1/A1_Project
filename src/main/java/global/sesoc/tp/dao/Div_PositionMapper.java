package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_PositionVO;

/**
 * 직급 구분
 */
public interface Div_PositionMapper {
	// 저장
	public int insert_positionDiv(Div_PositionVO position);
	// 수정
	public int update_positionDiv(Div_PositionVO bank);
	// 삭제
	public int delete_positionDiv(Div_PositionVO bank);
	// 중복찾기
	public Div_PositionVO select_positionDiv(String positionExp);

}
