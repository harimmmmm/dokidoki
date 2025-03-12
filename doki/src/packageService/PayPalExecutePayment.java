package packageService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import util.DBManager;
import util.PayPalUtil;

public class PayPalExecutePayment {
	public void docommand(HttpServletRequest request, HttpServletResponse response) {

	    String paymentId = request.getParameter("paymentId");
	    String payerId = request.getParameter("PayerID");
	    String token = null;
	    JsonObject result = null;

	    try {
	        token = PayPalUtil.getAccessToken();
	        result = PayPalUtil.executePayment(token, paymentId, payerId);
	    } catch(Exception e) {
	        e.printStackTrace();
	        System.out.println("🚨 페이팔 결제 처리 중 오류 발생");
	        return; // 오류 발생 시 여기서 메서드 종료
	    }

	    String paypalTransactionId = result.get("id").getAsString();
	    String paypalStatus = result.get("state").getAsString();
	    String paypalPayerEmail = result.getAsJsonObject("payer")
	                                  .getAsJsonObject("payer_info")
	                                  .get("email").getAsString();

	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = DBManager.getInstence().getConnection();
	        String sqlUpdatePayment = "UPDATE payment SET paypal_transaction_id=?, paypal_status=?, paypal_payer_id=?, paypal_payer_email=?, pay_time=sysdate WHERE pay_id = (SELECT MAX(pay_id) FROM payment WHERE paypal_status='PENDING')";

	        pstmt = conn.prepareStatement(sqlUpdatePayment);

	        pstmt.setString(1, paypalTransactionId);
	        pstmt.setString(2, paypalStatus);
	        pstmt.setString(3, payerId);
	        pstmt.setString(4, paypalPayerEmail);

	        pstmt.executeUpdate();

	        System.out.println("✅ 결제정보 업데이트 완료!");

	    } catch(SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBManager.getInstence().close(pstmt, conn);
	    }
	}

}
