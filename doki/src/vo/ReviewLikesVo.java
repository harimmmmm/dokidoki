package vo;

public class ReviewLikesVo {
	
	 private int like_id;       // 리뷰 좋아요/싫어요 ID
	 private int review_id;     // 리뷰번호
	 private int account_id;    // 계정 고유번호
	 private String like_type;	// 평점타
	 
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getLike_type() {
		return like_type;
	}
	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
	 
}
