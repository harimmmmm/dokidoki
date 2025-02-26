package util;

import java.sql.Connection;

public class DBtest {

	public static void main(String[] args) {
		Connection conn =DBManager.getInstence().getConnection();;
		
		if (conn != null) {
			System.out.println("o");
		}
		
	}

}
