package global.sesoc.tp.dao;

import java.util.ArrayList;

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


	public int staff_id_chk(String id) {
		int a = 0;
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		try{
			a = mapper.staff_id_chk(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}


	public ArrayList<StaffVO> get_staff(String a) {
		StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
		ArrayList<StaffVO> staffList = new ArrayList<StaffVO>();
		try {
			staffList = mapper.get_staff(a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffList;
	}
	
	public StaffVO readOneAccount(String id){
		StaffVO account = null;
		try {
			StaffMapper mapper = sqlSession.getMapper(StaffMapper.class);
			System.out.println(id);
			account = mapper.readOneAccount(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}
}