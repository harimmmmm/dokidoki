package packageController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageService.PackageSearchAll;
import packageService.PackagesList;

@WebServlet("/pakage/*")
public class PackagesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PackagesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("Action: " + action);
		String page = null;
		
		
		switch (action) {
		case "/packagesList.do":
			new PackagesList().docommand(request, response);
			page ="/product/packagesList.jsp";
			break;
		case "/packageSelect.do":
			new PackageSearchAll().docommand(request, response);
			page ="/product/packageSelect.jsp";
			break;
		}
		
		if (page != null) {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
