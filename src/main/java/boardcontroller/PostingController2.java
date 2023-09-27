package boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
import controller.Controller;

public class PostingController2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

BoardVO vo = new BoardVO();
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getPostk(vo);
		request.setAttribute("post", board);
		

		List<BoardVO> commentList = dao.getPost2();
		request.setAttribute("commentList", commentList);

		
		return "/jsp/board/posting2.jsp";
	}

	
}
