package global.sesoc.tp.dao;

import global.sesoc.tp.vo.UserVO;

public interface UserMapper {

	int join_list(UserVO vo);	//user_list 테이블

	int join_profile(UserVO vo);	//user_profile 테이블

	int id_chk(String id);	//중복 처리

	String get_bn(UserVO vo);	//아이디 찾기(사업자)

	String get_id(String bn);	//사업자번호로 아이디찾기

	UserVO get_user(String bn);		//사업자번호로 정보 찾기

	String login(UserVO vo);	//로그인

	UserVO get_name(String login_id);	//세션에 올릴 이름 가져오기

	UserVO get_user_profile(String bn);	//사업자번호로 정보 찾기

	int update_user(UserVO user);		//회원정보 수정

	int update_user_profile(UserVO user);	//수정

	void goodbye(String bn);	//탈퇴 _ list

	void sayonara(String bn);	//탈퇴 _ profile

	String get_cname(String userBn);	//회사명 가져오기

}
