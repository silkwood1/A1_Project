package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.ItemsVO;
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
	
public TradeVO selectTradeTwo(int tradeNo) {
		
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

	// 거래구분으로 찾기
	public ArrayList<TradeVO> searchTradeByTdiv(TradeVO trade) {
	
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> searchTradeByTdiv = new ArrayList<TradeVO>();
		try {
			searchTradeByTdiv = mapper.searchTradeByTdiv(trade);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return searchTradeByTdiv;	
	}
	// 고객명으로 찾기
	public ArrayList<TradeVO> searchTradeByCustomer(TradeVO trade) {
	
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> searchTradeByCustomer = new ArrayList<TradeVO>();
		try {
			searchTradeByCustomer = mapper.searchTradeByCustomer(trade);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return searchTradeByCustomer;	
	}
	// 품목명으로 찾기
	public ArrayList<TradeVO> searchTradeByItem(TradeVO trade) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> searchTradeByItem = new ArrayList<TradeVO>();
		try {
			searchTradeByItem = mapper.searchTradeByItem(trade);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return searchTradeByItem;	
	}
	// 결제수단으로 찾기
	public ArrayList<TradeVO> searchTradeByPdiv(TradeVO trade) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> searchTradeByPdiv = new ArrayList<TradeVO>();
		try {
			searchTradeByPdiv = mapper.searchTradeByPdiv(trade);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return searchTradeByPdiv;
	}
	// 상태별로 찾기
	public ArrayList<TradeVO> searchTradeByStatus(TradeVO trade) {
		
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<TradeVO> searchTradeByStatus = new ArrayList<TradeVO>();
		try {
			searchTradeByStatus = mapper.searchTradeByStatus(trade);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return searchTradeByStatus;	
	}

	public ArrayList<CustomerVO> load_account(String bn) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		try {
			list = mapper.load_account(bn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ItemsVO> load_items(String bn) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		ArrayList<ItemsVO> list = new ArrayList<ItemsVO>();
		try {
			list = mapper.load_items(bn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public String get_cusno(int tradeNo) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		String a = "";
		try {
			a = mapper.get_cusno(tradeNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	// 거래 완료 버튼
	public int editStat(int tradeNo) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.editStat(tradeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	// 재고 더하기
	public int pQty(TradeVO trade) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.pQty(trade);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	// 재고 빼기
	public int mQty(TradeVO trade) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.mQty(trade);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}

	public int get_uriage(HashMap<String, String> hm) {
		TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
		int a = 0;
		try {
			a = mapper.get_uriage(hm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	public ArrayList<TradeVO> readTrades(String userBn){ //readTradesbybn
		
		ArrayList<TradeVO> result = new ArrayList<TradeVO>();
		
		try {
			TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
			result = mapper.readTrades(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<TradeVO> readTradesbybn(String userBn){ //readTradesbybn
		
		ArrayList<TradeVO> result = new ArrayList<TradeVO>();
		
		try {
			TradeMapper mapper = sqlSession.getMapper(TradeMapper.class);
			result = mapper.readTradesbybn(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
	
}
