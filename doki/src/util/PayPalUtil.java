package util;

import org.apache.http.client.methods.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.apache.http.util.EntityUtils;
import com.google.gson.*;

public class PayPalUtil {
    private static final String CLIENT_ID = "AeGUkWdcfGW7drBkvPBkM4ISI0qVKDBchIHD406vVAzhgdZF2lzGaUY_K9JlU3cRPG0IhbFitvTJCTGf";
    private static final String SECRET = "EPHInFJ9yDiJMJttrGLS4D1_bDYyiwfyolpwcufEDTWhqFEWNydMr_lvnpfsi5NVlMwru3qhvyG_m9Zn";
    private static final String PAYPAL_API_BASE = "https://api-m.sandbox.paypal.com";

    // 접근 토큰 얻기
    public static String getAccessToken() throws Exception {
        HttpPost post = new HttpPost(PAYPAL_API_BASE + "/v1/oauth2/token");
        post.setHeader("Accept", "application/json");
        post.setHeader("Accept-Language", "en_US");
        post.setHeader("Content-Type", "application/x-www-form-urlencoded");
        post.setHeader("Authorization", "Basic " +
                java.util.Base64.getEncoder().encodeToString((CLIENT_ID + ":" + SECRET).getBytes()));

        post.setEntity(new StringEntity("grant_type=client_credentials"));

        try (CloseableHttpClient client = HttpClients.createDefault()) {
            CloseableHttpResponse response = client.execute(post);
            String result = EntityUtils.toString(response.getEntity());
            JsonObject json = JsonParser.parseString(result).getAsJsonObject();
            return json.get("access_token").getAsString();
        }
    }

    // 페이팔 결제 생성
    public static JsonObject createPayment(String token, String total, String currency, String returnUrl, String cancelUrl) throws Exception {
        HttpPost post = new HttpPost(PAYPAL_API_BASE + "/v1/payments/payment");
        post.setHeader("Content-Type", "application/json");
        post.setHeader("Authorization", "Bearer " + token);

        JsonObject payment = new JsonObject();
        payment.addProperty("intent", "sale");

        JsonObject redirectUrls = new JsonObject();
        redirectUrls.addProperty("return_url", returnUrl);
        redirectUrls.addProperty("cancel_url", cancelUrl);
        payment.add("redirect_urls", redirectUrls);

        JsonObject transaction = new JsonObject();
        JsonObject amount = new JsonObject();
        amount.addProperty("total", total);
        amount.addProperty("currency", currency);
        transaction.add("amount", amount);
        transaction.addProperty("description", "결제 설명");
        JsonArray transactions = new JsonArray();
        transactions.add(transaction);
        payment.add("transactions", transactions);

        JsonObject payer = new JsonObject();
        payer.addProperty("payment_method", "paypal");
        payment.add("payer", payer);

        post.setEntity(new StringEntity(payment.toString(), "UTF-8"));

        try (CloseableHttpClient client = HttpClients.createDefault()) {
            CloseableHttpResponse response = client.execute(post);
            String result = EntityUtils.toString(response.getEntity());
            return JsonParser.parseString(result).getAsJsonObject();
        }
    }

    // 결제 실행 (승인 후)
    public static JsonObject executePayment(String token, String paymentId, String payerId) throws Exception {
        HttpPost post = new HttpPost(PAYPAL_API_BASE + "/v1/payments/payment/" + paymentId + "/execute/");
        post.setHeader("Content-Type", "application/json");
        post.setHeader("Authorization", "Bearer " + token);

        JsonObject payer = new JsonObject();
        payer.addProperty("payer_id", payerId);

        post.setEntity(new StringEntity(payer.toString(), "UTF-8"));

        try (CloseableHttpClient client = HttpClients.createDefault()) {
            CloseableHttpResponse response = client.execute(post);
            String result = EntityUtils.toString(response.getEntity());
            return JsonParser.parseString(result).getAsJsonObject();
        }
    }
}
