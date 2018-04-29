package global.sesoc.tp;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import global.sesoc.tp.dao.SchedulesDAO;
import global.sesoc.tp.dao.StaffDAO;
import global.sesoc.tp.dao.TradeDAO;
import global.sesoc.tp.dao.UserDAO;
import global.sesoc.tp.view.QRCodeView;
import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.SchedulesVO;
import global.sesoc.tp.vo.StaffVO;
import global.sesoc.tp.vo.TradeVO;
import global.sesoc.tp.vo.UserVO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private TradeDAO dao2;
	
	@Autowired
	private SchedulesDAO dao3;
	
	@Autowired
	private StaffDAO dao4;
	
	

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
		user.setUserCname(dao.get_cname(user.getUserBn()));
		session.setAttribute("name", user.getUserName());
		session.setAttribute("id", login_id);
		session.setAttribute("bn", user.getUserBn());
		session.setAttribute("cname", user.getUserCname());

		response.sendRedirect("home");
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(HttpSession s, Model m) {
		String bn = (String) s.getAttribute("bn");
		//월별 추이
		ArrayList<Integer> uriage = new ArrayList<Integer>();
		String month[] = {"02", "03", "04", "05","06","07","08","09","10","11","12"};
		HashMap<String, String> hm = new HashMap<String,String>();
		hm.put("a", bn);
		hm.put("b", "01");
		uriage.add(dao2.get_uriage(hm));
		for (int i = 0; i < month.length; i++) {
			hm.replace("b", month[i]);
			uriage.add(dao2.get_uriage(hm));
		}
		
		m.addAttribute("uriage", uriage);
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
			dao.join_profile(vo);//1
			dao.join_list(vo);//2
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
			session.setAttribute("cname", user.getUserCname());
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
	
	@RequestMapping(value = "qrcode", method = RequestMethod.GET)
	public String qrcode(Model model, HttpSession s) {
		String a = (String) s.getAttribute("bn");
		ArrayList<CustomerVO> customer = new ArrayList<CustomerVO>();
		
		customer = dao.selectAll(a);
		
		model.addAttribute("A", customer);
		
		return "QRcodeGenerate/generator";
	}
	
	@RequestMapping(value = "qrPage", method = RequestMethod.POST)
	@ResponseBody	
	public CustomerVO qrcode(String bsnNum) {
		
		
		System.out.println(bsnNum);
		
		
		CustomerVO user = new CustomerVO();
		
		user = dao.selectUser(bsnNum);
		
		System.out.println("Customer ��ü "+user);
		
		return user;
	}
	
	@RequestMapping(value = "createQRcode", method = RequestMethod.GET) 
	public ModelAndView createCode(@RequestParam String content, Model model, String customerCName){
				
			model.addAttribute("company",customerCName);
			
			System.out.println("createQRcode class"+content);
			
			return new ModelAndView("qrcodeview", "content", content); 
	}
	
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String calendar(HttpSession session) {
		SchedulesVO sc1 = new SchedulesVO();
		SchedulesVO sc2 = new SchedulesVO();
		String loginId = (String) session.getAttribute("id");
		ArrayList<SchedulesVO> list = new ArrayList<SchedulesVO>();
		ArrayList<TradeVO> tradeList = new ArrayList<TradeVO>();
		try {
			list = dao3.readSchedule("dydwns8471");
			
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getTradeStatus()!=0) {
					list.get(i).setColor("#ff00ff");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (list == null) {
			list = new ArrayList<SchedulesVO>();
			list.add(sc1);
			list.add(sc2);
			
		}
		
		String bn = (String) session.getAttribute("bn");
		
		try {
			tradeList = dao2.readTrades(bn);//사용자의사업자등록번호
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("list", list);
		session.setAttribute("tradeList", tradeList);
		System.out.println(tradeList);
		return "Calendar/Calendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "tryLoginFromM", method = RequestMethod.POST)
	public String tryLoginFromM(String id, String pw)  {
		
		System.out.println("id="+id);
		logger.debug("들어와 지나요???");
		StaffVO confirm =null;
		try {
			confirm = dao4.readOneAccount(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		if (confirm==null) {
			msg = "No corresponding ID";
		}else if (!confirm.getStaffPassword().equals(pw)) {
			msg = "Password doesn't match";
		}else{
			msg = "LogIn";
		}
		
		System.out.println(msg);
		
		return msg;
	}
	
	//백업
	@ResponseBody
	@RequestMapping(value = "backUp", method = RequestMethod.POST)
	public String backUp(String scheduleList,String loginid) {
		
		try {
			System.out.println("scheduleList="+scheduleList.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
        System.out.println("loginid="+loginid);
		
		String userId;
		userId = loginid;

		//user아이디를 받아서 db데이터를 전부 지운다.
		int result = 0;
		try {
			result = dao3.deleteAllSchedule(userId);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		if (result ==0) {
			System.out.println("전체 데이터 삭제 실패");
		} else{
			System.out.println("전체 데이터 삭제 성공");
		}
		
		Gson gson = new Gson();
		String json = scheduleList;
		Type type = new TypeToken<ArrayList<SchedulesVO>>() {}.getType();
		ArrayList<SchedulesVO> List = new ArrayList<SchedulesVO>();
		List = gson.fromJson(json, type);
		
		
		
		int result2 = 0;
		for (int i = 0; i < List.size(); i++) {
			SchedulesVO fromlist = List.get(i);
			fromlist.setStartTime(fromlist.getStartTime().replace("/", "-"));
			fromlist.setStaffId(userId);
			
			try {
				result2 = dao3.insertSchedule(fromlist);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			if (result2==0) {
				System.out.println("입력 실패!");
			}
		}
		
		
		/*// 여기
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		Map<Object, Object> ScheduleMap; // 가져온 친구
		ArrayList<Map<Object, Object>> scList = new ArrayList<Map<Object, Object>>();
		int num = 0;
		for(int i=0;i<List.size();i++){
			
			Schedule fromList = List.get(i);
			System.out.println(fromList.toString());
			ScheduleMap = new HashMap<Object, Object>();
			//ScheduleMap.put("scheduleNum", num);
			System.out.println(fromList.getId());
			
			ScheduleMap.put("num", 0);
			ScheduleMap.put("id", fromList.getId());
			ScheduleMap.put("title", fromList.getTitle());
			ScheduleMap.put("startTime", fromList.getStartTime());
			ScheduleMap.put("endTime", fromList.getEndTime());
			
	        scList.add(ScheduleMap);*/
	 
	    
		//paramMap.put("scList", scList);
		
		/*int result2 = 0;
		try {
			result2 = dao.insertList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
		}*/
		
		
		String msg = "";
		if (result2==0) {
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		System.out.println(msg);
		
		return msg;
	}
	
	//synchronization

	@ResponseBody
	@RequestMapping(value = "synchronization", method = RequestMethod.POST)
	public String synchronization(String loginid) {
		
		ArrayList<SchedulesVO> list = dao3.readSchedule(loginid);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStartTime(list.get(i).getStartTime().replace("-", "/"));
			
		}
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		return result;
	}
}
