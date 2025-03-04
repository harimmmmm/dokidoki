package packageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBManager;
import vo.PackagesVo;

public class PackageAdd {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 이미지 업로드
    public  void saveProductImage(String productCode, String imgPath) {
        String sql = "INSERT INTO package_images (image_id,package_id, image_url) VALUES (image_id_seq.nextval,?,?)";

        try {
        	conn=DBManager.getInstence().getConnection();
        	pstmt=conn.prepareStatement(sql);
        	
            pstmt.setString(1, productCode);
            pstmt.setString(2, imgPath);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
			DBManager.getInstence().close(pstmt, conn);
		}
    }
    
    public void pakageInsert(PackagesVo vo) {
		String sql = "INSERT INTO packages (package_id,package_name, package_price, child_price, baby_price, start_date, end_date, package_info, included_services,category_id,departure_id) VALUES (?,?,?,?,?,TO_DATE(?, 'YYYY-MM-DD'),TO_DATE(?, 'YYYY-MM-DD'),?,?,?,?)";
		
		try {
			conn=DBManager.getInstence().getConnection();
        	pstmt=conn.prepareStatement(sql);
        	
        	pstmt.setString(1, vo.getPackage_id());
        	pstmt.setString(2, vo.getPackage_name());
        	pstmt.setInt(3, vo.getPackage_price());
        	pstmt.setInt(4, vo.getChild_price());
        	pstmt.setInt(5, vo.getBaby_price());
        	pstmt.setString(6, vo.getStart_date());
        	pstmt.setString(7, vo.getEnd_date());
        	pstmt.setString(8, vo.getPackage_info());
        	pstmt.setString(9, vo.getIncluded_services());
        	pstmt.setInt(10, vo.getCategory_id());
        	pstmt.setInt(11, vo.getDeparture_id());
        	
        	pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn);
		}
	}
}
