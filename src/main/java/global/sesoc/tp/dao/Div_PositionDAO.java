package global.sesoc.tp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.Div_PositionVO;

/*
 * 직급 관련 DAO
 */
@Repository
public class Div_PositionDAO {
	@Autowired
	SqlSession sqlSession;

	// 저장
	public int insert_positionDiv(Div_PositionVO payment) {
		int a = 0;
		Div_PositionMapper mapper = sqlSession.getMapper(Div_PositionMapper.class);
		try {
			a = mapper.insert_positionDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 수정
	public int update_positionDiv(Div_PositionVO payment) {
		int a = 0;
		Div_PositionMapper mapper = sqlSession.getMapper(Div_PositionMapper.class);
		try {
			a = mapper.update_positionDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 삭제
	public int delete_positionDiv(Div_PositionVO payment) {
		int a = 0;
		Div_PositionMapper mapper = sqlSession.getMapper(Div_PositionMapper.class);
		try {
			a = mapper.delete_positionDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	// 중복찾기
	public Div_PositionVO select_positionDiv(Div_PositionVO payment) {
		int a = 0;
		Div_PositionMapper mapper = sqlSession.getMapper(Div_PositionMapper.class);
		try {
			a = mapper.select_positionDiv(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	
}
