package global.sesoc.tp.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("Calendar")
public class CalendarController {

	@RequestMapping(value="MainCalendar", method=RequestMethod.GET)
	public String mainCalendar() {
		
		return "/calendar/mainCalendar"; 
	}
	
	
}
