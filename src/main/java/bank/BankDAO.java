package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class BankDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String BANKDATA_INSERT = "insert into ACCOUNT( ac_number, ac_name, user_id, ac_money, bank_cd, ac_pw, ac_op_date) " + " values( ?, ?, ?, 0, ?, ?, ?) " ;
	
	private static String MONEY_INSERT = "UPDATE ACCOUNT SET ac_money = ac_money + ? WHERE ac_number = ?";
	
	private static String MONEY_SEND = "UPDATE ACCOUNT SET ac_money = ac_money - ? WHERE ac_number = ?";
	
	private static String MONEY_RECEIVE = "UPDATE ACCOUNT SET ac_money = ac_money + ? WHERE ac_number = ?";
	
	private static String MONEY_SEND_HISTORY = "insert into accounthistory ( ac_number1, ac_number2, history_name,  history_money)" + " values( ?, ?, '출금', ?) " ;
	
	private static String MONEY_RECEIEVE_HISTORY = "insert into accounthistory ( ac_number1, ac_number2, history_name, history_money)" + " values( ?, ?, '입금', ?) " ;
	
	private static String CHECK_PASSWORD = "SELECT COUNT(*) FROM ACCOUNT WHERE ac_number = ? AND ac_pw = ?";

	private static String GET_ACCOUNT = "select * from ACCOUNT where user_id=? ";

	private static String GET_HISTORY = "select * from accounthistory where ac_number1=? ";
	
	
	

	// 계좌 정보 디비에 추가
	public void insertaccount(BankVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BANKDATA_INSERT);
			stmt.setString(1, vo.getAc_num());
			stmt.setString(2, vo.getAc_name());
			stmt.setString(3, vo.getId());
			stmt.setString(4, vo.getBankcode());
			stmt.setString(5, vo.getAcpw());
			stmt.setString(6, vo.getAcmadedate());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	// 계좌에 돈 넣기 
	public void insertmoney(BankVO vo) {
	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(MONEY_INSERT);
	        stmt.setString(1, vo.getMoney());
	        stmt.setString(2, vo.getAc_num());
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(stmt, conn);
	    }
	}
	
	public void sendMoney(BankVO vo) {
	    try {
	        conn = JDBCUtil.getConnection();

	        // 보내는 계좌에서 돈을 빼는 쿼리 실행
	        PreparedStatement sendStmt = conn.prepareStatement(MONEY_SEND);
	        sendStmt.setString(1, vo.getMoney());
	        sendStmt.setString(2, vo.getAc_num());
	        sendStmt.executeUpdate();
	        sendStmt.close();

	        // 받는 계좌에 돈을 추가하는 쿼리 실행
	        PreparedStatement receiveStmt = conn.prepareStatement(MONEY_RECEIVE);
	        receiveStmt.setString(1, vo.getMoney());
	        receiveStmt.setString(2, vo.getAc_num2());
	        receiveStmt.executeUpdate();
	        receiveStmt.close();
	        
	     // 비밀번호 확인 쿼리 실행   지금 비밀번호 확인이 안됌  교수님이 트렌젝션 뭐시기 롤벡을 하라고함
	        PreparedStatement checkStmt = conn.prepareStatement(CHECK_PASSWORD);
	        checkStmt.setString(1, vo.getAc_num());
	        checkStmt.setString(2, vo.getAcpw());
	        ResultSet checkResult = checkStmt.executeQuery();
	        checkResult.next();
	        int passwordMatchCount = checkResult.getInt(1);
	        checkResult.close();
	        checkStmt.close();

	        if (passwordMatchCount == 0) {
	            // 비밀번호가 일치하지 않는 경우에 대한 처리
	            // 예외를 던지거나 에러 메시지를 처리할 수 있습니다.
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(stmt, conn);
	    }
	}
	
	
	//출금기록저장
	
	public void sendhistory(BankVO vo) {
	    try {
	        conn = JDBCUtil.getConnection();

	        
	        PreparedStatement send2Stmt = conn.prepareStatement(MONEY_SEND_HISTORY);
	        send2Stmt.setString(1, vo.getAc_num());
	        send2Stmt.setString(2, vo.getAc_num2());
	        send2Stmt.setString(3, vo.getMoney());
	        send2Stmt.executeUpdate();
	        send2Stmt.close();


	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(stmt, conn);
	    }
	}
	
	
	//입금기록저장
	
	public void receievehistory(BankVO vo) {
	    try {
	        conn = JDBCUtil.getConnection();


	        // 받는 계좌에 돈을 추가하는 쿼리 실행
	        PreparedStatement receive2Stmt = conn.prepareStatement(MONEY_RECEIEVE_HISTORY);
	        receive2Stmt.setString(1, vo.getAc_num2());
	        receive2Stmt.setString(2, vo.getAc_num());
	        receive2Stmt.setString(3, vo.getMoney());
	        receive2Stmt.executeUpdate();
	        receive2Stmt.close();
	        

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(stmt, conn);
	    }
	}
	
	
	
	//계좌 정보 가져오기
	public List<BankVO> getBankList(String id) {
		
		
	    List<BankVO> bankList = new ArrayList<>();

	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(GET_ACCOUNT);
	        stmt.setString(1, id);


	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            BankVO bank = new BankVO();
	            bank.setAc_num(rs.getString("ac_number"));
	            bank.setAc_name(rs.getString("ac_name"));
	            bank.setBankcode(rs.getString("bank_cd"));
	            bank.setMoney(rs.getString("ac_money"));

	            bankList.add(bank);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, stmt, conn);
	    }

	    return bankList;
	}
	
	
	//계좌 거래내역 정보 가져오기
		public List<BankVO> getHistoryList(String ac_num2) {
			
			
		    List<BankVO> historyList = new ArrayList<>();

		    try {
		        conn = JDBCUtil.getConnection();
		        stmt = conn.prepareStatement(GET_HISTORY);
		        stmt.setString(1, ac_num2);


		        rs = stmt.executeQuery();

		        while (rs.next()) {
		            BankVO bank = new BankVO();
		            bank.setAc_num(rs.getString("ac_number2"));
		            bank.setHistoryname(rs.getString("history_name"));
		            bank.setHistorytime(rs.getString("historytime"));
		            bank.setHistorymoney(rs.getString("history_money"));

		            historyList.add(bank);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(rs, stmt, conn);
		    }

		    return historyList;
		}
	
	

}
