package managerService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.tools.sjavac.server.SysInfo;

import managerDao.ManagerDao;
import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.BoardVo;

public class InquiriesList implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		List<BoardVo> boardList = new ManagerDao().inquirySelect();

		request.setAttribute("boardList", boardList);

		// JSON 변환
		Gson gson = new Gson();
		String boardListJson = gson.toJson(boardList);
		request.setAttribute("boardListJson", boardListJson);
		System.out.println("sss" + boardListJson);

	}

}
