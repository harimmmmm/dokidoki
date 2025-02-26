package mypages.serivce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;

public class AccountListService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
		    String userid = userSession.getUser_id();  
		    System.out.println("세션아이디-------> : " + userid);
		    AccountVo vo = new MyPageDao().getAccountList(userid);
		    request.setAttribute("vo", vo);
		} else {
		    System.out.println("세션 없다...");
		}
	}

}
