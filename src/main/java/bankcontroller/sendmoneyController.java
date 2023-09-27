package bankcontroller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.BankDAO;
import bank.BankVO;
import controller.Controller;

public class sendmoneyController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
	        request.setCharacterEncoding("utf-8");
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }

	    String ac_num = request.getParameter("ac_num");
	    String money = request.getParameter("money");

	    BankVO vo = new BankVO();
	    vo.setMoney(money);
	    vo.setAc_num(ac_num);

	    BankDAO dao = new BankDAO();
	    dao.insertmoney(vo);

	    return "/jsp/bank/sendmoney.jsp";
	}

}
