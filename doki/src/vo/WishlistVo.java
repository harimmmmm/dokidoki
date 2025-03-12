package vo;

public class WishlistVo {
	
	 private int wishlist_id;   // 찜 고유 ID 
	 private String package_id; // 패키지 고유 번호
	 private int account_id;    // 계정 고유번호
	 private String created_at;	// 찜한 날짜
	 
	public int getWishlist_id() {
		return wishlist_id;
	}
	public void setWishlist_id(int wishlist_id) {
		this.wishlist_id = wishlist_id;
	}
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

}
