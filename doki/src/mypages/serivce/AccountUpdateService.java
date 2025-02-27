package mypages.serivce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;

public class AccountUpdateService implements Command{

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
		    String userid = userSession.getUser_id();  
		    System.out.println("세션아이디-------> : " + userid);
		    
		    AccountVo vo = new AccountVo();
		    
		    vo.setUser_id(userid);
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
		    
		    new MyPageDao().AccountUpdate(vo);
		    
		} else {
		    System.out.println("세션 없다...");
		}
	}
}
