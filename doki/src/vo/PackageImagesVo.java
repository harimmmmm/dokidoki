package vo;

public class PackageImagesVo {
	
	 private int image_id;          // 이미지 고유 ID
	 private int package_id;        // 패키지 고유 번호
	 private String image_url;      // 이미지 URL
	 private String image_order;	// 이미지 표시 순서
	 
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getImage_order() {
		return image_order;
	}
	public void setImage_order(String image_order) {
		this.image_order = image_order;
	}

}
