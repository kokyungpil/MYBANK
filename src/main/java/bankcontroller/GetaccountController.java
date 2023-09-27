package bankcontroller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank.BankDAO;
import bank.BankVO;
import controller.Controller;
import user.MemberVO;

public class GetaccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		

		HttpSession session = request.getSession();
		
	    MemberVO uvo = (MemberVO)session.getAttribute("loginUser");
	    String id = uvo.getId();
	    
		String ac_num = request.getParameter("ac_num");
		String ac_name = request.getParameter("ac_name");
		String bankcode = request.getParameter("bankcode");
		String money = request.getParameter("money");
		

		BankVO vo = new BankVO();
		vo.setAc_num(ac_num);
		vo.setAc_name(ac_name);
		vo.setBankcode(bankcode);
		vo.setMoney(money);

		BankDAO bankDAO = new BankDAO();

		List<BankVO> bankList = bankDAO.getBankList(id);

		request.setAttribute("bankList", bankList);

		return "/jsp/bank/myaccount.jsp";

	}
}