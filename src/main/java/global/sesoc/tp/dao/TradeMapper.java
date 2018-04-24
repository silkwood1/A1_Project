package global.sesoc.tp.dao;

import java.util.ArrayList;

import global.sesoc.tp.vo.TradeVO;

public interface TradeMapper {
	// 새 거래 등록
	public int insertTrade(TradeVO trade);
	// 전체 거래 리스트
	public ArrayList<TradeVO> tradeList(String userBn);
	// 거래번호로 거래 조회
	public TradeVO selectTrade(int tradeNo);
	// 거래 삭제
	public int deleteTrade(int tradeNo);
	// 거래 수정
	public int updateTrade(TradeVO trade);
	// 거래구분으로 찾기
	public ArrayList<TradeVO> searchTradeByTdiv(TradeVO trade);
	// 고객명으로 찾기
	public ArrayList<TradeVO> searchTradeByCustomer(TradeVO trade);
	// 품목명으로 찾기
	public ArrayList<TradeVO> searchTradeByItem(TradeVO trade);
	// 결제수단으로 찾기
	public ArrayList<TradeVO> searchTradeByPdiv(TradeVO trade);
	// 상태별로 찾기
	public ArrayList<TradeVO> searchTradeByStatus(TradeVO trade);
	
}
