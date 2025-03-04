package mypages.serivce;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.tools.sjavac.server.SysInfo;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.BoardVo;

public class InquiriesListService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
			int usernum = userSession.getAccount_id();
			
			List<BoardVo> boardList = new MyPageDao().inquirySelect(usernum);

			request.setAttribute("boardList", boardList);

			// JSON 변환
			Gson gson = new Gson();
			String boardListJson = gson.toJson(boardList);
			request.setAttribute("boardListJson", boardListJson);
			
		} else {
			System.out.println("세션 없다...");
		}

	}

}
