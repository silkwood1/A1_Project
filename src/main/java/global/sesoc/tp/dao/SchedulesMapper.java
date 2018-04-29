package global.sesoc.tp.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.tp.vo.SchedulesVO;


public interface SchedulesMapper {
	int insertSchedule(SchedulesVO schedule);
	ArrayList<SchedulesVO> readSchedule(String id);
	int deleteSchedule(int scheduleNum);
	SchedulesVO readOneSchedule(int scheduleNum);
	int UpdateSchedule(SchedulesVO schedule);
	int deleteAllSchedule(String id);
	int insertList(Map<Object, Object> paramMap);
}
