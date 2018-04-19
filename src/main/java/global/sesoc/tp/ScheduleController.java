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

import global.sesoc.tp.vo.ScheduleVO;


@Controller
public class ScheduleController {
	
	/*@Autowired
	ScheduleDAO dao;*/
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="scheduleForm",method=RequestMethod.POST)
	public String insertScheduleForm(ScheduleVO schedule,HttpSession session){
		//아이디 받아서 리스트를 받아 세션으로 넘긴다.
		//session.getAttribute("loginId");
		session.setAttribute("",schedule);
		return "Calendar/scheduleForm";
	}
	
	@RequestMapping(value="insertSchedule")
	@ResponseBody
	public String insertSchedule(ScheduleVO schedule,HttpSession session){//일정 삽입했을 때
		ArrayList<ScheduleVO> scheduleList = null;
		try {
			scheduleList = (ArrayList<ScheduleVO>)session.getAttribute("list");
		} catch (Exception e) {
			
		}
		if (scheduleList == null) {
			scheduleList = new ArrayList<ScheduleVO>();
		}
		scheduleList.add(schedule);
		
		//db연동시 스케쥴을 삽입한다.
		//result = dao.insertSchedule(schedule);
		
		session.setAttribute("list", scheduleList);
		return "redirect:../calendar";
		
	}
	
	@RequestMapping(value="deleteForm")//삭제,수정폼으로 이동
	public String deleteForm(HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		//id에 맞는 스케쥴 불러온다
		/*ArrayList<ScheduleVO> list = dao.readSchedule(loginId);
		System.out.println(list);
		session.setAttribute("list", list);*/
		return "Calendar/deleteForm";
	}
	
	@RequestMapping(value="updateForm")//수정폼으로 이동
	public String updateForm(int scheduleNum,Model model){
		/*ScheduleVO schedule = dao.readOneSchedule(scheduleNum);
		model.addAttribute("schedule",schedule);*/
		
		return "Calendar/updateForm";
	}
	
	@RequestMapping(value="UpdateSchedule",method=RequestMethod.POST)//수정버튼을 클릭했을 때
	@ResponseBody
	public void UpdateSchedule(ScheduleVO schedule){
		int result = 0;
		System.out.println("업데이트컨트롤");
		System.out.println(schedule);
		System.out.println(schedule.getScheduleNum());
		
		/*result = dao.UpdateSchedule(schedule);
		if (result!=0) {
			
		}*/
	}
}
