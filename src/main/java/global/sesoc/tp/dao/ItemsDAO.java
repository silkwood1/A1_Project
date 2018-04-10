package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * 품목 관련 DAO
 */
@Repository
public class ItemsDAO {
	@Autowired
	SqlSession sqlSession;

	
}