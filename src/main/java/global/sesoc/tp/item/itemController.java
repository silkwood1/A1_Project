package global.sesoc.tp.item;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tp.dao.ItemsDAO;
import global.sesoc.tp.vo.ItemsVO;

@Controller
@RequestMapping("item")

public class itemController {
	
	@Autowired
	private ItemsDAO dao;
	
	@RequestMapping(value = "items_list", method = RequestMethod.GET)
	public String items_list(Model m) {
		ArrayList<ItemsVO> items = new ArrayList<ItemsVO>();
		items = dao.items_list();
		m.addAttribute("items", items);
		return "item/items_list";
	}
}