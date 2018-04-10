package global.sesoc.tp.dao;

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
	
	

}
