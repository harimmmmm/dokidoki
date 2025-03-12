package boardService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardModel.BoardDao;
import util.Command;
import vo.BoardVo;

public class SelectNotice implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		int bno =Integer.parseInt(request.getParameter("bno"));
		
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		
		vo = dao.selectnotice(bno);
		
		request.setAttribute("list", vo);
		
	}

}
