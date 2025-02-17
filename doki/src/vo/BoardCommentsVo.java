package vo;

public class BoardCommentsVo {
	
	 private int comment_id;			// 댓글 ID
	 private int bno;                   // 게시글번호
	 private int account_id;            // 계정 고유번호
	 private String comment_content;    // 댓글내용
	 private String comment_date;       // 댓글작성일
	 
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
}
