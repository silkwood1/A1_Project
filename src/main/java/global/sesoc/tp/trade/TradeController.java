package global.sesoc.tp.trade;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.TradeDAO;
import global.sesoc.tp.vo.TradeVO;

@Controller
@RequestMapping("trade")
public class TradeController {

	@Autowired
	TradeDAO dao;

	// 새 거래 등록
	@ResponseBody
	@RequestMapping(value = "insertTrade", method = RequestMethod.POST)
	public String insertTrade(Model model, TradeVO trade) {
		System.out.println(trade.toString());
		int res = 0;
		ArrayList<TradeVO> boardList = new ArrayList<TradeVO>();

		try {
			res = dao.insertTrade(trade);
			boardList = dao.tradeList("11-111-111");
			System.out.println(1);
			
			System.out.println(res);
		} catch (Exception e) {
			System.out.println(2);
			e.printStackTrace();
		}
		String result = String.valueOf(res);
		model.addAttribute("b", boardList);

		return result;
	}

	// 전체 거래 리스트
	@RequestMapping(value = "tradeBoard", method = RequestMethod.GET)
	public String mainBoard(Model model) {

		ArrayList<TradeVO> boardList = new ArrayList<TradeVO>();

		try {
			boardList = dao.tradeList("11-111-111");
			System.out.println(0);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(1);
		}

		model.addAttribute("b", boardList);

		return "/trade/tradeBoard";
	}

	// 거래 정보 페이지
	@RequestMapping(value = "editTrade", method = RequestMethod.GET)
	public String goEditTrade(Model model, @RequestParam int tradeNo) {
		System.out.println(tradeNo);
		TradeVO t = null;
		
		try {
			t = dao.selectTrade(tradeNo);
			System.out.println(0);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(1);
		}
		model.addAttribute("tradeNo", tradeNo);
		model.addAttribute("t", t);
		
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
	
	
	@RequestMapping(value = "table", method = RequestMethod.GET)
	public String table(Model model) {
		
		return "/trade/table";
	}

}
