package bankcontroller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.BankDAO;
import bank.BankVO;
import controller.Controller;

public class GethistoryController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String ac_num = request.getParameter("ac_num");
		String historyname = request.getParameter("Historyname");
		String historytime = request.getParameter("Historytime");
		String historymoney = request.getParameter("Historymoney");

		BankVO vo = new BankVO();
		vo.setAc_num(ac_num);
		vo.setHistoryname(historyname);
		vo.setHistorytime(historytime);
		vo.setHistorymoney(historymoney);

		BankDAO bankDAO = new BankDAO();

		List<BankVO> historyList = bankDAO.getHistoryList(ac_num);

		request.setAttribute("historyList", historyList);

		return "/jsp/bank/sendmoneyhistory.jsp";
	}
}