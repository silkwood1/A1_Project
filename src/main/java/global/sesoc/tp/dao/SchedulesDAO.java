package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tp.vo.SchedulesVO;


@Repository
public class SchedulesDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public int insertSchedule(SchedulesVO schedule){
		int result = 0;
		schedule.setColor("0");
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.insertSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<SchedulesVO> readSchedule(String id){
		ArrayList<SchedulesVO> result = new ArrayList<SchedulesVO>();
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.readSchedule(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteSchedule(int scheduleNum){
		int result = 0;
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.deleteSchedule(scheduleNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int UpdateSchedule(SchedulesVO schedule){
		int result = 0;
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.UpdateSchedule(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public SchedulesVO readOneSchedule(int scheduleNum) {
		SchedulesVO schedule = new SchedulesVO();
		SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
		try {
			schedule = mapper.readOneSchedule(scheduleNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return schedule;
	}

	public int deleteAllSchedule(String id){
		int result = 0;
		SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
		try {
			
			result = mapper.deleteAllSchedule(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertList(Map<Object, Object> paramMap){
		int result = 0;
		SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
		try {
			result = mapper.insertList(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<SchedulesVO> readSchedules(String userBn){
		ArrayList<SchedulesVO> result = new ArrayList<SchedulesVO>();
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.readSchedules(userBn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int UpdateStatus(SchedulesVO schedules){
		int result = 0;
		try {
			SchedulesMapper mapper = sqlsession.getMapper(SchedulesMapper.class);
			result = mapper.UpdateStatus(schedules);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
