package boardcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class PostingController3 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		
		return "/jsp/board/posting.jsp";
	}

	
}
