package account.service;

import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class GoogleAuth {
    public static String getAccessToken(String code) throws Exception {
    	
        String clientId = "902333858114-pekkqua81rkf1bijc1db40asjbj473tv.apps.googleusercontent.com";
        String clientSecret = "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";
        String redirectUri = "http://localhost:8021/member/callback";
        
        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        String data = "code=" + code
                    + "&client_id=" + clientId
                    + "&client_secret=" + clientSecret
                    + "&redirect_uri=" + redirectUri
                    + "&grant_type=authorization_code";

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = data.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        try (Scanner scanner = new Scanner(new InputStreamReader(connection.getInputStream()))) {
            String response = scanner.useDelimiter("\\A").next();
            // JSON 파싱하여 access_token을 추출한 후 반환
            String accessToken = extractAccessToken(response);
            return accessToken;
        }
    }

    private static String extractAccessToken(String response) {
        // JSON 응답에서 access_token을 추출하는 로직
        // 예시: { "access_token": "eyJhbGciOiJIUzI1NiJ9..." }
        // JSON 파서로 access_token을 추출하는 코드 작성
        return response; // 단순 예시로, 실제로는 JSON 파싱 후 값 추출 필요
    }
}
