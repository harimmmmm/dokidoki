package packageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.PackagesVo;

public class PackageListDao {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	// 모든 상품 출력
	public List<PackagesVo> packageAllList() {
		
		String sql = "select p.package_id, c.category_name,p.package_name,p.package_price,p.package_info,p.start_date,p.end_date,p.views\r\n" + 
				"from packages p\r\n" + 
				"join package_categori c\r\n" + 
				"on p.category_id = c.category_id";
		
		List<PackagesVo> list = new ArrayList<PackagesVo>();
		try {
			conn= DBManager.getInstence().getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				
				vo.setPackage_id(rs.getInt("package_id"));
				vo.setCategory_id(rs.getString("category_name"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		
		return list;
	}
	
	// 신상 4개 출력 
	public List<PackagesVo> newPackageList() {
		
		String sql = "SELECT * FROM (\r\n" + 
				"    SELECT p.package_id, \r\n" + 
				"           c.category_name,\r\n" + 
				"           p.package_name,\r\n" + 
				"           p.package_price,\r\n" + 
				"           p.package_info,\r\n" + 
				"           p.start_date,\r\n" + 
				"           p.end_date, \r\n" + 
				"           p.views\r\n" + 
				"    FROM packages p\r\n" + 
				"    JOIN package_categori c ON p.category_id = c.category_id\r\n" + 
				"    ORDER BY p.package_id DESC  \r\n" + 
				") \r\n" + 
				"WHERE ROWNUM <= 4";
		
		List<PackagesVo> list = new ArrayList<PackagesVo>();
		try {
			conn= DBManager.getInstence().getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				
				vo.setPackage_id(rs.getInt("package_id"));
				vo.setCategory_id(rs.getString("category_name"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		
		return list;
	}
	
	public List<PackagesVo> bestPackageList() {
		
		String sql = "select p.package_id, c.category_name,p.package_name,p.package_price,p.package_info,p.start_date,p.end_date, p.views\r\n" + 
				"from packages p\r\n" + 
				"join package_categori c\r\n" + 
				"on p.category_id = c.category_id\r\n" + 
				"where rownum <=4 order by p.views desc";
		
		List<PackagesVo> list = new ArrayList<PackagesVo>();
		
		try {
			conn= DBManager.getInstence().getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				
				vo.setPackage_id(rs.getInt("package_id"));
				vo.setCategory_id(rs.getString("category_name"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		
		return list;
	}
	
}
