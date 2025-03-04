package mypages.serivce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.BoardVo;

public class InquiriesInsertService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
			int usernum = userSession.getAccount_id();
			System.out.println("세션아이디-------> : " + usernum);

			BoardVo vo = new BoardVo();
			vo.setAccount_id(usernum);
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));
			
			new MyPageDao().inquiryInsert(vo);
		} else {
			System.out.println("세션 없다...");
		}
	}
}
