package mypages.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;
import vo.AccountVo;

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
		}finally {
			DBManager.getInstence().close(pst, conn);
		}
	}

}






















