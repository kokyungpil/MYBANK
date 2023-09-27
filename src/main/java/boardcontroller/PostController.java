package boardcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
import controller.Controller;

public class PostController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String postNo = request.getParameter("postNo");
		
		BoardVO vo = new BoardVO();
		vo.setPostNo(Integer.parseInt(postNo));
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getPost(vo);
		request.setAttribute("post", board);
		
		
		List<BoardVO> commentList = dao.getPost2();
		request.setAttribute("commentList", commentList);

		return "/jsp/board/post.jsp";
	}
	
	

}
