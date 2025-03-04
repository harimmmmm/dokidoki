package packageService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import util.DBManager;
import util.PayPalUtil;
import util.RandomUtil;
import vo.AccountVo;

public class PayPalCreatePayment {
    public void docommand(HttpServletRequest request, HttpServletResponse response) {
        try {
            int adult = Integer.parseInt(request.getParameter("adult"));
            int child = Integer.parseInt(request.getParameter("child"));
            int infant = Integer.parseInt(request.getParameter("infant"));

            int adultPrice = Integer.parseInt(request.getParameter("adultPrice"));
            int childPrice = Integer.parseInt(request.getParameter("childPrice"));
            int infantPrice = Integer.parseInt(request.getParameter("infantPrice"));

            int totalPrice = (adult * adultPrice) + (child * childPrice) + (infant * infantPrice);

            String token = PayPalUtil.getAccessToken();
            JsonObject payment = PayPalUtil.createPayment(
                token,
                String.valueOf(totalPrice),
                "JPY",
                "http://localhost:8021/pakage/executePayment.do?redirect=detail",
                "http://localhost:8021/pakage/cancel.do"
            );

            JsonArray links = payment.getAsJsonArray("links");
            String approvalLink = null;

            for(JsonElement link : links){
                JsonObject obj = link.getAsJsonObject();
                if("approval_url".equals(obj.get("rel").getAsString())){
                    approvalLink = obj.get("href").getAsString();
                    break;
                }
            }

            // 세션에서 사용자 정보 가져오기 (AccountVo에서 user_id 가져오기)
            AccountVo account = (AccountVo)request.getSession().getAttribute("user");
            int accountId = account.getAccount_id(); // account_id를 숫자로 가져오기
            
            String packageId = request.getParameter("package_id");
            
            // 예약정보 DB 저장
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = DBManager.getInstence().getConnection();
                
             // 랜덤 order_id 생성
                String orderId = RandomUtil.generateUpperAlphaNumeric(15);

                String sqlReservation = "INSERT INTO reservation("
                        + "order_id, package_id, account_id, total_amount, start_date, end_date, "
                        + "adult_number, child_number, baby_number, tot_personnel) "
                        + "VALUES(?, ?, ?, ?, "
                        + "(SELECT start_date FROM packages WHERE package_id=?), "
                        + "(SELECT end_date FROM packages WHERE package_id=?), ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sqlReservation);

                pstmt.setString(1, orderId); // 생성한 order_id
                pstmt.setString(2, packageId);
                pstmt.setInt(3, accountId);
                pstmt.setInt(4, totalPrice);
                pstmt.setString(5, packageId);
                pstmt.setString(6, packageId);
                pstmt.setInt(7, adult);
                pstmt.setInt(8, child);
                pstmt.setInt(9, infant);
                pstmt.setInt(10, adult + child + infant);
                
                pstmt.executeUpdate();
                pstmt.close();

                // 결제정보 초기 저장 (위의 order_id 사용)
                String sqlPayment = "INSERT INTO payment(pay_id, order_id, amount, paypal_status) VALUES(payment_seq.nextval, ?, ?, 'PENDING')";

                pstmt = conn.prepareStatement(sqlPayment);
                pstmt.setString(1, orderId); // 동일 order_id 저장
                pstmt.setInt(2, totalPrice);
                pstmt.executeUpdate();

                System.out.println("✅ 예약정보 및 결제 초기정보 DB 저장 완료! Order ID: " + orderId);

            } catch(SQLException e) {
                e.printStackTrace();
            } finally {
                DBManager.getInstence().close(pstmt, conn);
            }

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print("{\"approvalLink\":\"" + approvalLink + "\"}");

            // 세션에 저장
            request.getSession().setAttribute("package_id", packageId);
            request.getSession().setAttribute("total_price", totalPrice);

        } catch(Exception e) {
            e.printStackTrace();
         // 클라이언트에게 에러 응답을 JSON 형태로 반환
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json;charset=UTF-8");
            try {
				response.getWriter().print("{\"error\":\"서버 처리 중 문제가 발생했습니다.\"}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
    }
}
