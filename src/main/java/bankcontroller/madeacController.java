package bankcontroller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.BankDAO;
import bank.BankVO;
import controller.Controller;

public class madeacController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String ac_num = request.getParameter("ac_num");
		String ac_name = request.getParameter("ac_name");
		String id = request.getParameter("id");
		String bankcode = request.getParameter("bankcode");
		String acpw = request.getParameter("acpw");
		String acmadedate = request.getParameter("acmadedate");

		BankVO vo = new BankVO();
		vo.setAc_num(ac_num);
		vo.setAc_name(ac_name);
		vo.setId(id);
		vo.setBankcode(bankcode);
		vo.setAcpw(acpw);
		vo.setAcmadedate(acmadedate);

		BankDAO dao = new BankDAO();
		dao.insertaccount(vo);
		
		return "/jsp/bank/madeaccount.jsp";
	}

}
