package global.sesoc.tp.vo;

public class ScheduleVO {
	private int scheduleNum;
	private String id;
	private String title;
	private String startTime;
	private String endTime;
	
	public ScheduleVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ScheduleVO(int scheduleNum, String id, String title, String startTime, String endTime) {
		super();
		this.scheduleNum = scheduleNum;
		this.id = id;
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "{id: '"+id+"', title: '"+title+"', start: '"+startTime+"', end: '"+endTime+"'}";
	}

	
	
	
	
	
	
}
