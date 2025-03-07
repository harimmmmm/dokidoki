package vo;

public class ReviewVo {
	
	 private int review_id;         // 리뷰번호
	 private String package_id;        // 패키지 고유 번호
	 private int account_id;        // 계정 고유번호
	 private String review_date;	// 작성날짜
	 private String content;        // 글내용
	 private String rating;			// 별점
	 private double totrating;		// 총별점
	 private int totreivew;
	 private String user_id;
	 
	 
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotreivew() {
		return totreivew;
	}
	public void setTotreivew(int totreivew) {
		this.totreivew = totreivew;
	}
	public double getTotrating() {
		return totrating;
	}
	public void setTotrating(double totrating) {
		this.totrating = totrating;
	}
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
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
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	 
}
