package bankcontroller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bank.BankDAO;
import bank.BankVO;
import controller.Controller;

public class sendmoneyController2 implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 송금

		String ac_num1 = request.getParameter("ac_num1");
		String ac_num2 = request.getParameter("ac_num2");
		String money = request.getParameter("money");
		String ac_pw = request.getParameter("ac_pw");

		BankVO vo = new BankVO();
		vo.setMoney(money);
		vo.setAc_num(ac_num1);
		vo.setAc_num2(ac_num2);
		vo.setAcpw(ac_pw);

		BankDAO dao = new BankDAO();
		dao.sendMoney(vo);

		// 출금 기록 저장

		String ac_num3 = request.getParameter("ac_num3");
		String ac_num4 = request.getParameter("ac_num4");
		String money2 = request.getParameter("money2");

		BankVO vo1 = new BankVO();
		vo1.setAc_num(ac_num3);
		vo1.setAc_num2(ac_num4);
		vo1.setMoney(money2);

		BankDAO dao1 = new BankDAO();
		dao1.sendhistory(vo);

		// 입금 기록 저장

		String ac_num5 = request.getParameter("ac_num5");
		String ac_num6 = request.getParameter("ac_num6");
		String money3 = request.getParameter("money3");

		BankVO vo2 = new BankVO();
		vo2.setAc_num(ac_num5);
		vo2.setAc_num2(ac_num6);
		vo2.setMoney(money3);

		BankDAO dao2 = new BankDAO();
		dao2.receievehistory(vo);

		return "/jsp/bank/sendmoney2.jsp";

	}
}
