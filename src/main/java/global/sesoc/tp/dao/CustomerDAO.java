package global.sesoc.tp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.CustomerVO;



@Repository
public class CustomerDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<CustomerVO> customerList(CustomerVO cvo){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		ArrayList<CustomerVO> customerList = new ArrayList<CustomerVO>();
		try {
			customerList = mapper.customerList(cvo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return customerList;
		
	}
	
	
//	public ArrayList<UserVO> loadJa(int dif) {
//		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//		ArrayList<UserVO> j = new ArrayList<Japanese>();
//		try{
//			j = mapper.loadJa(dif);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return j;
//	}	
	
}
