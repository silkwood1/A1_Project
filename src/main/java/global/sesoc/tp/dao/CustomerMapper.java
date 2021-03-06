package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.UserVO;

public interface CustomerMapper {

	public ArrayList<CustomerVO> customerList(String userBn);
	// 거래처 등록
	public int insertCustomer(CustomerVO customer);
	// 특정 거래처 조회
	public CustomerVO selectCustomer(int customerNo);
	// 거래처 수정
	public int updateCustomer(CustomerVO customer);
	// 거래서 삭제
	public int deleteCustomer(int customerNo);
	//거래처 정보 가져가기
	public CustomerVO get_user(String cusno);
	//
	CustomerVO readCustomer(int customerNo);

}
