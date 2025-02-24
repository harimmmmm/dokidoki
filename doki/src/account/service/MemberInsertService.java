package account.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.dao.SignDao;
import travelService.Command;
import util.PasswordUtil;
import vo.AccountVo;

public class MemberInsertService  implements Command{

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		AccountVo vo = new AccountVo();
		vo.setUser_id(request.getParameter("user_id"));
		String password = request.getParameter("user_password");
		vo.setUser_password(PasswordUtil.hashPassword(password));
		vo.setName(request.getParameter("name"));
		vo.setName_kanji(request.getParameter("name_kanji"));
		vo.setName_kana(request.getParameter("name_kana"));
		vo.setBirth_date(request.getParameter("birth_date"));
		vo.setTel(request.getParameter("tel"));
		vo.setEmail(request.getParameter("email"));
		vo.setPostal_code(request.getParameter("postal_code"));
		vo.setPrefecture(request.getParameter("prefecture"));
		vo.setCity(request.getParameter("city"));
		vo.setTown(request.getParameter("town"));
		vo.setBuilding(request.getParameter("building"));
		vo.setJoin_date(request.getParameter("join_date"));
		vo.setSocial_login(request.getParameter("social_login"));
		vo.setPassport_number(request.getParameter("passport_number"));
		vo.setPassport_expiry(request.getParameter("passport_expiry"));
		
		new SignDao().memberInsert(vo);
	}

}
