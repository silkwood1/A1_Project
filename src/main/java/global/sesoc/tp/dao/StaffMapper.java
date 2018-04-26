package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.StaffVO;
import global.sesoc.tp.vo.UserVO;

/**
 * 직원
 */
public interface StaffMapper {
	int staff_profile(StaffVO staff);		//staff_profile 테이블
	StaffVO getInfo(int staffNo);			//정보
	UserVO getId(String staffId);			//id 중복검사
	String login(StaffVO staff);			//로그인

	int update_staff_profile(StaffVO staff);	//수정
	
	public ArrayList<StaffVO> staffList(String userBn);	//staff리스트
	
	int delete_staff_profile(StaffVO staff); 		//삭제
	
	int staff_id_chk(String id); //아이디 검색
	
	

}
