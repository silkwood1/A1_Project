package global.sesoc.tp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import global.sesoc.tp.dao.StaffDAO;

@Controller
@RequestMapping("staff")
public class StaffController {
	
	@Autowired
	private StaffDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	

}
