package mypages.dao;

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
import vo.ReservationVo;
import vo.ReviewVo;
import vo.WishlistVo;

public class MyPageDao {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public AccountVo getAccountList(String user_id) {

		String sql = "select * from account where USER_ID = ?";

		AccountVo vo = null;

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			while (rs.next()) {
				vo = new AccountVo();
				vo.setAccount_id(rs.getInt("ACCOUNT_ID"));
				vo.setUser_id(rs.getString("USER_ID"));
				vo.setUser_password(rs.getString("USER_PASSWORD"));
				vo.setName(rs.getString("NAME"));
				vo.setName_kanji(rs.getString("NAME_KANJI"));
				vo.setName_kana(rs.getString("NAME_KANA"));
				vo.setBirth_date(rs.getString("BIRTH_DATE"));
				vo.setTel(rs.getString("TEL"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setPostal_code(rs.getString("POSTAL_CODE"));
				vo.setPrefecture(rs.getString("PREFECTURE"));
				vo.setCity(rs.getString("CITY"));
				vo.setTown(rs.getString("TOWN"));
				vo.setBuilding(rs.getString("BUILDING"));
				vo.setAccount_status(rs.getInt("ACCOUNT_STATUS"));
				vo.setJoin_date(rs.getString("JOIN_DATE"));
				vo.setSocial_login(rs.getString("SOCIAL_LOGIN"));
				vo.setAccess_rights(rs.getInt("ACCESS_RIGHTS"));
				vo.setPassport_number(rs.getString("PASSPORT_NUMBER"));
				vo.setPassport_expiry(rs.getString("PASSPORT_EXPIRY"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return vo;
	}

	// 개인정보 수정
	public void AccountUpdate(AccountVo vo) {
		String sql = "update account set NAME = ?, NAME_KANJI = ?, NAME_KANA = ?, "
				+ "BIRTH_DATE = ?, TEL = ?, EMAIL = ?, "
				+ "POSTAL_CODE = ?, PREFECTURE = ?, CITY = ?, TOWN = ?, BUILDING = ?, "
				+ "PASSPORT_NUMBER = ?, PASSPORT_EXPIRY = ? where USER_ID = ?";

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getName());
			pst.setString(2, vo.getName_kanji());
			pst.setString(3, vo.getName_kana());

			pst.setString(4, vo.getBirth_date());
			pst.setString(5, vo.getTel());
			pst.setString(6, vo.getEmail());

			pst.setString(7, vo.getPostal_code());
			pst.setString(8, vo.getPrefecture());
			pst.setString(9, vo.getCity());
			pst.setString(10, vo.getTown());
			pst.setString(11, vo.getBuilding());

			pst.setString(12, vo.getPassport_number());
			pst.setString(13, vo.getPassport_expiry());

			pst.setString(14, vo.getUser_id());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn);
		}
	}
	
	// 비번수정
	public void passwordUpdate(String user_id, String hashedPassword) {
		String sql = "UPDATE ACCOUNT SET USER_PASSWORD = ? WHERE user_id = ?";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, hashedPassword);
			pst.setString(2, user_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

	// 예정 여행
	public List<ReservationVo> getcoming(int usernum) {
		String sql = "WITH OrderRanked AS (\r\n" + 
				"    SELECT A.ACCOUNT_ID, R.ORDER_ID, R.PACKAGE_ID, P.PACKAGE_NAME, P.PACKAGE_PRICE,\r\n" + 
				"           P.START_DATE AS PACKAGE_START_DATE, P.END_DATE AS PACKAGE_END_DATE,  \r\n" + 
				"           P.INCLUDED_SERVICES, P.DEPARTURE_ID, P.CHILD_PRICE, P.BABY_PRICE,\r\n" + 
				"           R.ACCOUNT_ID AS RESERVATION_ACCOUNT_ID, R.TOTAL_AMOUNT, R.ORDER_DATE, \r\n" + 
				"           R.TOT_PERSONNEL, R.ADULT_NUMBER, R.CHILD_NUMBER, R.BABY_NUMBER\r\n" + 
				"    FROM RESERVATION R \r\n" + 
				"    JOIN PACKAGES P ON R.PACKAGE_ID = P.PACKAGE_ID \r\n" + 
				"    JOIN ACCOUNT A ON R.ACCOUNT_ID = A.ACCOUNT_ID \r\n" + 
				"    WHERE A.ACCOUNT_ID = ? \r\n" + 
				"    AND P.END_DATE >= CURRENT_DATE \r\n" + 
				")\r\n" + 
				"SELECT * FROM OrderRanked\r\n" + 
				"ORDER BY ORDER_ID DESC";

		List<ReservationVo> reservationList = new ArrayList<>();

		
		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, usernum);
			rs = pst.executeQuery();

			while (rs.next()) {
				ReservationVo reservation = new ReservationVo();
				reservation.setOrder_id(rs.getString("ORDER_ID"));
				reservation.setPackage_id(rs.getString("PACKAGE_ID"));
				reservation.setAccount_id(rs.getInt("ACCOUNT_ID"));
				reservation.setTotal_amount(rs.getInt("TOTAL_AMOUNT"));
				reservation.setOrder_date(rs.getString("ORDER_DATE"));
				reservation.setStart_date(rs.getString("PACKAGE_START_DATE"));
				reservation.setEnd_date(rs.getString("PACKAGE_END_DATE"));
				reservation.setTot_personnel(rs.getInt("TOT_PERSONNEL"));
				reservation.setAdult_number(rs.getInt("ADULT_NUMBER"));
				reservation.setChild_number(rs.getInt("CHILD_NUMBER"));
				reservation.setBaby_number(rs.getInt("BABY_NUMBER"));

				PackagesVo packageInfo = new PackagesVo();
				packageInfo.setPackage_id(rs.getString("PACKAGE_ID"));
				packageInfo.setPackage_name(rs.getString("PACKAGE_NAME"));
				packageInfo.setPackage_price(rs.getInt("PACKAGE_PRICE"));
				packageInfo.setStart_date(rs.getString("PACKAGE_START_DATE"));
				packageInfo.setEnd_date(rs.getString("PACKAGE_END_DATE"));
				packageInfo.setIncluded_services(rs.getString("INCLUDED_SERVICES"));
				packageInfo.setDeparture_id(rs.getInt("DEPARTURE_ID"));
				packageInfo.setChild_price(rs.getInt("CHILD_PRICE"));
				packageInfo.setBaby_price(rs.getInt("BABY_PRICE"));

				reservation.setPackageInfo(packageInfo);
				reservationList.add(reservation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return reservationList;
	}

	// 지난 여행
	public List<ReservationVo> getPastReservations(int usernum) {
		String sql = "WITH OrderRanked AS (\r\n"
				+ "    SELECT A.ACCOUNT_ID, R.ORDER_ID, R.PACKAGE_ID, P.PACKAGE_NAME, P.PACKAGE_PRICE, \r\n"
				+ "        P.START_DATE AS PACKAGE_START_DATE, P.END_DATE AS PACKAGE_END_DATE, \r\n"
				+ "        P.INCLUDED_SERVICES, P.DEPARTURE_ID, P.CHILD_PRICE, P.BABY_PRICE, \r\n"
				+ "        R.ACCOUNT_ID AS RESERVATION_ACCOUNT_ID, R.TOTAL_AMOUNT, R.ORDER_DATE, \r\n"
				+ "        R.TOT_PERSONNEL, R.ADULT_NUMBER, R.CHILD_NUMBER, R.BABY_NUMBER, \r\n"
				+ "        RV.REVIEW_ID, RV.PACKAGE_ID AS REVIEW_PACKAGE_ID, RV.ACCOUNT_ID AS REVIEW_ACCOUNT_ID, \r\n"
				+ "        RV.REVIEW_DATE, RV.CONTENT AS REVIEW_CONTENT, RV.RATING AS REVIEW_RATING, RV.REVIEW_IMAGE,\r\n"
				+ "        ROW_NUMBER() OVER (PARTITION BY R.ORDER_ID ORDER BY RV.REVIEW_DATE DESC) AS rn\r\n"
				+ "    FROM RESERVATION R \r\n" + "    JOIN PACKAGES P ON R.PACKAGE_ID = P.PACKAGE_ID \r\n"
				+ "    JOIN ACCOUNT A ON R.ACCOUNT_ID = A.ACCOUNT_ID \r\n"
				+ "    LEFT JOIN REVIEW RV ON R.PACKAGE_ID = RV.PACKAGE_ID AND A.ACCOUNT_ID = RV.ACCOUNT_ID \r\n"
				+ "    WHERE A.ACCOUNT_ID = ? \r\n" + "    AND P.END_DATE < SYSDATE + 1\r\n" + ")\r\n"
				+ "SELECT * FROM OrderRanked\r\n" + "WHERE rn = 1 order by ORDER_ID desc";

		List<ReservationVo> reservationList = new ArrayList<>();

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, usernum);
			rs = pst.executeQuery();

			while (rs.next()) {
				ReservationVo reservation = new ReservationVo();
				reservation.setOrder_id(rs.getString("ORDER_ID"));
				reservation.setPackage_id(rs.getString("PACKAGE_ID"));
				reservation.setAccount_id(rs.getInt("ACCOUNT_ID"));
				reservation.setTotal_amount(rs.getInt("TOTAL_AMOUNT"));
				reservation.setOrder_date(rs.getString("ORDER_DATE"));
				reservation.setStart_date(rs.getString("PACKAGE_START_DATE"));
				reservation.setEnd_date(rs.getString("PACKAGE_END_DATE"));
				reservation.setTot_personnel(rs.getInt("TOT_PERSONNEL"));
				reservation.setAdult_number(rs.getInt("ADULT_NUMBER"));
				reservation.setChild_number(rs.getInt("CHILD_NUMBER"));
				reservation.setBaby_number(rs.getInt("BABY_NUMBER"));

				PackagesVo packageInfo = new PackagesVo();
				packageInfo.setPackage_id(rs.getString("PACKAGE_ID"));
				packageInfo.setPackage_name(rs.getString("PACKAGE_NAME"));
				packageInfo.setPackage_price(rs.getInt("PACKAGE_PRICE"));
				packageInfo.setStart_date(rs.getString("PACKAGE_START_DATE"));
				packageInfo.setEnd_date(rs.getString("PACKAGE_END_DATE"));
				packageInfo.setIncluded_services(rs.getString("INCLUDED_SERVICES"));
				packageInfo.setDeparture_id(rs.getInt("DEPARTURE_ID"));
				packageInfo.setChild_price(rs.getInt("CHILD_PRICE"));
				packageInfo.setBaby_price(rs.getInt("BABY_PRICE"));

				int reviewId = rs.getInt("REVIEW_ID");
				ReviewVo review = null;

				if (reviewId != 0) { // REVIEW_ID가 0이 아닐 경우만 review 객체 생성
					review = new ReviewVo();
					review.setReview_id(reviewId);
					review.setPackage_id(rs.getString("REVIEW_PACKAGE_ID"));
					review.setAccount_id(rs.getInt("REVIEW_ACCOUNT_ID"));
					review.setReview_date(rs.getString("REVIEW_DATE"));
					review.setContent(rs.getString("REVIEW_CONTENT"));
					review.setRating(rs.getString("REVIEW_RATING"));
					review.setImage(rs.getString("REVIEW_IMAGE"));
				}

				reservation.setReviewInfo(review);
				reservation.setPackageInfo(packageInfo);
				reservationList.add(reservation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return reservationList;
	}

	// 리뷰 등록
	public void ReviewInsert(ReviewVo vo) {
		String sql = "insert into REVIEW(REVIEW_ID, PACKAGE_ID, ACCOUNT_ID, REVIEW_DATE, CONTENT, RATING, REVIEW_IMAGE) values (REVIEW_SEQ.nextval,?,?,sysdate,?,?,?)";

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getPackage_id());
			pst.setInt(2, vo.getAccount_id());
			pst.setString(3, vo.getContent());
			pst.setString(4, vo.getRating());
			pst.setString(5, vo.getImage());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

	// 리뷰 확인
	public ReviewVo ReviewSelect(String packageId, int usernum) {
		String sql = "SELECT * FROM review WHERE PACKAGE_ID = ? and ACCOUNT_ID=?";

		ReviewVo vo = new ReviewVo();

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, packageId);
			pst.setInt(2, usernum);
			rs = pst.executeQuery();

			if (rs.next()) {
				vo.setReview_id(rs.getInt("REVIEW_ID"));
				vo.setPackage_id(rs.getString("PACKAGE_ID"));
				vo.setAccount_id(rs.getInt("ACCOUNT_ID"));
				vo.setReview_date(rs.getString("REVIEW_DATE"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRating(rs.getString("RATING"));
				vo.setImage(rs.getString("REVIEW_IMAGE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return vo;
	}

	public List<PackagesVo> wishList(int usernum) {
		String sql = "SELECT " + "W.WISHLIST_ID, W.PACKAGE_ID, W.ACCOUNT_ID, W.CREATED_AT, W.FIELD AS WISHLIST_FIELD, "
				+ "P.CATEGORY_ID, P.PACKAGE_NAME, P.PACKAGE_PRICE, P.PACKAGE_INFO, P.PROVIDER, "
				+ "P.REVIEW_ID, P.INQUIRY_ID, P.START_DATE, P.END_DATE, P.INCLUDED_SERVICES, P.FIELD AS PACKAGE_FIELD, "
				+ "P.VIEWS, P.DEPARTURE_ID, P.OPTION_ID, P.CHILD_PRICE, P.BABY_PRICE " + "FROM WISHLIST W "
				+ "JOIN PACKAGES P ON W.PACKAGE_ID = P.PACKAGE_ID " + "WHERE W.ACCOUNT_ID = ?";

		List<PackagesVo> list = new ArrayList<PackagesVo>();
		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, usernum);
			rs = pst.executeQuery();

			while (rs.next()) {
				String packageId = rs.getString("PACKAGE_ID");
				PackagesVo packageVo = new PackagesVo();
				packageVo.setPackage_id(packageId);
				packageVo.setCategory_id(rs.getInt("CATEGORY_ID"));
				packageVo.setPackage_name(rs.getString("PACKAGE_NAME"));
				packageVo.setPackage_price(rs.getInt("PACKAGE_PRICE"));
				packageVo.setPackage_info(rs.getString("PACKAGE_INFO"));
				packageVo.setProvider(rs.getString("PROVIDER"));
				packageVo.setStart_date(rs.getString("START_DATE"));
				packageVo.setEnd_date(rs.getString("END_DATE"));
				packageVo.setIncluded_services(rs.getString("INCLUDED_SERVICES"));
				packageVo.setViews(rs.getInt("VIEWS"));
				packageVo.setDeparture_id(rs.getInt("DEPARTURE_ID"));
				packageVo.setChild_price(rs.getInt("CHILD_PRICE"));
				packageVo.setBaby_price(rs.getInt("BABY_PRICE"));

				// 위시리스트 정보를 PackageVo에 추가
				WishlistVo wishlistVo = new WishlistVo();
				wishlistVo.setWishlist_id(rs.getInt("WISHLIST_ID"));
				wishlistVo.setPackage_id(rs.getString("PACKAGE_ID"));
				wishlistVo.setAccount_id(rs.getInt("ACCOUNT_ID"));
				wishlistVo.setCreated_at(rs.getString("CREATED_AT"));

				packageVo.setWishlistInfo(wishlistVo);
				list.add(packageVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}

		return list;
	}

	// 문의 등록
	public void inquiryInsert(BoardVo vo) {

		String sql = "insert into board(ACCOUNT_ID, bno, TITLE, CONTENT, CATEGORY, CREATED_DATE) values(?, bno_seq.nextval, ?, ?, 2, sysdate)";

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, vo.getAccount_id());
			pst.setString(2, vo.getTitle());
			pst.setString(3, vo.getContent());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

	// 문의 리스트
	public List<BoardVo> inquirySelect(int usernum) {
		String sql = "SELECT bno, account_id, title, content, category, created_date FROM Board WHERE ACCOUNT_ID = ? and category = 2 ORDER BY created_date DESC";

		List<BoardVo> boardList = new ArrayList<BoardVo>();

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, usernum);
			rs = pst.executeQuery();
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
				String sql2 = "SELECT comment_id, comment_content, comment_date FROM BOARD_COMMENTS WHERE bno = ? and ACCOUNT_ID = ?";
				pst = conn.prepareStatement(sql2);
				pst.setInt(1, board.getBno());
				pst.setInt(2, usernum);
				ResultSet rs2 = pst.executeQuery();
				while (rs2.next()) {
					BoardCommentsVo comment = new BoardCommentsVo();
					comment.setComment_id(rs2.getInt("comment_id"));
					comment.setComment_content(rs2.getString("comment_content"));
					comment.setComment_date(rs2.getString("comment_date"));
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
			DBManager.getInstence().close(pst, conn);
		}
		return boardList;
	}


}
