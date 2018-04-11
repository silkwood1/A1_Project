package global.sesoc.tp;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tp.dao.StaffDAO;
import global.sesoc.tp.vo.StaffVO;
import global.sesoc.tp.vo.TradeVO;

@Controller
@RequestMapping("staff")
public class StaffController {
	
	@Autowired
	private StaffDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@RequestMapping(value = "/stafflist", method = RequestMethod.GET)
	public String StafflistBoard(Model model) {

		 
		return "staff/stafflist";
	}
	
	@RequestMapping(value = "EditStaff", method = RequestMethod.GET)
	public String goEditTrade(Model model) {
		
		return "/staff/EditStaff";
	}
	
	

}
