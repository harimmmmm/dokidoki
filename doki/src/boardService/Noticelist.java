package boardService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardModel.BoardDao;
import util.Command;
import vo.BoardVo;

public class Noticelist implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		BoardDao dao = new BoardDao();
		
		List<BoardVo> boardlist = dao.noticelist();
		
		request.setAttribute("list", boardlist);
	}

}
