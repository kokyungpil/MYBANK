package productcontroller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import product.ProductDAO;
import product.ProductVO;

public class madepdController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String pdcode = request.getParameter("pdcode");
		String pdname = request.getParameter("pdname");
		String id = request.getParameter("id");
		String acnum = request.getParameter("acnum");
		String pdmadedate = request.getParameter("pdmadedate");

		ProductVO vo = new ProductVO();
		vo.setPdcode(pdcode);
		vo.setPdname(pdname);
		vo.setId(id);
		vo.setAcnum(acnum);
		vo.setPdmadedate(pdmadedate);

		ProductDAO dao = new ProductDAO();
		dao.insertproduct(vo);
		
		return "/jsp/bank/financialmarketmade.jsp";
	}

}
