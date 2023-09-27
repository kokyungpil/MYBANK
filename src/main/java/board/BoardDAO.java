package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static final String POSTING = "insert into b_posts(post_no, user_id, content, post_title, post_permission, post_hit) values(sequence_postNo.nextval, ?, ?, ?, ?, 0)";
	
	private static final String POSTING2 = "insert into ab_comment (user_id, B_comment)" + " values( ?, ?) ";
	
	private static final String POSTING3 = "insert into b_posts(post_no, user_id, content, post_title, post_permission, post_hit) values(2, ?, ?, ?, ?, 0)";
	
	private static final String GET_POST = "select * from b_posts where post_no = ?";
	
	private static final String GET_POSTK = "select * from b_posts where post_no = 2";
	
	private static final String GET_POST2 = "select * from ab_comment";
	
	private static final String GET_BOARD = "select * from b_posts order by post_no";
	
	public void posting(BoardVO board) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(POSTING);
			stmt.setString(1, board.getWriter());
			stmt.setString(2, board.getContent());
			stmt.setString(3, board.getTitle());
			stmt.setInt(4, board.getPostPermission());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// Handle or throw the exception appropriately
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void posting2(BoardVO board) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(POSTING2);
			stmt.setString(1, board.getWriter());
			stmt.setString(2, board.getComment());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void posting3(BoardVO board) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(POSTING3);
			stmt.setString(1, board.getWriter());
			stmt.setString(2, board.getContent());
			stmt.setString(3, board.getTitle());
			stmt.setInt(4, board.getPostPermission());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// Handle or throw the exception appropriately
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	
	public BoardVO getPost(BoardVO vo) {
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(GET_POST);
			stmt.setInt(1, vo.getPostNo());
			rs = stmt.executeQuery();

			if (rs.next()) {
				board = new BoardVO();
				board.setPostNo(rs.getInt("post_no"));
				board.setWriter(rs.getString("user_id"));
				board.setTitle(rs.getString("post_title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getString("post_reg_date"));
				board.setPostPermission(rs.getInt("post_permission"));
				board.setHit(rs.getInt("post_hit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle or throw the exception appropriately
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}
	
	public BoardVO getPostk(BoardVO vo) {
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(GET_POSTK);
			rs = stmt.executeQuery();

			if (rs.next()) {
				board = new BoardVO();
				board.setPostNo(rs.getInt("post_no"));
				board.setWriter(rs.getString("user_id"));
				board.setTitle(rs.getString("post_title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getString("post_reg_date"));
				board.setPostPermission(rs.getInt("post_permission"));
				board.setHit(rs.getInt("post_hit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle or throw the exception appropriately
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}
	
	
	public List<BoardVO> getPost2() {
	    List<BoardVO> commentList = new ArrayList<>();

	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(GET_POST2);
	        rs = stmt.executeQuery();
	        
	        while (rs.next()) {
	            BoardVO comment = new BoardVO();
	            comment.setWriter(rs.getString("user_id"));
	            comment.setComment(rs.getString("b_comment"));
	            comment.setCommentdate(rs.getString("comment_date"));
	            
	            commentList.add(comment); // Add the comment to the commentList
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, stmt, conn);
	    }
	    
	    return commentList;
	}
	

	public List<BoardVO> getBoardList(BoardVO vo) {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(GET_BOARD);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setPostNo(rs.getInt("post_no"));
				board.setWriter(rs.getString("user_id"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getString("post_reg_date"));
				board.setTitle(rs.getString("post_title"));
				board.setPostPermission(rs.getInt("post_permission"));
				board.setHit(rs.getInt("post_hit"));

				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle or throw the exception appropriately
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}
}
