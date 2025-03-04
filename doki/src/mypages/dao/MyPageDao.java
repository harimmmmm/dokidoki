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
