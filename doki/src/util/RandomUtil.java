package util;

import java.security.SecureRandom;

public class RandomUtil {

	    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    private static final SecureRandom random = new SecureRandom();

	    public static String generateUpperAlphaNumeric(int length) {
	        StringBuilder sb = new StringBuilder(length);

	        for(int i = 0; i < length; i++) {
	            int index = random.nextInt(CHARACTERS.length());
	            sb.append(CHARACTERS.charAt(index));
	        }

	        return sb.toString();
	    }

	    public static void main(String[] args) {
	        String randomCode = generateUpperAlphaNumeric(10);
	        System.out.println(randomCode);
	    }

}
