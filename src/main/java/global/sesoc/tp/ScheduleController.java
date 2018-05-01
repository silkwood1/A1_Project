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
		
		System.out.println("staffId = "+staffId);
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		String bn = (String)session.getAttribute("bn");
		
		ArrayList<SchedulesVO> scheduleList = null;
		SchedulesVO sample = new SchedulesVO();
		sample.setUserBn(bn);
		sample.setCoordinates(coordinates);//좌표를 받아 입력
		sample.setTradeNo(tradeNo);
		sample.setSchedulesaddress(schedulesaddress);
		sample.setStaffId(staffId);
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
			
		} catch (Exception e) {
			System.out.println("db에 스케쥴 넣기 실패!");
		}
		
		return "redirect:/calendar";
		
	}
	
	@RequestMapping(value="deleteSchedule",produces = "application/text; charset=utf8",method=RequestMethod.POST)//삭제 ajax
	@ResponseBody
	public String deleteForm(int schedulesNum){
		String str = "";
		int result = 0;
		
		System.out.println("삭제할 스케쥴 번호 = "+schedulesNum);
		try {
			result = dao.deleteSchedule(schedulesNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result!=0) {
			str = "삭제성공";
		}
		return str;
	}
	
	
	
	@RequestMapping(value="updateSchedule",produces = "application/text; charset=utf8",method=RequestMethod.POST)//수정버튼을 클릭했을 때
	@ResponseBody
	public String UpdateSchedule(int schedulesNum,String staffId, int tradeNo,
			String schedulesaddress,String startTime, String title,String coordinates,
			String remark){
		int result = 0;
		String str = "";
		SchedulesVO schedules = new SchedulesVO();
		schedules.setSchedulesNum(schedulesNum);
		schedules.setStaffId(staffId);
		schedules.setTradeNo(tradeNo);
		schedules.setSchedulesaddress(schedulesaddress);
		schedules.setStartTime(startTime);
		schedules.setTitle(title);
		schedules.setCoordinates(coordinates);
		schedules.setremark(remark);
		
		System.out.println(coordinates);
		
		try {
			result = dao.UpdateSchedule(schedules);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result!=0) {
			str="수정성공";
		}
		return str;
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
