package board;

public class BoardVO {

	private int postNo;
	private String writer;
	private String content;
	private String regDate;
	private String title;
	private String reply;
	private String comment;
	private String commentdate;
	private String writeid;
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getWriter() {
		return writer;
	}
	@Override
	public String toString() {
		return "BoardVO [postNo=" + postNo + ", writer=" + writer + ", content=" + content + ", regDate=" + regDate
				+ ", title=" + title + ", reply=" + reply + ", comment=" + comment + ", commentdate=" + commentdate
				+ ", writeid=" + writeid + ", postPermission=" + postPermission + ", hit=" + hit + "]";
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public BoardVO(int postNo, String writer, String content, String regDate, String title, String reply,
			String comment, String commentdate, String writeid, int postPermission, int hit) {
		super();
		this.postNo = postNo;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.title = title;
		this.reply = reply;
		this.comment = comment;
		this.commentdate = commentdate;
		this.writeid = writeid;
		this.postPermission = postPermission;
		this.hit = hit;
	}
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentdate() {
		return commentdate;
	}
	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}
	public String getWriteid() {
		return writeid;
	}
	public void setWriteid(String writeid) {
		this.writeid = writeid;
	}
	public int getPostPermission() {
		return postPermission;
	}
	public void setPostPermission(int postPermission) {
		this.postPermission = postPermission;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	private int postPermission;
	private int hit;
}