package boardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;
import vo.BoardVo;

public class boardDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void boardInsert(BoardVo vo) {
		String sql = " insert into board(bno,account_id,title,content)\r\n " + " values(board_seq.nextval,?,?,?) ";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,vo.getAccount_id() );
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pstmt, conn);
		}
	}
	
}
