package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.Div_BankVO;

/*
 * 은행 관련 DAO
 */
@Repository
public class Div_BankDAO {
	@Autowired
	SqlSession sqlSession;

	// 저장
	public int insert_bankDiv(Div_BankVO bank) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.insert_bankDiv(bank);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	// 수정
	public int update_bankDiv(Div_BankVO bank) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.update_bankDiv(bank);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	
	// 삭제
	public int delete_bankDiv(Div_BankVO bank) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.delete_bankDiv(bank);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	
	// 중복찾기
	public Div_BankVO select_bankDiv(Div_BankVO bank) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.select_bankDiv(bank);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

}
