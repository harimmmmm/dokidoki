package managerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;

public class test {
    public static void main(String[] args) {
        try (Connection conn = DBManager.getInstence().getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT USER FROM DUAL");
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                String currentUser = rs.getString(1);
                System.out.println("현재 접속한 사용자(스키마): " + currentUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
