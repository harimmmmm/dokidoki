package account.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

@SuppressWarnings("unchecked")
public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionCode = (String) session.getAttribute("verificationCode");
		String inputCode = request.getParameter("code");

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		JSONObject jsonResponse = new JSONObject();

		if (sessionCode != null && sessionCode.equals(inputCode)) {
			jsonResponse.put("success", true);
		} else {
			jsonResponse.put("success", false);
		}

		response.getWriter().write(jsonResponse.toString());
	}
}
