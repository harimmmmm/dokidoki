package util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
	
	// 비밀번호 암호화
	public static String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	//비밀번호 비교
	public static boolean checkPassword(String plainPassword, String hashePassword) {
		return BCrypt.checkpw(plainPassword, hashePassword);
	}
}
// 로그인/ 로그아웃 처리
// cookie, session 개념
// cookie 는 내컴퓨터에 저장 (로그인정보 저장할때 사용, 오늘은 그만보기 같은거)
// session은 서버에서 (로그인/로그아웃 처리)