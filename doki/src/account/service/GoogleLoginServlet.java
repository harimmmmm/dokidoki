package account.service;

import java.io.*;
import java.security.Key;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import account.dao.LoginDao;
import vo.AccountVo;

public class GoogleLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; // serialVersionUID는 클래스의 버전을 명시하는 고유값

	LoginDao dao = new LoginDao();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = (String) request.getAttribute("email");

		// 이메일 로그 출력 (받은 이메일 확인)
		System.out.println("Received email: " + email);

		System.out.println("Request email attribute: " + request.getAttribute("email"));

		AccountVo vo = dao.getUserEmail(email);
		
		if (vo == null) {
			// 사용자 없음, 회원가입 등 필요한 처리
			System.out.println("User not found in DB for email: " + email); // 이메일로 DB 조회 결과 확인
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().write("{\"success\": false, \"message\": \"User not found\"}");
			return;
		} else {
			// 로그인 성공 시, 액세스 토큰 생성
			String accessToken = generateAccessToken(vo);

			// 세션에 사용자 정보 저장
			request.getSession().setAttribute("user", vo);
			
			// 응답 타입 설정
	        response.setContentType("application/json");
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Cross-Origin-Embedder-Policy", "require-corp");

			
	        // 클라이언트로 액세스 토큰 전달
	        String jsonResponse = "{\"★success\": true, \"access_token\": \"" + accessToken + "\"}";
	        response.getWriter().write(jsonResponse); // AJAX로 전송된 데이터

			// 클라이언트로부터 메시지 전달받아, 팝업을 닫고 부모 페이지를 갱신하는 작업은
			// 클라이언트 쪽에서 처리
	        
//	        System.out.println("GoogleLoginServlet: Received email -> " + email);
//	        System.out.println("GoogleLoginServlet: User found in DB -> " + (vo != null));


		}

	}

	public static String generateAccessToken(AccountVo user) {
		long expirationTime = 3600000L; // 1시간

		// 비밀 키 생성 (HMACSHA256용 Key)
		String secretKey = "aH2Fj9D6e7Z2+8B3cP2D6Z7J6nF+8I0A7f3";
		Key key = Keys.hmacShaKeyFor(secretKey.getBytes()); // HMACSHA256을 위한 Key 생성

		// JWT 토큰 생성
		return Jwts.builder().claim("sub", String.valueOf(user.getEmail())) // 사용자 ID (sub)
				.claim("iss", "your-app") // 발행자 (iss)
				.claim("exp", new Date(System.currentTimeMillis() + expirationTime)) // 만료 시간 (exp)
				.signWith(key) // HMACSHA256으로 서명
				.compact();
	}
}
