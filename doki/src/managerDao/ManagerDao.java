package managerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.AccountVo;
import vo.BoardVo;
import vo.BuyVo;
import vo.PackagesVo;
import vo.PaymentVo;

public class ManagerDao {

	public List<AccountVo> userView() { // 유저 리스트

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select user_id, name, name_kanji, birth_date, tel, email, join_date, access_rights from account";

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

		String sql = "select package_id, package_name, package_price, start_date, end_date from packages";

		List<PackagesVo> list = new ArrayList<PackagesVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PackagesVo vo = new PackagesVo();
				vo.setPackage_id(rs.getString("package_id"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPackage_price(rs.getInt("package_price"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));

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

		String sql = "SELECT p.order_id, pk.package_name, p.pay_time, p.amount, p.payment_status\r\n" + 
				"FROM payment p\r\n" + 
				"JOIN packages pk ON p.order_id = pk.package_id";

		List<PaymentVo> list = new ArrayList<PaymentVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PaymentVo vo = new PaymentVo();
				vo.setOrder_id(rs.getString("order_id"));
				vo.setPackage_name(rs.getString("package_name"));
				vo.setPay_time(rs.getString("pay_time"));
				vo.setAmount(rs.getInt("amount"));
				vo.setPayment_status(rs.getString("payment_status"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BuyVo> reservationView() { // 예약 리스트

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select b.package_id, b.account_id, b.order_date, ac.name_kanji, b.start_date, b.end_date "
				+ "from buy b " + "join account ac on b.account_id = ac.account_id";

		List<BuyVo> list = new ArrayList<BuyVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BuyVo vo = new BuyVo();
				vo.setPackage_id(rs.getString("package_id"));
				vo.setAccount_id(rs.getInt("account_id"));
				vo.setOrder_date(rs.getString("order_date"));
				vo.setName_kanji(rs.getString("name_kanji"));
				vo.setStart_date(rs.getString("start_date"));
				vo.setEnd_date(rs.getString("end_date"));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void boardInsert(BoardVo vo) { // 공지 등록

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into board (bno, account_id, title, content, category, created_date) "
				+ "values (bno_seq.nextval, 0, ?, ?, 1, sysdate)";

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
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

		String sql = "select bno, account_id, title, content, category, created_date from board";

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

				System.out.println("제발출력좀돼라 " + vo.getBno());

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
