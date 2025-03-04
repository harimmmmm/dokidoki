package packageModel;

import java.sql.*;
import java.util.*;
import util.DBManager;

public class WishlistDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
    // 관심상품 추가
    public void insertWishlist(int accountId, String packageId) {
        String sql = "INSERT INTO wishlist(wishlist_id, account_id, package_id, created_at) "
                   + "VALUES(wishlist_seq.nextval, ?, ?, sysdate)";

        try {
        	conn = DBManager.getInstence().getConnection();
        	pstmt = conn.prepareStatement(sql);
        	
            pstmt.setInt(1, accountId);
            pstmt.setString(2, packageId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 관심상품 제거
    public void deleteWishlist(int accountId, String packageId) {
        String sql = "DELETE FROM wishlist WHERE account_id=? AND package_id=?";

        try {
        	conn = DBManager.getInstence().getConnection();
        	pstmt = conn.prepareStatement(sql);
        	
            pstmt.setInt(1, accountId);
            pstmt.setString(2, packageId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 관심상품 목록 가져오기
    public List<String> selectWishlistByAccount(int accountId) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT package_id FROM wishlist WHERE account_id=?";

        try {
        	conn = DBManager.getInstence().getConnection();
        	pstmt = conn.prepareStatement(sql);
        	
            pstmt.setInt(1, accountId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("package_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
