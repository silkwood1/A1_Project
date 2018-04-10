package global.sesoc.tp.dao;

import global.sesoc.tp.vo.Div_PaymentVO;

/**
 * 결제수단
 */
public interface Div_PaymentMapper {
	// 저장
	public int insert_paymentDiv(Div_PaymentVO payment);
	// 수정
	public int update_paymentDiv(Div_PaymentVO payment);
	// 삭제
	public int delete_paymentDiv(Div_PaymentVO payment);
	// 중복 찾기
	public Div_PaymentVO select_paymentDiv(String paymentExp);
	
}
