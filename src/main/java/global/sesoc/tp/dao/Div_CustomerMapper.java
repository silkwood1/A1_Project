package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_CustomerVO;

/**
 * 고객 분류
 */
public interface Div_CustomerMapper {
	// 저장
	public int insert_customerDiv(Div_CustomerVO cusdiv);
	// 수정
	public int update_customerDiv(Div_CustomerVO cusdiv);
	// 삭제
	public int delete_customerDiv(Div_CustomerVO cusdiv);
	// 중복 찾기
	public Div_CustomerVO select_customerDiv(String cusdivExp);

}
