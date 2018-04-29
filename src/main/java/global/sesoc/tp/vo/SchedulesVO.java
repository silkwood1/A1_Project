package global.sesoc.tp.vo;

public class SchedulesVO {
	  private String userBn;//    v
	  private int tradeNo;//   v
	  private String schedulesaddress; // v                                              
	  private String coordinates;//      v                                       
	  private String staffId;//     v
	  private String title;//          v                                      
	  private String startTime;//      v                                          
	  private int schedulesNum;//      v                                
	  private int tradeStatus;//     v                                            
	  private String color;//         v

	  public SchedulesVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SchedulesVO(String userBn, int tradeNo, String schedulesaddress, String coordinates, String staffId,
			String title, String startTime, int schedulesNum, int tradeStatus, String color) {
		super();
		this.userBn = userBn;
		this.tradeNo = tradeNo;
		this.schedulesaddress = schedulesaddress;
		this.coordinates = coordinates;
		this.staffId = staffId;
		this.title = title;
		this.startTime = startTime;
		this.schedulesNum = schedulesNum;
		this.tradeStatus = tradeStatus;
		this.color = color;
	}

	public String getUserBn() {
		return userBn;
	}

	public void setUserBn(String userBn) {
		this.userBn = userBn;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getSchedulesaddress() {
		return schedulesaddress;
	}

	public void setSchedulesaddress(String schedulesaddress) {
		this.schedulesaddress = schedulesaddress;
	}

	public String getCoordinates() {
		return coordinates;
	}

	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
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

	public int getSchedulesNum() {
		return schedulesNum;
	}

	public void setSchedulesNum(int schedulesNum) {
		this.schedulesNum = schedulesNum;
	}

	public int getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(int tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public int getColor() {//컬러를 확인 할 때 거래 상태를 물어본다.
		return this.tradeStatus;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {//꼭 확인해주어야 함
		return "{ id : '" + staffId + 
				"', title : '" + title + 
				"', start : '"+ startTime + 
				"', color : '" + color
				+ "'}";
	}

	  
}
