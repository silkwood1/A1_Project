package global.sesoc.tp.account;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tp.dao.CustomerDAO;
import global.sesoc.tp.vo.CustomerVO;

@Controller
@RequestMapping("account")

public class AccountController {

	@Autowired
	CustomerDAO dao;

	@RequestMapping(value = "accountBoard", method = RequestMethod.GET)
	public String mainBoard(Model model,String div, String name) {

		System.out.println("!!!!!!!!"+div);
		System.out.println("!!!!!!!!"+name);
		
		CustomerVO cvo = new CustomerVO();
		
		if(div != null) {
		cvo.setCustomerDiv(Integer.parseInt(div));
		}
		
		cvo.setCustomerComName(name);
		
		ArrayList<CustomerVO> customerList = new ArrayList<CustomerVO>();
		
		/*
		 * dao에 인자로 div, name를 보내서 query문에서 동적 query로 처리한다. 
		 */
		customerList = dao.customerList(cvo);

		System.out.println(customerList);

		model.addAttribute("c", customerList);

		return "/account/accountBoard";
	}
	

	@RequestMapping(value = "accountBoard", method = RequestMethod.POST)
	public String mainBoard2(Model model) {

		/*
		 * Dropbox-List에서 선택된 값에 따라 아래 리스트에 해당하는 값에 대한 리스트를 출력한다. Parameter 값으로 리스트에
		 * 해당하는 값을 받아서 넘겨준다. DB에 조건부에 해당 값을 넘겨주어, 해당 조건에 맞는 값을 넘겨받는다.
		 */

		return "/account/accountBoard";
	}
	
	@RequestMapping(value = "accountModify", method = RequestMethod.GET)
	public String accountModify(String customerBsn, Model model) {
		
		
		
		//Database에서 search (select문)
		//select query로 얻은 출력을 model로 해서 jsp단으로 보내주기.
		
		
		
		return "/account/accountBoardModify";
	}
	
	@RequestMapping(value = "accountDelete", method = RequestMethod.GET)
	public String accountDelete() {
		
		
				
		return "/account/accountBoardDelete";
	}

}
