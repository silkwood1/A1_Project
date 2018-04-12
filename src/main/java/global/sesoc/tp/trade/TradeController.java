package global.sesoc.tp.trade;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("Trade")
public class TradeController {

	@RequestMapping(value = "TradeBoard", method = RequestMethod.GET)
	public String mainBoard(Model model) {

		/*
		 * ArrayList<Board> boardList = new ArrayList<Board>();
		 * 
		 * boardList = dao.boardList();
		 * 
		 * model.addAttribute("b",boardList);
		 * 
		 */
		return "/purchase/purchaseBoard";
	}
}
