package productcontroller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import product.ProductDAO;
import product.ProductVO;

public class sendmoneyproductController implements Controller {

    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String acnum = request.getParameter("acnum");
        String acmoney = request.getParameter("acmoney");

        ProductVO vo = new ProductVO();
        vo.setAcnum(acnum);
        vo.setAcmoney(acmoney);

        ProductDAO dao = new ProductDAO();
        dao.sendproduct(vo);

        return "getpd.do";
    }
}






