package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_BankVO;

/**
 * 은행구분
 */
public interface Div_BankMapper {
	// 저장
	public int insert_bankDiv(Div_BankVO bank);
	// 수정
	public int update_bankDiv(Div_BankVO bank);
	// 삭제
	public int delete_bankDiv(Div_BankVO bank);
	// 중복찾기
	public Div_BankVO select_bankDiv(String bankExp);

}
