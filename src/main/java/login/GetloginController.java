package login;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import user.MemberDAO;
import user.MemberVO;

public class GetloginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setPhone(phone);
		vo.setAddress(address);

		MemberDAO memberDAO = new MemberDAO();

		List<MemberVO> memberList = memberDAO.getMemberList();

		request.setAttribute("memberList", memberList);

		return "/jsp/login/mypage.jsp";

	}
}