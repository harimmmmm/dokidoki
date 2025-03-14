package managerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import util.DBManager;
import vo.AccountVo;
import vo.BoardCommentsVo;
import vo.BoardVo;
import vo.PackagesVo;
import vo.PaymentVo;
import vo.ReservationVo;

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

		String sql = "SELECT p.order_id, pk.package_name, p.pay_time, p.amount, p.payment_status\r\n"
				+ "FROM payment p\r\n" + "JOIN packages pk ON p.order_id = pk.package_id";

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

	// 예약 리스트
	public List<ReservationVo> getReservations() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT A.ACCOUNT_ID, A.USER_ID, A.NAME, A.NAME_KANJI, A.NAME_KANA, A.BIRTH_DATE, "
				+ "A.TEL AS ACCOUNT_TEL, A.EMAIL, A.POSTAL_CODE, A.PREFECTURE, A.CITY, A.TOWN, A.BUILDING, "
				+ "A.ACCOUNT_STATUS, A.JOIN_DATE, A.SOCIAL_LOGIN, A.ACCESS_RIGHTS, A.PASSPORT_NUMBER, A.PASSPORT_EXPIRY, A.CUSTOM_FIELD, "
				+ "R.ORDER_ID, R.PACKAGE_ID, R.TOTAL_AMOUNT, R.REQUEST_NOTE, R.ORDER_DATE, "
				+ "R.START_DATE AS RESERVATION_START_DATE, R.END_DATE AS RESERVATION_END_DATE, R.TEL AS RESERVATION_TEL, "
				+ "R.TOT_PERSONNEL, R.ADULT_NUMBER, R.CHILD_NUMBER, R.BABY_NUMBER, "
				+ "P.PACKAGE_NAME, P.PACKAGE_PRICE, P.PACKAGE_INFO, P.PROVIDER, P.REVIEW_ID, "
				+ "P.INQUIRY_ID, P.START_DATE AS PACKAGE_START_DATE, P.END_DATE AS PACKAGE_END_DATE, "
				+ "P.INCLUDED_SERVICES, P.FIELD, P.VIEWS, P.DEPARTURE_ID, P.OPTION_ID, P.CHILD_PRICE, P.BABY_PRICE "
				+ "FROM ACCOUNT A " + "JOIN RESERVATION R ON A.ACCOUNT_ID = R.ACCOUNT_ID "
				+ "JOIN PACKAGES P ON R.PACKAGE_ID = P.PACKAGE_ID";

		List<ReservationVo> reservationList = new ArrayList<>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				AccountVo vo = new AccountVo();
				vo.setAccount_id(rs.getInt("ACCOUNT_ID"));
				vo.setUser_id(rs.getString("USER_ID"));
				vo.setName(rs.getString("NAME"));
				vo.setName_kanji(rs.getString("NAME_KANJI"));
				vo.setName_kana(rs.getString("NAME_KANA"));

				ReservationVo rvo = new ReservationVo();
				rvo.setOrder_id(rs.getString("ORDER_ID"));
				rvo.setPackage_id(rs.getString("PACKAGE_ID"));
				rvo.setTotal_amount(rs.getInt("TOTAL_AMOUNT"));
				rvo.setOrder_date(rs.getString("ORDER_DATE").substring(0, 10));
				rvo.setStart_date(rs.getString("RESERVATION_START_DATE").substring(0, 10));
				rvo.setEnd_date(rs.getString("RESERVATION_END_DATE").substring(0, 10));
				rvo.setTot_personnel(rs.getInt("TOT_PERSONNEL"));

				PackagesVo pvo = new PackagesVo();
				pvo.setPackage_name(rs.getString("PACKAGE_NAME"));

				rvo.setPackageInfo(pvo);
				rvo.setAccountInfo(vo);
				reservationList.add(rvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationList;
	}

	public void boardInsert(BoardVo vo) { // 공지 등록

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into board (bno, account_id, title, content, category, created_date, BOARD_IMG) "
				+ "values (bno_seq.nextval, 0, ?, ?, ?, sysdate, ?)";

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getBoard_img());
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

		String sql = "select bno, account_id, title, content, category, created_date from board where CATEGORY = 1";

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

	public List<BoardVo> inquirySelect() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT bno, account_id, title, content, category, created_date FROM Board where CATEGORY = 2 ORDER BY created_date DESC";

		List<BoardVo> boardList = new ArrayList<BoardVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			while (rs.next()) {
				BoardVo board = new BoardVo();
				board.setBno(rs.getInt("bno"));
				board.setAccount_id(rs.getInt("account_id"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setCategory(rs.getString("category"));

				// 날짜
				String createdDateStr = rs.getString("created_date");
				try {
					Date createdDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(createdDateStr);
					board.setCreated_date(dateFormat.format(createdDate));
				} catch (Exception e) {
					e.printStackTrace();
					board.setCreated_date(createdDateStr);
				}

				// 댓글 정보 가져오기
				List<BoardCommentsVo> comments = new ArrayList<>();
				String sql2 = "SELECT comment_id, bno, comment_content, comment_date FROM BOARD_COMMENTS WHERE bno = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getBno());
				ResultSet rs2 = pstmt.executeQuery();
				while (rs2.next()) {
					BoardCommentsVo comment = new BoardCommentsVo();
					comment.setComment_id(rs2.getInt("comment_id"));
					comment.setBno(rs2.getInt("bno"));
					comment.setComment_content(rs2.getString("comment_content"));
					//comment.setComment_date(rs2.getString("comment_date"));
					// 날짜
					String commentDate = rs2.getString("comment_date");
					try {
						Date commentDate2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(commentDate);
						comment.setComment_date(dateFormat.format(commentDate2));
					} catch (Exception e) {
						e.printStackTrace();
						comment.setComment_date(commentDate);
					}
					comments.add(comment);
				}
				board.setComments(comments);
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pstmt, conn);
		}
		return boardList;
	}

	// 문의 등록
	public void inquiryInsert(BoardVo vo) {

		Connection conn = null;
		PreparedStatement pst = null;

		String sql = "insert into BOARD_COMMENTS(COMMENT_ID, BNO, ACCOUNT_ID, COMMENT_CONTENT, COMMENT_DATE) values(BOARD_COMMENTS_seq.nextval, ?,?,?,sysdate)";

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, vo.getBno());
			pst.setInt(2, vo.getAccount_id());
			pst.setString(3, vo.getContent());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

}
