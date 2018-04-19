package global.sesoc.tp.item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.ItemsDAO;
import global.sesoc.tp.vo.ItemsVO;

@Controller
@RequestMapping("item")

public class itemController {
	
	@Autowired
	private ItemsDAO dao;
	
	@RequestMapping(value = "items_list", method = RequestMethod.GET)
	public String items_list(Model m, HttpSession session, String div, String val) {
		ArrayList<ItemsVO> items = new ArrayList<ItemsVO>();
		String bn = (String) session.getAttribute("bn");
		
		if(div == null){
			div = "0";
		}
		
		if(val == null){
			val = "0";
		}
		
		if(div.equals("1") || div.equals("2")){
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("div", div);
			hm.put("bn", bn);
			items = dao.items_list2(hm);
		}else if(!(val.equals("0"))){
			items = dao.items_list3(val);
		}else{
			items = dao.items_list(bn);		
		}
		m.addAttribute("items", items);
		return "item/items_list";
		
	}
	
	@RequestMapping(value = "items_insert", method = RequestMethod.GET)
	public String items_insert(ItemsVO item) {
		
		return "/item/items_insert";
	}
	
	@ResponseBody
	@RequestMapping(value = "item_insert_chk", method = RequestMethod.POST)
	public String item_insert_chk(@RequestBody ItemsVO item) {
		String a = "";
		String c = "";
		int b = 0;
		
		System.out.println(item.getItemNum());
		
		b = dao.code_search(item.getItemCode());
		c = dao.code_search2(item.getItemNum());
		
		System.out.println(item.getItemCode());
		System.out.println(c);
		
		if(item.getItemCode().equals(c) || b == 0){
			a = "1";
		}else{
			a = "0";
		}
		return a;
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insert(HttpSession session, ItemsVO item, String userBn, HttpServletResponse res) throws IOException {
		String bn = (String) session.getAttribute("bn");
		item.setUserBn(bn);
		
		System.out.println(item.toString());
		System.out.println(bn);
		
		dao.item_insert(item);
		
		res.sendRedirect("items_list");
	}
	
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void item_delete(@RequestParam(value = "num") String itemNum, HttpServletResponse res) throws IOException {
		dao.item_delete(itemNum);
		
		res.sendRedirect("items_list");
	}
	
	@RequestMapping(value = "items_info", method = RequestMethod.GET)
	public String items_info(int num, Model m) {
		ItemsVO item = new ItemsVO();
		item = dao.item_info(num);
		m.addAttribute("item", item);
		
		return "/item/items_info";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(HttpSession session, ItemsVO item, HttpServletResponse res) throws IOException {
		String bn = (String) session.getAttribute("bn");
		item.setUserBn(bn);
		
		System.out.println(item.toString());
		System.out.println(bn);
		
		dao.item_update(item);
		
		res.sendRedirect("items_list");
	}
}