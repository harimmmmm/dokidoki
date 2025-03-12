package vo;

public class PaymentVo {

	private int pay_id; // 결제승인번호 
	private String order_id; // 주문번호
	private int amount; // 결제금액
	private String pay_time; // 결제요청시간
	private String apy_succ; // 결제성공시간
	private String payment_status; // 결제 상태
	private String paypal_transaction_id; // PayPal고유 거래 ID
	private String paypal_status; // PayPal 결제 상태
	private String paypal_payer_id; // PayPal ID
	private String paypal_payer_email; // PayPal 이메일
	private String paypal_refund_id; // 환불 ID
	private int refund_amount; // 환불 금액
	private String refund_time; // 환불 완료 시간
	private String package_name; // 패키지 이름 (join으로 가져올 예정)

	public int getPay_id() {
		return pay_id;
	}

	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPay_time() {
		return pay_time;
	}

	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}

	public String getApy_succ() {
		return apy_succ;
	}

	public void setApy_succ(String apy_succ) {
		this.apy_succ = apy_succ;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getPaypal_transaction_id() {
		return paypal_transaction_id;
	}

	public void setPaypal_transaction_id(String paypal_transaction_id) {
		this.paypal_transaction_id = paypal_transaction_id;
	}

	public String getPaypal_status() {
		return paypal_status;
	}

	public void setPaypal_status(String paypal_status) {
		this.paypal_status = paypal_status;
	}

	public String getPaypal_payer_id() {
		return paypal_payer_id;
	}

	public void setPaypal_payer_id(String paypal_payer_id) {
		this.paypal_payer_id = paypal_payer_id;
	}

	public String getPaypal_payer_email() {
		return paypal_payer_email;
	}

	public void setPaypal_payer_email(String paypal_payer_email) {
		this.paypal_payer_email = paypal_payer_email;
	}

	public String getPaypal_refund_id() {
		return paypal_refund_id;
	}

	public void setPaypal_refund_id(String paypal_refund_id) {
		this.paypal_refund_id = paypal_refund_id;
	}

	public int getRefund_amount() {
		return refund_amount;
	}

	public void setRefund_amount(int refund_amount) {
		this.refund_amount = refund_amount;
	}

	public String getRefund_time() {
		return refund_time;
	}

	public void setRefund_time(String refund_time) {
		this.refund_time = refund_time;
	}
	
	public String getPackage_name() {
		return package_name;
	}

	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}

}
