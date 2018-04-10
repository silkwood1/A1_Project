package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.UserVO;


@Repository
public class UserDAO {
	@Autowired
	SqlSession sqlSession;

	public int join_list(UserVO vo) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.join_list(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public int join_profile(UserVO vo) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.join_profile(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public int id_chk(String id) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.id_chk(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public String get_bn(UserVO vo) {
		String a = "";
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.get_bn(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public String get_id(String bn) {
		String a = "";
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.get_id(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public UserVO get_user(String bn) {
		UserVO user = new UserVO();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			user = mapper.get_user(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}

	public String login(UserVO vo) {
		String a = "";
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.login(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public UserVO get_name(String login_id) {
		UserVO a = new UserVO();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.get_name(login_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public UserVO get_user_profile(String bn) {
		UserVO user = new UserVO();
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			user = mapper.get_user_profile(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}

	public int update_user(UserVO user) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.update_user(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public int update_user_profile(UserVO user) {
		int a = 0;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			a = mapper.update_user_profile(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	public void goodbye(String bn) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			mapper.goodbye(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void sayonara(String bn) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		try{
			mapper.sayonara(bn);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
