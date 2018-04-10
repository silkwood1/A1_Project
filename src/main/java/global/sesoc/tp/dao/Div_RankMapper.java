package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_RankVO;

/**
 * 회원등급구분
 */
public interface Div_RankMapper {
	// 저장
	public int insert_rankDiv(Div_RankVO rank);
	// 수정
	public int update_rankDiv(Div_RankVO rank);
	// 삭제
	public int delete_rankDiv(Div_RankVO rank);
	// 중복 찾기
	public Div_RankVO select_deptDiv(String rankExp);

}
