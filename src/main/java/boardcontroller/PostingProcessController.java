package boardcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;
import controller.Controller;
import user.MemberVO;

public class PostingProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MemberVO uvo = (MemberVO)session.getAttribute("loginUser");
		String title = request.getParameter("title");
		String writer = uvo.getId();
		String content = request.getParameter("content");

		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		if(writer.equals("admin")) {
			vo.setPostPermission(0);
		}else {
			vo.setPostPermission(1);
		}
		
		BoardDAO dao = new BoardDAO();
		dao.posting(vo);
		
		
		
		
		return "boardlist.do";
	}
	
	
	

}
