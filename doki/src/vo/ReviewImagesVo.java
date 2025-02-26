package vo;

public class ReviewImagesVo {

	private int image_id; // 이미지 고유 ID
	private int review_id; // 리뷰번호
	private String image_url; // 리뷰 이미지 URL
	private int image_order; // 이미지 표시 순서

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getImage_order() {
		return image_order;
	}

	public void setImage_order(int image_order) {
		this.image_order = image_order;
	}

}
