package global.sesoc.tp.staff;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.tp.dao.StaffDAO;
import global.sesoc.tp.staff.util.FileService;
import global.sesoc.tp.vo.StaffVO;


@Controller
@RequestMapping("staff")
public class StaffController {
	@Autowired
	private StaffDAO dao;

	// 나중에 톰캣이 사용하는 파일경로가 있습니다... 그걸로 바꿔주세요....
	final String uploadPath = "C:/Users/user/A1_Project/A1_Project/src/main/webapp/resources/images";	//파일 업로드 경로

	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	@RequestMapping(value = "/stafflist", method = RequestMethod.GET)
	public String StafflistBoard(Model model, HttpSession session) {
		
		String bn = (String) session.getAttribute("bn");
		
		
		ArrayList<StaffVO> staffList = new ArrayList<StaffVO>();

		staffList = dao.staffList(bn);
		
		for (StaffVO staffVO : staffList) {
			staffVO.setSavedfile(uploadPath + "/" + staffVO.getSavedfile());
			logger.debug(staffVO.getSavedfile());
		}

		model.addAttribute("slist", staffList);
		System.out.println(staffList);

		return "/staff/stafflist";
	}

	@RequestMapping(value = "EditStaff", method = RequestMethod.GET)
	public String goEditTrade(Model model, HttpSession session) {

		return "/staff/EditStaff";
	}

	//스탭저장
	@RequestMapping (value="join_staff", method=RequestMethod.POST)
	public String write(
			StaffVO staff, 
			MultipartFile upload,
			HttpSession session, 
			Model model) {
		
		//세션에서 로그인한 사용자의 아이디를 읽어서 staff객체의 작성자 정보에 세팅
		String bn = (String) session.getAttribute("bn");
		staff.setUserBn(bn);
		System.out.println(staff);
		System.out.println(upload);
		
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 staff객체에 세팅
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			staff.setOriginalfile(upload.getOriginalFilename());
			
			staff.setSavedfile(savedfile);
			System.out.println(savedfile);
		}

		dao.staff_profile(staff);
		model.addAttribute("staff",staff);
;
		return "redirect:stafflist";
	}

	// 주소 검색
	@RequestMapping(value = "addr_insert", method = RequestMethod.GET)
	public String addr() {

		return "addr_insert";
	}

	@RequestMapping(value = "addr_insert", method = RequestMethod.POST)
	public String addr2() {

		return "addr_insert";
	}
	
	@RequestMapping(value="idcheck", method=RequestMethod.GET)
	public String idcheck(Model model) {
		//검색 전후 확인용
		model.addAttribute("search", false);
		return "staff/idcheck";
	}
	/* ID 중복 검사
	 */
	/*@RequestMapping(value="idcheck", method=RequestMethod.POST)
	public String idcheck(String staffId,Model model, HttpSession session) {
		System.out.println("111");
		String bn = (String) session.getAttribute("bn");
		
		//ID 검색
		
		//String id = dao.getId(bn);
		
		System.out.println(s);
		System.out.println(s.getStaffId());
		//검색ID와 검색 결과, 검색전후 확인용 값 저장
		if(bn != null) // 사용 가능
		{
			model.addAttribute("search", true);
			model.addAttribute("searchResult",id);
			model.addAttribute("searchId",staffId);
		}
		else // 사용 불가
		{
			model.addAttribute("search", true);
			model.addAttribute("searchResult",null);
			model.addAttribute("searchId",staffId);
		}
			
		
		return "staff/idcheck";
	}*/
	
	@RequestMapping(value = "memberimg", method = RequestMethod.GET)
	public String memberimg(String strurl,HttpServletResponse response) {
		String fullpath = strurl;
		if(strurl != null && !strurl.isEmpty() && strurl.length() != 0){
			FileInputStream filein = null;
			ServletOutputStream fileout = null;
			try {
				filein = new FileInputStream(fullpath);
				fileout = response.getOutputStream();
				FileCopyUtils.copy(filein, fileout);			
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	//회원 정보 페이지 이동
	@RequestMapping(value="updateStaff", method= RequestMethod.GET)
	public String openUpdate(Model m, int staffNo){
		StaffVO staff = new StaffVO();
		staff =dao.getInfo(staffNo);

		m.addAttribute("staff", staff);
		return "/staff/updateStaff";
	}
	//회원 정보 수정
	@RequestMapping(value="update_staff", method = RequestMethod.POST)
	public String update(StaffVO staff,HttpSession session , Model m ,MultipartFile upload){
		
		//수정 시 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
		if (!upload.isEmpty()) {
			//기존 글에 첨부된 파일의 실제 저장된 이름
			String savedfile = staff.getSavedfile();
			//기존 파일이 있으면 삭제
			if (savedfile != null) {
				FileService.deleteFile(uploadPath + "/" + savedfile);
			}
			
			//새로 업로드한 파일 저장
			savedfile = FileService.saveFile(upload, uploadPath);
			
			//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
			staff.setOriginalfile(upload.getOriginalFilename());
			staff.setSavedfile(savedfile);
		}
		int result = dao.update_staff_profile(staff);
		if(result == 0){
			System.out.println("저장 안됨");
		}
		
		m.addAttribute("staff", staff);
		return "redirect:stafflist";
	}
	
	@RequestMapping(value="deleteStaff" , method=RequestMethod.GET)
	public String delete(StaffVO staff,int staffNo,HttpSession session){
		String bn = (String) session.getAttribute("bn");
		System.out.println(staff.getStaffNo());
		staff.setStaffNo(staff.getStaffNo());
		staff.setUserBn(bn);
		
		String savedfile = dao.getInfo(staff.getStaffNo()).getSavedfile();
		
		int result = dao.delete_staff_profile(staff);
		
		if(result == 1 && savedfile != null){
			FileService.deleteFile(uploadPath+"/"+savedfile);
		}
		
		return "redirect:stafflist";
	}

}