package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * 거래 관련 DAO
 */
@Repository
public class TradeDAO {
	@Autowired
	SqlSession sqlSession;

	
}