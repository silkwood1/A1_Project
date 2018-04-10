package global.sesoc.tp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
