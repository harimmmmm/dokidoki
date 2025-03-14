package managerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.AccountVo;
import vo.BoardVo;
import vo.PackagesVo;
import vo.PaymentVo;

public class ManagerDao {

	public List<AccountVo> userView() { // 유저 리스트

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from account";

		List<AccountVo> list = new ArrayList<AccountVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AccountVo vo = new AccountVo();
				vo.setUser_id(rs.getString("user_id"));
				vo.setName(rs.getString("name"));
				vo.setName_kanji(rs.getString("name_kanji"));
				vo.setBirth_date(rs.getString("birth_date"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setJoin_date(rs.getString("join_date"));
				vo.setAccess_rights(rs.getInt("access_rights"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}

		return list;
	}

	public List<PackagesVo> packageView() { // 상품 리스트

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT p.package_id, \r\n" + 
				"       c.category_name,\r\n" + 
				"       p.package_name,\r\n" + 
				"       p.package_price,\r\n" + 
				"       p.package_info,\r\n" + 
				"       p.start_date,\r\n" + 
				"       p.end_date,\r\n" + 
				"       p.views,\r\n" + 
				"       (SELECT image_url \r\n" + 
				"        FROM package_images pi \r\n" + 
				"        WHERE pi.package_id = p.package_id AND rownum = 1) AS image_url\r\n" + 
				"FROM packages p\r\n" + 
				"JOIN package_categori c ON p.category_id = c.category_id" + 
				"    ORDER BY p.bno ASC";
		
		List<PackagesVo> list = new ArrayList<PackagesVo>();
		try {
			conn= DBManager.getInstence().getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				
				vo.setPackage_id(rs.getString("package_id"));
				vo.setCategory_name(rs.getString("category_name"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setPackage_info(rs.getString("package_info"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));
				vo.setImageUrl(rs.getString("image_url"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<PaymentVo> paymentView() { // 결제내역 리스트

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT \r\n" + 
				"    r.ORDER_ID, \r\n" + 
				"    r.PACKAGE_ID, \r\n" + 
				"    a.USER_ID, \r\n" + 
				"    p.AMOUNT, \r\n" + 
				"    p.PAY_TIME, \r\n" + 
				"    p.PAYPAL_STATUS, \r\n" + 
				"    p.PAYPAL_PAYER_ID\r\n" + 
				"FROM \r\n" + 
				"    PAYMENT p\r\n" + 
				"JOIN \r\n" + 
				"    RESERVATION r ON p.ORDER_ID = r.ORDER_ID\r\n" + 
				"JOIN \r\n" + 
				"    ACCOUNT a ON r.ACCOUNT_ID = a.ACCOUNT_ID";

		List<PaymentVo> list = new ArrayList<PaymentVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PaymentVo vo = new PaymentVo();
				vo.setOrder_id(rs.getString("ORDER_ID"));
				vo.setPACKAGE_ID(rs.getString("PACKAGE_ID"));
				vo.setUSER_ID(rs.getString("USER_ID"));
				vo.setPay_time(rs.getString("PAY_TIME"));
				vo.setAmount(rs.getInt("AMOUNT"));
				vo.setPaypal_status(rs.getString("PAYPAL_STATUS"));
				vo.setPaypal_payer_id(rs.getString("PAYPAL_PAYER_ID"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return list;
	}

	

	public void boardInsert(BoardVo vo) { // 공지 등록

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into board (bno, account_id, title, content, category, created_date) "
				+ "values (bno_seq.nextval, ?, ?, ?, ?, sysdate)";

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAccount_id());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getCategory());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}
	}

	public List<BoardVo> boardView() { // 공지 목록

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from board where category = '1'";

		List<BoardVo> list = new ArrayList<BoardVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVo vo = new BoardVo();

				vo.setBno(rs.getInt("bno"));
				vo.setAccount_id(rs.getInt("account_id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setCategory(rs.getString("category"));
				vo.setCreated_date(rs.getString("created_date"));


				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return list;
	}

}
