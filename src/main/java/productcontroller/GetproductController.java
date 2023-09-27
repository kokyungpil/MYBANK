package productcontroller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import product.ProductDAO;
import product.ProductVO;
import user.MemberVO;

public class GetproductController implements Controller {

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
	    
		String pdcode = request.getParameter("pdcode");
		String pdname = request.getParameter("pdname");
		String acnum = request.getParameter("acnum");
		String acmoney = request.getParameter("acmoney");
		String pdmadedate = request.getParameter("pdmadedate");
		

		ProductVO vo = new ProductVO();
		vo.setPdcode(pdcode);
		vo.setPdname(pdname);
		vo.setAcnum(acnum);
		vo.setAcmoney(acmoney);
		vo.setPdmadedate(pdmadedate);

		ProductDAO productDAO = new ProductDAO();

		List<ProductVO> productList = productDAO.getProductList(id);

		request.setAttribute("productList", productList);

		return "/jsp/login/myproductpage.jsp";

	}
}