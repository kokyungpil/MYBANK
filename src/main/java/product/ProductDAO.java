package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bank.BankVO;
import common.JDBCUtil;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String PRODUCTDATA_INSERT = "insert into FINANCIAL_PRODUCT(pd_number, pd_name, user_id, ac_number, ac_money, pd_made_date) " + " values( ?, ?, ?, ?, 0, ?) ";

	private static String GET_PRODUCT = "select * from FINANCIAL_PRODUCT where user_id=? ";
	
	private static String MONEY_SEND2 = "UPDATE ACCOUNT SET ac_money = ac_money - ? WHERE ac_number = ?";

	private static String MONEY_RECEIVE2 = "UPDATE FINANCIAL_PRODUCT SET ac_money = ac_money + ? WHERE ac_number = ?";
	
	// 상품 정보 디비에 추가
	public void insertproduct(ProductVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PRODUCTDATA_INSERT);
			stmt.setString(1, vo.getPdcode());
			stmt.setString(2, vo.getPdname());
			stmt.setString(3, vo.getId());
			stmt.setString(4, vo.getAcnum());
			stmt.setString(5, vo.getPdmadedate());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//상품 정보 가져오기
		public List<ProductVO> getProductList(String id) {
			
			
		    List<ProductVO> productList = new ArrayList<>();

		    try {
		        conn = JDBCUtil.getConnection();
		        stmt = conn.prepareStatement(GET_PRODUCT);
		        stmt.setString(1, id);


		        rs = stmt.executeQuery();

		        while (rs.next()) {
		            ProductVO product = new ProductVO();
		            product.setPdcode(rs.getString("pd_number"));
		            product.setPdname(rs.getString("pd_name"));
		            product.setAcnum(rs.getString("ac_number"));
		            product.setAcmoney(rs.getString("ac_money"));
		            product.setPdmadedate(rs.getString("pd_made_date"));

		            productList.add(product);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(rs, stmt, conn);
		    }

		    return productList;
		}
		
		
		//상품에 돈넣기
		public void sendproduct(ProductVO vo) {
		    try {
		        conn = JDBCUtil.getConnection();

		        // 보내는 계좌에서 돈을 빼는 쿼리 실행
		        PreparedStatement sendStmt = conn.prepareStatement(MONEY_SEND2);
		        sendStmt.setString(1, vo.getAcmoney());
		        sendStmt.setString(2, vo.getAcnum());
		        sendStmt.executeUpdate();
		        sendStmt.close();

		        // 받는 계좌에 돈을 추가하는 쿼리 실행
		        PreparedStatement receiveStmt = conn.prepareStatement(MONEY_RECEIVE2);
		        receiveStmt.setString(1, vo.getAcmoney());
		        receiveStmt.setString(2, vo.getAcnum());
		        receiveStmt.executeUpdate();
		        receiveStmt.close();
		        

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(stmt, conn);
		    }
		}
		
}