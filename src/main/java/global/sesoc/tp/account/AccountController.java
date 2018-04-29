package global.sesoc.tp.account;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.CustomerDAO;
import global.sesoc.tp.dao.StaffDAO;
import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.StaffVO;

@Controller
@RequestMapping("account")

public class AccountController {

	@Autowired
	CustomerDAO dao;

	@Autowired
	StaffDAO dao2;

	// 주소 검색
	@RequestMapping(value = "addr_insert", method = RequestMethod.POST)
	public String addr() {

		return "../addr_insert";
	}

	// 거래처 목록 페이지
	@RequestMapping(value = "accountBoard", method = RequestMethod.GET)
	public String mainBoard(HttpSession session, Model model, CustomerVO customer) {

		String userBn = (String) session.getAttribute("bn");
		ArrayList<CustomerVO> customerList = new ArrayList<CustomerVO>();

		try {
			customerList = dao.customerList(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("c", customerList);

		return "/account/accountBoard";
	}

	// 새 거래처 등록 페이지
	@RequestMapping(value = "goInsertAccount", method = RequestMethod.GET)
	public String goInsertAccount(Model model, HttpSession s) {
		String a = "";
		
		a = (String) s.getAttribute("bn");
		
		ArrayList<StaffVO> stf = new ArrayList<StaffVO>();
		
		stf = dao2.get_staff(a);
		
		model.addAttribute("staff", stf);
		
		return "/account/insertAccount";
	}

	// 새 거래처 등록
	@ResponseBody
	@RequestMapping(value = "insertAccount", method = RequestMethod.POST)
	public String insertAccount(Model model, CustomerVO customer) {
		System.out.println(customer.toString());

		int res = 0;
		try {
			res = dao.insertCustomer(customer);
			System.out.println("res : " + res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = String.valueOf(res);
		System.out.println("result : " + result);

		return result;
	}

	@RequestMapping(value = "accountBoard", method = RequestMethod.POST)
	public String mainBoard2(Model model) {

		/*
		 * Dropbox-List에서 선택된 값에 따라 아래 리스트에 해당하는 값에 대한 리스트를 출력한다. Parameter 값으로
		 * 리스트에 해당하는 값을 받아서 넘겨준다. DB에 조건부에 해당 값을 넘겨주어, 해당 조건에 맞는 값을 넘겨받는다.
		 */

		return "/account/accountBoard";
	}

	// 거래처 수정 페이지
	@RequestMapping(value = "accountModify", method = RequestMethod.GET)
	public String accountModify(Model model, @RequestParam int customerNo, HttpSession s) {
		System.out.println(customerNo);
		CustomerVO customer = null;
		String a = (String) s.getAttribute("bn");
		ArrayList<StaffVO> stf = new ArrayList<StaffVO>();
		
		try {
			stf = dao2.get_staff(a);
			customer = dao.selectCustomer(customerNo);
			System.out.println(customer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("cu", customer);
		model.addAttribute("staff", stf);
		
		return "/account/accountModify";
	}

	// 거래처 삭제
	@RequestMapping(value = "accountDelete", method = RequestMethod.GET)
	public String accountDelete(Model model, @RequestParam int customerNo) {
		int res = 0;
		try {
			res = dao.deleteCustomer(customerNo);
			
			if (res == 1) {
				return "redirect:accountBoard";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/account/delete_fail";
	}

	// 거래처 수정
	@ResponseBody
	@RequestMapping(value = "updateCustomer", method = RequestMethod.POST)
	public String updateCustomer(CustomerVO customer) {
		int res = 0;
		String result = null;
		try {
			res = dao.updateCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result = String.valueOf(res);

		return result;
	}
}
