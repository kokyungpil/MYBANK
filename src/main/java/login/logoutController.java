package login;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import user.MemberDAO;
import user.MemberVO;

public class logoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String message = "로그아웃되었습니다.";
        request.setAttribute("message", message);

		
		return "/jsp/login/main.jsp";
	}

}