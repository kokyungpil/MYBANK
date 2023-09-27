package boardcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import controller.Controller;
import user.MemberVO;

public class PostingProcessController2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MemberVO uvo = (MemberVO)session.getAttribute("loginUser");
		String writer = uvo.getId();
		
		String comment = request.getParameter("comment");

		BoardVO vo = new BoardVO();
		vo.setWriter(writer);
		vo.setComment(comment);
		
		BoardDAO dao = new BoardDAO();
		dao.posting2(vo);
		
		
		return "post2.do";
	}
	
	
	

}
