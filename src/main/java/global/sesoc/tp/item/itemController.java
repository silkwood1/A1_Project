package global.sesoc.tp.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tp.dao.ItemsDAO;

@Controller
@RequestMapping("item")

public class itemController {
	
	@Autowired
	private ItemsDAO dao;
	
	@RequestMapping(value = "items_list", method = RequestMethod.GET)
	public String items_list() {

		return "item/items_list";
	}
}