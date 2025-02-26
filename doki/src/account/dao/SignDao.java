package account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;
import vo.AccountVo;

public class SignDao {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public void memberInsert(AccountVo vo) {
		String sql = "INSERT INTO account(ACCOUNT_ID, USER_ID, USER_PASSWORD, NAME, NAME_KANJI, NAME_KANA, "
				+ "BIRTH_DATE, TEL, EMAIL, " + "POSTAL_CODE, PREFECTURE, CITY, TOWN, BUILDING, "
				+ "ACCOUNT_STATUS, JOIN_DATE, SOCIAL_LOGIN, ACCESS_RIGHTS, PASSPORT_NUMBER, PASSPORT_EXPIRY) "
				+ "VALUES (ACCOUNT_ID_seq.nextval, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?," + " ?, ?, ?, ?, ?,"
				+ " 1, SYSDATE, '1', 1, ?, ?)";

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);

			// Set string values
			pst.setString(1, vo.getUser_id());
			pst.setString(2, vo.getUser_password());
			pst.setString(3, vo.getName());
			pst.setString(4, vo.getName_kanji());
			pst.setString(5, vo.getName_kana());

			pst.setString(6, vo.getBirth_date()); // Assuming birth_date is in 'YYYY-MM-DD' format

			pst.setString(7, vo.getTel());
			pst.setString(8, vo.getEmail());

			pst.setString(9, vo.getPostal_code());
			pst.setString(10, vo.getPrefecture());
			pst.setString(11, vo.getCity());
			pst.setString(12, vo.getTown());
			pst.setString(13, vo.getBuilding());

			// Account status, join_date, social_login, access_rights
//	        pst.setInt(14, vo.getAccount_status());
//			pst.setString(15, vo.getJoin_date());
//			pst.setString(16, vo.getSocial_login()); // Social login (assuming this is a string)
//			pst.setInt(17, vo.getAccess_rights()); // Access rights as an integer

			// Passport details
			pst.setString(14, vo.getPassport_number());
			pst.setString(15, vo.getPassport_expiry());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

	public int memberFindUserid(String userid) {
		String sql = "SELECT COUNT(*) FROM account WHERE user_id = ?";
		int result = 0;

		try {
			conn = DBManager.getInstence().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getInstence().close(pst, conn, rs);
		}
		return result;
	}

}
