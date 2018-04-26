package global.sesoc.tp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.tp.vo.StaffVO;
import global.sesoc.tp.vo.UserVO;

/*
 * 직원 관련 DAO
 */
@Repository
public class StaffDAO {
	@Autowired
	SqlSession sqlSession;


	public int staff_profile(StaffVO staff) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.staff_profile(staff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}


	public String login(StaffVO staff) {
		String s = "";
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.login(staff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public StaffVO getInfo(int staffNo){
		StaffVO s = null;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.getInfo(staffNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

/*	//id 중복검사
	public UserVO getId(String staffId){
		UserVO u = null;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			u = mapper.getId(staffId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
*/
	public int update_staff_profile(StaffVO staff) {
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.update_staff_profile(staff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
	public int delete_staff_profile(StaffVO staff){
		int s = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try {
			s = mapper.delete_staff_profile(staff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
	public ArrayList<StaffVO> staffList(String userBn){
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		ArrayList<StaffVO> staffList = new ArrayList<StaffVO>();
		try {
			staffList = mapper.staffList(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffList;
	}
}