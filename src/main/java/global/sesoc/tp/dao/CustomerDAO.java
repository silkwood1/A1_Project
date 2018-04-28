package global.sesoc.tp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.UserVO;



@Repository
public class CustomerDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<CustomerVO> customerList(String userBn){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		ArrayList<CustomerVO> customerList = new ArrayList<CustomerVO>();
		try {
			customerList = mapper.customerList(userBn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return customerList;
		
	}
	
	// 등록
	public int insertCustomer(CustomerVO customer) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = 0;
		
		try {
			result = mapper.insertCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 선택
	public CustomerVO selectCustomer(int customerNo) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		CustomerVO result = null;
		
		try {
			result = mapper.selectCustomer(customerNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 수정
	public int updateCustomer(CustomerVO customer) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = 0;
		
		try {
			result = mapper.updateCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 삭제
	public int deleteCustomer(int customerNo) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = 0;
		
		try {
			result = mapper.deleteCustomer(customerNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public CustomerVO get_user(String cusno) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		CustomerVO user = new CustomerVO();
		
		try {
			user = mapper.get_user(cusno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
}
