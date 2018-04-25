package global.sesoc.tp.trade;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.ItemsDAO;
import global.sesoc.tp.dao.TradeDAO;
import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.ItemsVO;
import global.sesoc.tp.vo.TradeVO;

@Controller
@RequestMapping("trade")
public class TradeController {

	@Autowired
	TradeDAO dao;
	
	@Autowired
	ItemsDAO dao2;

	// 새 거래 등록
	@ResponseBody
	@RequestMapping(value = "insertTrade", method = RequestMethod.POST)
	public String insertTrade(HttpSession session, Model model, TradeVO trade) {
		// System.out.println(trade.toString());
		int res = 0;
		ArrayList<TradeVO> boardList = new ArrayList<TradeVO>();
		try {

			res = dao.insertTrade(trade);
			String userBn = (String) session.getAttribute("bn");
			boardList = dao.tradeList(userBn);

			System.out.println(res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = String.valueOf(res);
		session.setAttribute("b", boardList);
		return result;
	}

	// 전체 거래 리스트
	@RequestMapping(value = "tradeBoardPage", method = RequestMethod.GET)
	public String tradeBoardPage(HttpSession session, Model model) {
		
		ArrayList<TradeVO> boardList = new ArrayList<TradeVO>();
		String userBn = (String) session.getAttribute("bn");

		try {
			boardList = dao.tradeList(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		ArrayList<ItemsVO> list2 = new ArrayList<ItemsVO>();

		list = dao.load_account(userBn);
		list2 = dao.load_items(userBn);

		session.setAttribute("account", list);
		session.setAttribute("items", list2);

		session.setAttribute("b", boardList);
		
		return "redirect:tradeBoard";
	}
	
	@RequestMapping(value = "tradeBoard", method = RequestMethod.GET)
	public String mainBoard() {
		
		return "/trade/tradeBoard";
	}
	
	// 거래 정보 페이지
	@RequestMapping(value = "editTrade", method = { RequestMethod.GET, RequestMethod.POST })
	public String goEditTrade(HttpSession s, Model model, @RequestParam int tradeNo) {
		// System.out.println(tradeNo);
		TradeVO t = null;

		try {
			t = dao.selectTrade(tradeNo);
			// System.out.println(0);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(1);
		}
		model.addAttribute("tradeNo", tradeNo);
		model.addAttribute("t", t);
		
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		ArrayList<ItemsVO> list2 = new ArrayList<ItemsVO>();
		
		String bn = (String) s.getAttribute("bn");
		
		list = dao.load_account(bn);
		list2 = dao.load_items(bn);

		model.addAttribute("account", list);
		model.addAttribute("items", list2);

		return "/trade/editTrade";
	}

	// 거래 삭제
	@RequestMapping(value = "deleteTrade", method = RequestMethod.GET)
	public String deleteTrade(Model model, @RequestParam int tradeNo) {
		int res = 0;
		String result = null;
		try {
			res = dao.deleteTrade(tradeNo);
			if (res == 1) {
				result = "redirect:tradeBoard";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 거래 수정
		@ResponseBody
		@RequestMapping(value = "updateTrade", method = RequestMethod.POST)
		public String updateTrade(TradeVO trade) {
			System.out.println(trade.toString());
			int res = 0;
			String result = null;
			
			try {
				res = dao.updateTrade(trade);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			result = String.valueOf(res);
			
			return result;
		}
		
		// 거래구분으로 찾기
		@ResponseBody
		@RequestMapping(value = "searchTradeByTdiv", method = RequestMethod.POST)
		public String searchTradeByTdiv(HttpSession session, TradeVO trade) {
			//System.out.println("//////////");
			//System.out.println(trade.toString());
			//System.out.println("//////////");
			int res = 0;
			ArrayList<TradeVO> searchTradeByTdiv = new ArrayList<TradeVO>();

			try {
				searchTradeByTdiv = dao.searchTradeByTdiv(trade);
				res = 1;
			} catch (Exception e) {
				res = 2;
				e.printStackTrace();
			}
			
//			for (int i = 0; i < searchTradeByTdiv.size(); i++) {
//				System.out.println(searchTradeByTdiv.get(i));
//			}

			session.setAttribute("b", searchTradeByTdiv);
			String result = String.valueOf(res);
			System.out.println(result);
			
			return result;
		}
		// 고객명으로 찾기
		@ResponseBody
		@RequestMapping(value = "searchTradeByCustomer", method = RequestMethod.POST)
		public String searchTradeByCustomer(TradeVO trade, HttpSession session) {
			//System.out.println(trade.toString());
			int res = 0;
			ArrayList<TradeVO> searchTradeByCustomer = new ArrayList<TradeVO>();
			
			try {
				searchTradeByCustomer = dao.searchTradeByCustomer(trade);
				res = 1;
			} catch (Exception e) {
				res = 2;
				e.printStackTrace();
			}

			session.setAttribute("b", searchTradeByCustomer);
			String result = String.valueOf(res);
			System.out.println(result);
			
			return result;
		}
		// 품목명으로 찾기
		@ResponseBody
		@RequestMapping(value = "searchTradeByItem", method = RequestMethod.POST)
		public String searchTradeByItem(HttpSession session, TradeVO trade) {
			System.out.println(trade.toString());
			int res = 0;
			ArrayList<TradeVO> searchTradeByItem = new ArrayList<TradeVO>();
			
			try {
				searchTradeByItem = dao.searchTradeByItem(trade);
				res = 1;
			} catch (Exception e) {
				res = 2;
				e.printStackTrace();
			}

			session.setAttribute("b", searchTradeByItem);
			String result = String.valueOf(res);
			System.out.println(result);
			
			return result;
		}
		// 결제수단으로 찾기
		@ResponseBody
		@RequestMapping(value = "searchTradeByPdiv", method = RequestMethod.POST)
		public String searchTradeByPdiv(HttpSession session, TradeVO trade) {
			//System.out.println(trade.toString());
			int res = 0;
			ArrayList<TradeVO> searchTradeByPdiv = new ArrayList<TradeVO>();
			
			try {
				searchTradeByPdiv = dao.searchTradeByPdiv(trade);
				res = 1;
			} catch (Exception e) {
				res = 2;
				e.printStackTrace();
			}

			session.setAttribute("b", searchTradeByPdiv);
			String result = String.valueOf(res);
			System.out.println(result);
			
			return result;
		}
		// 상태별로 찾기
		@ResponseBody
		@RequestMapping(value = "searchTradeByStatus", method = RequestMethod.POST)
		public String searchTradeByStatus(HttpSession session, TradeVO trade) {
			//System.out.println(trade.toString());
			int res = 0;
			ArrayList<TradeVO> searchTradeByStatus = new ArrayList<TradeVO>();
			
			try {
				searchTradeByStatus = dao.searchTradeByStatus(trade);
				res = 1;
			} catch (Exception e) {
				res = 2;
				e.printStackTrace();
			}

			session.setAttribute("b", searchTradeByStatus);
			String result = String.valueOf(res);
			System.out.println(result);
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value = "setPrice", method = RequestMethod.POST)
		public String setPrice(HttpSession session, String itemCode) {
			System.out.println(itemCode);
			
			String a = "";
			
			a = dao2.getPrice(itemCode);
			
			return a;
		}

}
