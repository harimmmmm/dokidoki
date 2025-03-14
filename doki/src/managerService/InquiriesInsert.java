package managerService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managerDao.ManagerDao;
import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.BoardVo;

public class InquiriesInsert implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("--->" +bno);
		BoardVo vo = new BoardVo();
		vo.setBno(bno);
		vo.setAccount_id(0);
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));

		new ManagerDao().inquiryInsert(vo);
	}
}
