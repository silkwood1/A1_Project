package global.sesoc.tp;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tp.dao.UserDAO;
import global.sesoc.tp.email.EmailSender;
import global.sesoc.tp.vo.UserVO;

@Controller
public class EmailController {

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private UserDAO dao;

	@ResponseBody
	@RequestMapping(value = "pw_search", method = RequestMethod.POST)
	public int sendEmailAction(@RequestBody UserVO vo) throws Exception {
		String bn = ""; 
		bn = dao.get_bn(vo);
		if(bn == null || bn.equals("")){
			return 2;
		}
		UserVO user = new UserVO();
		user = dao.get_user(bn);
		if (user == null) {
			return 2;
		}
		String test = "abc"; // 뭔지 모르겠지만 필요없는듯?
		String subject = "비밀번호 찾기 결과 메일입니다."; // 제목
		String text = vo.getUserName() + "님 반갑습니다!<br><br><br>아이디 : " + user.getUserId() + "<br>비밀번호 : "
				+ user.getUserPassword(); // 내용 띄어쓰기는 <br>
		String e_mail = vo.getUserEmail(); // 사용자 이메일 기입
		if (emailSender.sendMail(test, e_mail, subject, text)) {
			return 1;
		} else {
			return 2;
		}
	}

	// 회원 탈퇴
	@ResponseBody
	@RequestMapping(value = "goodbye_user", method = RequestMethod.POST)
	public int goodbye(@RequestBody UserVO vo) throws FileNotFoundException, URISyntaxException {
		int a = 0;
		Random r = new Random();
		a = r.nextInt(999999) + 1; //난수 생성
		//vo의 비밀번호와 실제 비밀번호가 맞는지 체크해야함!!! 중요
		String test = "abc"; // 뭔지 모르겠지만 필요없는듯?
		String subject = "회원탈퇴 확인 메일입니다."; // 제목
		String text = vo.getUserName() + "님 반갑습니다!<br><br><br>"
				+ "아이디 : " + vo.getUserId() + "<br><br>회원탈퇴 확인 문자 : "
				+ a + "<br>위의 문자를 입력하면 회원탈퇴가 처리됩니다."; // 내용 띄어쓰기는 <br>
		String e_mail = vo.getUserEmail(); // 사용자 이메일 기입
		if (emailSender.sendMail(test, e_mail, subject, text)) {
			return a;
		} else {
			return 0;
		}
	}

}
