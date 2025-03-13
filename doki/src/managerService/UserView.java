package managerService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import managerDao.ManagerDao;
import travelService.Command;
import vo.BoardVo;

public class UserView implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		List<BoardVo> list = new ManagerDao().boardView();
		
		request.setAttribute("list", list);
		
		 // 로그 추가
        System.out.println("NoticeView: docommand method is called");

        // 추가적인 로그로 흐름 추적
        System.out.println("NoticeView: Before any DB operation");

	}

}
