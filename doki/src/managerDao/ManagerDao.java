package managerDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.AccountVo;
import vo.BoardVo;

public class ManagerDao {
	
	public List<AccountVo> userView() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select user_id, name, name_kanji, birth_date, tel, email, join_date, access_rights from account";
		
		List<AccountVo> list = new ArrayList<AccountVo>();
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AccountVo vo = new AccountVo();
				vo.setUser_id(rs.getString("user_id"));
				vo.setName(rs.getString("name"));
				vo.setName_kanji(rs.getString("name_kanji"));
				vo.setBirth_date(rs.getString("birth_date"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setJoin_date(rs.getString("join_date"));
				vo.setAccess_rights(rs.getInt("access_right"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		
		return list;
	}
	
	
	public void productInsert() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void productView() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void paymentView() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void reservationView() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void boardInsert(BoardVo vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into board (bno, account_id, title, content, category, created_date) " + 
				"values (board_seq.nextval, user_seq.nextval, ?, ?, ?, sysdate);";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(1, vo.getContent());
			pstmt.setString(1, vo.getCategory());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn);
		}
	}
	
	public List<BoardVo> boardView() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select bno, account_id, title, content, category from board";
		
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setBno(rs.getInt("bno"));
				vo.setAccount_id(rs.getInt("account_id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		
		return list;
	}

	
}
