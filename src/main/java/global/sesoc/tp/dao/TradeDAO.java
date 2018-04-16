package global.sesoc.tp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.TradeVO;

@Repository
public class TradeDAO {
	@Autowired
	SqlSession sqlSession;
	
	// 새 거래 등록
	public int insertTrade(TradeVO trade) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.insertTrade(trade);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	// 전체 거래 리스트 
	public ArrayList<TradeVO> tradeList(String userBn) {
			
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> tradeList = new ArrayList<TradeVO>();
		try {
			tradeList = mapper.tradeList(userBn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return tradeList;	
	}
	
	// 거래번호로 거래 조회
	public TradeVO selectTrade(int tradeNo) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		TradeVO a = null;
		try {
			a = mapper.selectTrade(tradeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	// 거래 삭제
	public int deleteTrade(int tradeNo) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.deleteTrade(tradeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	// 거래 수정
	public int updateTrade(TradeVO trade) {
			
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.updateTrade(trade);
		} catch (Exception e) {
			e.printStackTrace();
			}
			
			return a;
		}

}
