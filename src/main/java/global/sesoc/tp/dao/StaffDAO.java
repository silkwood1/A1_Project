package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.StaffVO;

/*
 * 직원 관련 DAO
 */
@Repository
public class StaffDAO {
	@Autowired
	SqlSession sqlSession;


	public int staff_profile(StaffVO vo) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.staff_profile(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public int staff_list(StaffVO vo) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.staff_list(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public String login(StaffVO vo) {
		String s = "";
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.login(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public int update_staff(StaffVO vo) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.update_staff(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
		
	}

	public int update_staff_profile(StaffVO vo) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.update_staff_profile(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
}