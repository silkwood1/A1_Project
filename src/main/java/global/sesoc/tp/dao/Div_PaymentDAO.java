package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.Div_PaymentVO;


/*
 * 결제수단 관련 DAO
 */
@Repository
public class Div_PaymentDAO {
	@Autowired
	SqlSession sqlSession;

	// 저장
	public int insert_paymentDiv(Div_PaymentVO payment) {
		int a = 0;
		Div_PaymentMapper mapper = sqlSession.getMapper(Div_PaymentMapper.class);
		try {
			a = mapper.insert_paymentDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 수정
	public int update_paymentDiv(Div_PaymentVO payment) {
		int a = 0;
		Div_PaymentMapper mapper = sqlSession.getMapper(Div_PaymentMapper.class);
		try {
			a = mapper.update_paymentDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 삭제
	public int delete_paymentDiv(Div_PaymentVO payment) {
		int a = 0;
		Div_PaymentMapper mapper = sqlSession.getMapper(Div_PaymentMapper.class);
		try {
			a = mapper.delete_paymentDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 중복찾기
	public Div_PaymentVO select_paymentDiv(Div_PaymentVO payment) {
		int a = 0;
		Div_PaymentMapper mapper = sqlSession.getMapper(Div_PaymentMapper.class);
		try {
			a = mapper.select_paymentDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	
}
