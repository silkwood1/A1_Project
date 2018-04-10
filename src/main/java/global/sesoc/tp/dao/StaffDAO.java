package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * 직원 관련 DAO
 */
@Repository
public class StaffDAO {
	@Autowired
	SqlSession sqlSession;

	
}