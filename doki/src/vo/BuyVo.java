package vo;

public class BuyVo {

	private String order_id; // 주문번호
	private String package_id; // 패키지 고유 번호
	private int account_id; // 계정 고유번호
	private int total_amount; // 총 결제 금액
	private String request_note; // 요청사항
	private String order_date; // 예약일
	private String start_date; // 여행 시작일
	private String end_date; // 여행 종료일
	private String tel; // 연락처
	private int tot_personnel; // 총 인원수
	private int adult_number;
	private int child_number;
	private int baby_number;
	private String name_kanji; // 조인으로 추가할 예정

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
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

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public String getRequest_note() {
		return request_note;
	}

	public void setRequest_note(String request_note) {
		this.request_note = request_note;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getTot_personnel() {
		return tot_personnel;
	}

	public void setTot_personnel(int tot_personnel) {
		this.tot_personnel = tot_personnel;
	}

	public int getAdult_number() {
		return adult_number;
	}

	public void setAdult_number(int adult_number) {
		this.adult_number = adult_number;
	}

	public int getChild_number() {
		return child_number;
	}

	public void setChild_number(int child_number) {
		this.child_number = child_number;
	}

	public int getBaby_number() {
		return baby_number;
	}

	public void setBaby_number(int baby_number) {
		this.baby_number = baby_number;
	}

	public String getName_kanji() {
		return name_kanji;
	}

	public void setName_kanji(String name_kanji) {
		this.name_kanji = name_kanji;
	}
 
}
