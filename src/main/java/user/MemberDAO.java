package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String MEMBER_INSERT = "insert into user_info(user_id, password, name, birth, email, phone_number, addr) " + " values(?, ?, ?, ?, ?, ? ,?) ";

	private static String GET_MEMBER = "select * from user_info";
	
	private static String ID_CHECK = "select user_id from user_info where user_id = ? ";

	private static String MEMBER_GET = "select * from user_info where user_id =? and password=?";

	
	

	// 회원가입 시 멤버 추가
	public void insertMember(MemberVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPw());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getBirth());
			stmt.setString(5, vo.getEmail());
			stmt.setString(6, vo.getPhone());
			stmt.setString(7, vo.getAddress());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	

	// 회원가입 시 중복 아이디 체크
	public int idCheck(String id) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ID_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				// 중복 아이디
				return 0;
			} else {
				// 가입가능 아이디
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		// 데이터베이스 오류
		return -1;
	}
	

	//회원 정보 가져오기
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(GET_MEMBER);
			rs = stmt.executeQuery();

			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setId(rs.getString("user_id"));
				member.setPw(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone_number"));
				member.setAddress(rs.getString("addr"));

				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}

		return memberList;
	}

	// 로그인
	public MemberVO logIn(MemberVO vo) {
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPw());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}

}
