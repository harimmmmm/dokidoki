package packageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.PackagesVo;

public class PackageSearchDao {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	public List<PackagesVo> searchPackages(String destination, String departure, String startDate, String endDate) {
	    List<PackagesVo> packageList = new ArrayList<>();
	    String sql = "SELECT "
	               + "    p.package_id, "
	               + "    c.category_name AS destination, "
	               + "    p.package_name, "
	               + "    p.package_price, "
	               + "    p.package_info, "
	               + "    d.category_name AS departure_name, "
	               + "    p.start_date, "
	               + "    p.end_date "
	               + "FROM packages p "
	               + "JOIN package_categori c ON p.category_id = c.category_id "
	               + "JOIN package_categori d ON p.departure_id = d.category_id "
	               + "WHERE 1=1 ";

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
	            vo.setPackage_id(rs.getInt("package_id"));
	            vo.setCategory_id(rs.getString("destination"));
	            vo.setPackage_name(rs.getString("package_name"));
	            vo.setPackage_price(rs.getInt("package_price"));
	            vo.setPackage_info(rs.getString("package_info"));
	            vo.setDeparture_name(rs.getString("departure_name"));
	            vo.setStart_date(rs.getString("start_date"));
	            vo.setEnd_date(rs.getString("end_date"));
	            
	            packageList.add(vo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("실행된 SQL: " + sql);

	    return packageList;
	}

}
