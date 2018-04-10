package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.Div_RankVO;

/*
 * 회원등급 관련 DAO
 */
@Repository
public class Div_RankDAO {
	@Autowired
	SqlSession sqlSession;

	// 저장
	public int insert_RankDiv(Div_RankVO rank) {
		int a = 0;
		Div_RankMapper mapper = sqlSession.getMapper(Div_RankMapper.class);
		try {
			a = mapper.insert_RankDiv(rank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 수정
	public int update_RankDiv(Div_RankVO rank) {
		int a = 0;
		Div_RankMapper mapper = sqlSession.getMapper(Div_RankMapper.class);
		try {
			a = mapper.update_RankDiv(rank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 삭제
	public int delete_RankDiv(Div_RankVO rank) {
		int a = 0;
		Div_RankMapper mapper = sqlSession.getMapper(Div_RankMapper.class);
		try {
			a = mapper.delete_RankDiv(rank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 중복찾기
	public Div_RankVO select_RankDiv(Div_RankVO rank) {
		int a = 0;
		Div_RankMapper mapper = sqlSession.getMapper(Div_RankMapper.class);
		try {
			a = mapper.select_RankDiv(rank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	
}
