package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.Div_DeptVO;

/*
 * 부서 관련 DAO
 */
@Repository
public class Div_DeptDAO {
	@Autowired
	SqlSession sqlSession;

	// 저장
	public int insert_deptDiv(Div_DeptVO dept) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(Div_DeptMapper.class);
		try {
			a = mapper.insert_deptDiv(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 수정
	public int update_deptDiv(Div_DeptVO dept) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(Div_DeptMapper.class);
		try {
			a = mapper.update_deptDiv(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 삭제
	public int delete_deptDiv(Div_DeptVO dept) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(Div_DeptMapper.class);
		try {
			a = mapper.delete_deptDiv(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 중복찾기
	public Div_DeptVO select_deptDiv(Div_DeptVO dept) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(Div_DeptMapper.class);
		try {
			a = mapper.select_deptDiv(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

}
