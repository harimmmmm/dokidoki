package boardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardService.Boardlist;
import boardService.Noticelist;
import boardService.SelectBoard;
import boardService.SelectNotice;
import packageService.PackageAdd;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/boards/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {   
    	request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("action = " + action);
		String page = null;
		
		switch (action) {
		case "/boardlist.do":
			new Boardlist().docommand(request, response);
			page = "/board/services.jsp";
			break;
		case "/board.do":
			new SelectBoard().docommand(request, response);
			page = "/board/services2.jsp";
			break;
		case "/noticelist.do":
			new Noticelist().docommand(request, response);
			page = "/notice/noticelist.jsp";
			break;
		case "/noticeSelect.do":
			new SelectNotice().docommand(request, response);
			page = "/notice/noticeSelect.jsp";
			break;
		}
		
		if (page != null) {
		    request.getRequestDispatcher(page).forward(request, response);
		}

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
}
