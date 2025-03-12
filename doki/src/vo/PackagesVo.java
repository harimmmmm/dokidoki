package vo;

public class PackagesVo {
	
	 private String package_id;            // 패키지 고유 번호
	 private String category_name;           // 여행지(목적지)
	 private String package_name;       // 패키지명
	 private int package_price;         // 성인 가격
	 private String package_info;       // 패키지 설명
	 private String provider;           // 여행사 정보
	 private String review_id;          // 리뷰번호
	 private String inquiry_id;         // 문의번호
	 private String start_date;         // 여행 시작일
	 private String end_date;           // 여행 종료일
	 private String included_services;	// 포함된 서비스
	 private int views; 				// 조회수
	 private String departure_name;		// 도착지		//
	 private int child_price;			// 아동 가격
	 private int baby_price;			// 유아 가격
	 private int category_id;
	 private int departure_id;
	 private String imageUrl;
	 private WishlistVo WishlistInfo; 
     private double avgRating;
     private int reviewCount;
     
	public double getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getCategory_id() {
		return category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getDeparture_id() {
		return departure_id;
	}
	public void setDeparture_id(int departure_id) {
		this.departure_id = departure_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getChild_price() {
		return child_price;
	}
	public void setChild_price(int child_price) {
		this.child_price = child_price;
	}
	public int getBaby_price() {
		return baby_price;
	}
	public void setBaby_price(int baby_price) {
		this.baby_price = baby_price;
	}
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public String getDeparture_name() {
		return departure_name;
	}
	public void setDeparture_name(String departure_name) {
		this.departure_name = departure_name;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}

	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public int getPackage_price() {
		return package_price;
	}
	public void setPackage_price(int package_price) {
		this.package_price = package_price;
	}
	public String getPackage_info() {
		return package_info;
	}
	public void setPackage_info(String package_info) {
		this.package_info = package_info;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getIncluded_services() {
		return included_services;
	}
	public void setIncluded_services(String included_services) {
		this.included_services = included_services;
	}
	public WishlistVo getWishlistInfo() {
		return WishlistInfo;
	}
	public void setWishlistInfo(WishlistVo wishlistInfo) {
		WishlistInfo = wishlistInfo;
	}
	
	
	 
}
