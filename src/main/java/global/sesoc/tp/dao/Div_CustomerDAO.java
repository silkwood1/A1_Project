package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * 고객분류 관련 DAO
 */
@Repository
public class Div_CustomerDAO {
	@Autowired
	SqlSession sqlSession;

	
}
