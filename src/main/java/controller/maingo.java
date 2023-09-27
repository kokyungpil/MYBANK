package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class maingo implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {


		return "/jsp/login/main.jsp"; 
	}

}
