package global.sesoc.tp;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.UserDAO;
import global.sesoc.tp.vo.UserVO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "login_main";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login_home(HttpSession session, String login_id, HttpServletResponse response) throws IOException {
		UserVO user = new UserVO();
		user = dao.get_name(login_id);
		session.setAttribute("name", user.getUserName());
		session.setAttribute("id", login_id);
		session.setAttribute("bn", user.getUserBn());
		
		response.sendRedirect("home");
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "login_chk", method = RequestMethod.POST)
	public String login_chk(@RequestBody UserVO vo) {
		String a = "1";
		String bn = dao.login(vo);
		if (bn == null || bn.equals("")) {
			a = "0";
		}		
		return a;
	}
	
	//주소 검색
	@RequestMapping(value = "addr_insert", method = RequestMethod.GET)
	public String addr() {

		return "addr_insert";
	}

	@RequestMapping(value = "addr_insert", method = RequestMethod.POST)
	public String addr2() {

		return "addr_insert";
	}


	// 회원가입
	@ResponseBody
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join_form(@RequestBody UserVO vo) {
		try {
			dao.join_list(vo);
			dao.join_profile(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		System.out.println(vo.toString());
		return "1";
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "id_chk", method = RequestMethod.POST)
	public String id_chk(@RequestParam(value = "text") String id) {
		String a = "1";
		int b = 0;
		b = dao.id_chk(id);
		if (b > 0) {
			a = "0";
		}
		return a;
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "search_id", method = RequestMethod.POST)
	public String id_search(@RequestBody UserVO vo) {
		String bn = "";
		String id = "";

		System.out.println(vo.toString());
		
		bn = dao.get_bn(vo);
		if(bn == null || bn.equals("")){
			return "0";
		}else{
			id = dao.get_id(bn);
			return id;
		}
	}
	
	@RequestMapping(value = "qrcode", method = RequestMethod.GET)
	public String qrcode() {
		
		return "QRcodeGenerate/generator";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();

		response.sendRedirect("/");
	}
	
	//회원정보 수정 이동
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(HttpSession session, Model m) {
		UserVO user1 = new UserVO();
		UserVO user2 = new UserVO();
		String bn = (String) session.getAttribute("bn");
		
		user1 = dao.get_user(bn); //userList
		user2 = dao.get_user_profile(bn); //userProfile
		
		user2.setUserId(user1.getUserId());
		user2.setUserPassword("");
		
		m.addAttribute("user", user2);
		
		return "update";
	}
	
	//회원정보 수정
	@RequestMapping(value = "update_user", method = RequestMethod.POST)
	public String update_user(UserVO user, HttpSession session) {
		System.out.println(user.toString());
		if(dao.update_user(user) == 0 || dao.update_user_profile(user) == 1){
			session.setAttribute("name", user.getUserName());
			return "home";
		}
		return "update";
	}
	
	@RequestMapping(value="goodbye", method = RequestMethod.GET)
	public void goodbye(HttpSession session, HttpServletResponse response) throws IOException{
		String bn = (String) session.getAttribute("bn");
		dao.goodbye(bn);
		dao.sayonara(bn);
		
		response.sendRedirect("logout");
	}
}
