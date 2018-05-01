package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.ItemsVO;
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
	// 거래처 긁어오기
	public ArrayList<CustomerVO> load_account(String bn);
	// 아이템 긁어오기
	public ArrayList<ItemsVO> load_items(String bn);
	//수정
	public String get_cusno(int tradeNo);
	// 결제완료하기
	public int editStat(int tradeNo);
	// 재고 더하기
	public int pQty(TradeVO trade);
	// 재고 빼기
	public int mQty(TradeVO trade);
	//판매량 
	public int get_uriage(HashMap<String, String> hm);
	//
	ArrayList<TradeVO> readTrades(String userBn);
	//
	ArrayList<TradeVO> readTradesbybn(String userBn);
	
	
	
}
