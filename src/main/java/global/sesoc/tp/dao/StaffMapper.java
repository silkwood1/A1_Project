package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.StaffVO;

/**
 * 직원
 */
public interface StaffMapper {
	int staff_profile(StaffVO vo);		//staff_profile 테이블
	int staff_list(StaffVO vo);			//staff_list 테이블

	String login(StaffVO vo);			//로그인
	
	int update_staff(StaffVO vo);		//스텝 정보수정
	int update_staff_profile(StaffVO vo);	//수정
	
	
	
	public ArrayList<StaffVO> staffList(StaffVO svo);	//staff리스트
	
	int delete_staff(StaffVO vo);				//스탭정보 삭제
	int delete_staff_profile(StaffVO vo); 		//삭제
	
	

}
