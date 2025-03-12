package packageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.PackagesVo;
import vo.ReviewVo;

public class PackageSearchDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<PackagesVo> searchPackages(String destination, String departure, String startDate, String endDate) {
		List<PackagesVo> packageList = new ArrayList<>();
		String sql = "SELECT \r\n" + 
				"    p.package_id, \r\n" + 
				"    c.category_name AS destination,\r\n" + 
				"    p.package_name, \r\n" + 
				"    p.package_price,\r\n" + 
				"    p.package_info,\r\n" + 
				"    d.category_name AS departure_name,\r\n" + 
				"    p.start_date, \r\n" + 
				"    p.end_date,\r\n" + 
				"    (SELECT image_url \r\n" + 
				"        FROM package_images pi \r\n" + 
				"        WHERE pi.package_id = p.package_id AND rownum = 1) as image_url\r\n" + 
				"FROM \r\n" + 
				"    packages p\r\n" + 
				"JOIN \r\n" + 
				"    package_categori c ON p.category_id = c.category_id\r\n" + 
				"JOIN \r\n" + 
				"    package_categori d ON p.departure_id = d.category_id\r\n" + 
				"LEFT JOIN (\r\n" + 
				"    SELECT package_id, MIN(image_url) AS image_url\r\n" + 
				"    FROM package_images\r\n" + 
				"    GROUP BY package_id\r\n" + 
				") i ON p.package_id = i.package_id\r\n" + 
				"WHERE 1=1";

		// 동적으로 조건 추가
		if (destination != null && !destination.isEmpty()) {
			sql += " AND c.category_name = ? ";
		}
		if (departure != null && !departure.isEmpty()) {
			sql += " AND d.category_name = ? ";
		}
		if (startDate != null && !startDate.isEmpty()) {
			sql += " AND p.start_date >= TO_DATE(?, 'YY/MM/DD') ";
		}
		if (endDate != null && !endDate.isEmpty()) {
			sql += " AND p.end_date <= TO_DATE(?, 'YY/MM/DD') ";
		}

		sql += "ORDER BY p.start_date ASC";

		try (Connection conn = DBManager.getInstence().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			int paramIndex = 1;

			if (destination != null && !destination.isEmpty()) {
				pstmt.setString(paramIndex++, destination);
			}
			if (departure != null && !departure.isEmpty()) {
				pstmt.setString(paramIndex++, departure);
			}
			if (startDate != null && !startDate.isEmpty()) {
				pstmt.setString(paramIndex++, startDate);
			}
			if (endDate != null && !endDate.isEmpty()) {
				pstmt.setString(paramIndex++, endDate);
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				vo.setPackage_id(rs.getString("package_id"));
				vo.setCategory_name(rs.getString("destination"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setDeparture_name(rs.getString("departure_name"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				vo.setImageUrl(rs.getString("image_url"));
				packageList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("실행된 SQL: " + sql);

		return packageList;
	}

	public void viewsCount(String package_id) {

		String sql = "update packages set views = views + 1 where package_id = ?";

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, package_id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}

	}

	public List<ReviewVo> review(String package_id) {

		String sql = "select r.review_id, a.USER_ID, r.package_id, r.review_date, r.rating, r.content, r.REVIEW_IMAGE\r\n" + 
				"from Review r\r\n" + 
				"join ACCOUNT a on r.account_id = a.account_id\r\n" + 
				"where package_id = ?";
		
		List<ReviewVo> list = new ArrayList<ReviewVo>();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, package_id);

			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewVo vo = new ReviewVo();
				
				vo.setUser_id(rs.getString("USER_ID"));
				vo.setPackage_id(rs.getString("package_id"));
				vo.setContent(rs.getString("content"));
				vo.setRating(rs.getString("rating"));
				vo.setReview_date(rs.getString("review_date"));
				vo.setReview_id(rs.getInt("review_id"));
				vo.setImage(rs.getString("REVIEW_IMAGE"));
				
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}
		return list;
	}
	
	public double totreviewrating(String package_id) {
		String sql = "SELECT \r\n" + 
				"    PACKAGE_ID,\r\n" + 
				"    ROUND(AVG(TO_NUMBER(RATING)), 1) AS totrating\r\n" + 
				"FROM \r\n" + 
				"    Review\r\n" + 
				"WHERE \r\n" + 
				"    PACKAGE_ID = ?\r\n" + 
				"GROUP BY \r\n" + 
				"    PACKAGE_ID";
		
		double totrating = 0;
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, package_id);

			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				totrating = rs.getDouble("totrating");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}
		return totrating;
	}
	
	public int totreivew(String package_id) {
		
		String sql = "SELECT count(*) as totreivew FROM Review WHERE \r\n" + 
				"    PACKAGE_ID = ?";
		
		int totreivew = 0;
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, package_id);

			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				totreivew = rs.getInt("totreivew");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}
		return totreivew;
	}
	
	
	public int totNumReservation(String package_id) {
		
		String sql = "SELECT SUM(TOT_PERSONNEL) AS totNumReservation\r\n" + 
				"FROM reservation\r\n" + 
				"WHERE PACKAGE_ID = ?";
		int totNumReservation = 0;
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, package_id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totNumReservation=rs.getInt("totNumReservation");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return totNumReservation;
	}
	
	public PackagesVo selectIdPackage(String package_id) {
		String sql = "SELECT * FROM (\r\n" + "    SELECT p.package_id, \r\n" + "           c.category_name,\r\n"
				+ "           d.category_name AS departure_name, \r\n" + "           p.package_name,\r\n"
				+ "           p.package_price,\r\n" + "            p.CHILD_PRICE,\r\n" + "            p.BABY_PRICE,\r\n"
				+ "           p.package_info,\r\n" + "           p.start_date,\r\n" + "           p.end_date, \r\n"
				+ "           p.views,\r\n" + "           p.INCLUDED_SERVICES\r\n" + "    FROM packages p\r\n"
				+ "    JOIN package_categori c ON p.category_id = c.category_id\r\n"
				+ "    JOIN package_categori d ON p.departure_id = d.category_id\r\n" + ") \r\n"
				+ "WHERE package_id = ?";

		PackagesVo vo = new PackagesVo();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, package_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setPackage_id(rs.getString("package_id"));
				vo.setCategory_name(rs.getString("category_name"));
				vo.setDeparture_name(rs.getString("departure_name"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setChild_price(rs.getInt("child_price"));
				vo.setBaby_price(rs.getInt("baby_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				vo.setViews(rs.getInt("views"));
				vo.setIncluded_services(rs.getString("included_services"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return vo;
	}

	public List<String> getImagePathsByProductCode(String package_id) {
		List<String> imagePaths = new ArrayList<>();
		String sql = "select image_url from package_images WHERE package_id = ?";

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, package_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				imagePaths.add(rs.getString("image_url"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return imagePaths;
	}

}
