package vo;

public class PackageOptionVo {
	
	 private int option_id;         // 패키지 옵션 ID
	 private int package_id;        // 패키지 고유 번호
	 private String option_name;    // 옵션 이름
	 private String description;    // 옵션 설명
	 private int option_price;      // 옵션 가격
	 private String is_required;	// 필수 옵션 여부
	 
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	public String getIs_required() {
		return is_required;
	}
	public void setIs_required(String is_required) {
		this.is_required = is_required;
	}
	 
}
