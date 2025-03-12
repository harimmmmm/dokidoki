package boardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.BoardVo;

public class BoardDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<BoardVo> boardlist() {
		String sql = "select * from board where category='3'";
		List<BoardVo> list = new ArrayList<BoardVo>();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setBoard_img(rs.getString("board_img"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return list;
	}
	
	public BoardVo selectboard(int bno) {
		String sql = "select * from board where category='3' and bno = ?";
		BoardVo vo = new BoardVo();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setBoard_img(rs.getString("board_img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return vo;
	}
	
	public List<BoardVo> noticelist() {
		String sql = "select * from board where category='1'";
		List<BoardVo> list = new ArrayList<BoardVo>();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setBoard_img(rs.getString("board_img"));
				vo.setCreated_date(rs.getString("created_date"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return list;
	}
	
	public BoardVo selectnotice(int bno) {
		String sql = "select * from board where category='1' and bno = ?";
		BoardVo vo = new BoardVo();
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setBoard_img(rs.getString("board_img"));
				vo.setCreated_date(rs.getString("created_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn, rs);
		}
		return vo;
	}
}
