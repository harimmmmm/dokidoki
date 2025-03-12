package account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;
import vo.AccountVo;

public class LoginDao {

	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public AccountVo searchIdPw(String userid) {

		String sql = "select * from ACCOUNT where USER_ID = ?";

		AccountVo vo = null;

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			if (rs.next()) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return vo;
	}

	public AccountVo getUserEmail(String email) {

		String sql = "SELECT * FROM ACCOUNT WHERE EMAIL = ?";

		AccountVo vo = null;

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			System.out.println("Executing query for email: " + email);
			rs = pst.executeQuery();
			if (rs.next()) {
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	// 아이디 찾기
	public AccountVo idResult(String name, String email) {

		String sql = "SELECT * FROM ACCOUNT WHERE EMAIL = ? AND NAME_KANJI = ?";

		AccountVo vo = null;

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, name);
			rs = pst.executeQuery();
			if (rs.next()) {
				vo = new AccountVo();
				vo.setUser_id(rs.getString("USER_ID"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return vo;
	}

	// 비번
	public AccountVo getUserByToken(String userId, String userName) {
		
		String sql = "SELECT * FROM ACCOUNT WHERE USER_ID = ? AND NAME_KANJI = ?";
		
		AccountVo vo = null;
		
		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, userName);
			rs = pst.executeQuery();
			if (rs.next()) {
				vo = new AccountVo();
				vo.setUser_id(rs.getString("USER_ID"));
				vo.setName_kanji(rs.getString("NAME_KANJI"));
				vo.setEmail(rs.getString("EMAIL"));
			} else {
				return null; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return vo;
	}
	
	public void updatePassword(String temporaryPassword, String userId) {
		String sql = "UPDATE ACCOUNT SET USER_PASSWORD = ? WHERE user_id = ?";
		
		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, temporaryPassword);
			pst.setString(2, userId);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

}
