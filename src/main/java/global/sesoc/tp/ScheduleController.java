package global.sesoc.tp;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.CustomerDAO;
import global.sesoc.tp.dao.SchedulesDAO;
import global.sesoc.tp.dao.TradeDAO;
import global.sesoc.tp.vo.CustomerVO;
import global.sesoc.tp.vo.SchedulesVO;
import global.sesoc.tp.vo.TradeVO;


@Controller
public class ScheduleController {
	
	@Autowired
	SchedulesDAO dao;
	
	@Autowired
	CustomerDAO cdao;
	
	@Autowired
	TradeDAO Tdao;
	
	@Autowired
	SqlSession sqlSession;
	
	
	

	
	
	
	@RequestMapping(value="insertSchedule",method=RequestMethod.POST)
	public String insertSchedule(String userBn,int tradeNo,String schedulesaddress,String coordinates,
			String staffId,String title,String startTime,String color,
			HttpSession session){//일정 삽입했을 때
		
		
		/*                                 
			int schedulesNum이 들어가지 않음
		 */
		ArrayList<SchedulesVO> scheduleList = null;
		SchedulesVO sample = new SchedulesVO();
		sample.setUserBn(userBn);
		sample.setCoordinates("12, 12");
		sample.setTradeNo(tradeNo);
		sample.setSchedulesaddress(schedulesaddress);
		sample.setStaffId("dydwns8471");
		sample.setTitle(title);
		sample.setStartTime(startTime);
		
		System.out.println("sample = "+sample);
		
		int result = 0;
		try {
			scheduleList = (ArrayList<SchedulesVO>)session.getAttribute("list");
		} catch (Exception e) {
			
		}
		if (scheduleList == null) {
			scheduleList = new ArrayList<SchedulesVO>();
		}
		
		
		//db연동시 스케쥴을 삽입한다.
		try {
			result = dao.insertSchedule(sample);
			scheduleList.add(sample);
		} catch (Exception e) {
			System.out.println("db에 스케쥴 넣기 실패!");
		}
		
		session.setAttribute("list", scheduleList);
		return "redirect:/calendar";
		
	}
	
	@RequestMapping(value="deleteForm")//삭제,수정폼으로 이동
	public String deleteForm(HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		//id에 맞는 스케쥴 불러온다
		ArrayList<SchedulesVO> list = dao.readSchedule(loginId);
		System.out.println(list);
		session.setAttribute("list", list);
		return "Calendar/deleteForm";
	}
	
	@RequestMapping(value="updateForm")//수정폼으로 이동
	public String updateForm(int scheduleNum,Model model){
		SchedulesVO schedule = dao.readOneSchedule(scheduleNum);
		model.addAttribute("schedule",schedule);
		
		return "Calendar/updateForm";
	}
	
	@RequestMapping(value="UpdateSchedule",method=RequestMethod.POST)//수정버튼을 클릭했을 때
	@ResponseBody
	public void UpdateSchedule(SchedulesVO schedule){
		int result = 0;
		System.out.println("업데이트컨트롤");
		System.out.println(schedule);
		System.out.println(schedule.getSchedulesNum());
		
		result = dao.UpdateSchedule(schedule);
		if (result!=0) {
			
		}
	}
	
	@RequestMapping(value="gettingAddr",produces = "application/text; charset=utf8",method=RequestMethod.POST)
	@ResponseBody
	public String jsontest(int tradeSampleNo){
		String str="";
		String tradeNo = Integer.toString(tradeSampleNo);
		//거래에서 고객 번호를 뽑고
		System.out.println("tradeSampleNo = "+tradeSampleNo);
		//고객정보를 dao에서 불러와서 거기서 고객의 주소 추출
		CustomerVO customer = new CustomerVO();
		
		try {
			customer = cdao.get_user(tradeNo);
			System.out.println("customer = "+customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		str = customer.getCustomerAddress();
		System.out.println("str = "+str);
		return str;
	}
	
}
