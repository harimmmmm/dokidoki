package packageService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.WishlistDao;
import util.Command;
import vo.AccountVo;

public class WishlistAdd implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String packageId = request.getParameter("package_id");
        AccountVo account = (AccountVo)request.getSession().getAttribute("user");
        
        if(account == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 반환
            return;
        }

        WishlistDao dao = new WishlistDao();
        dao.insertWishlist(account.getAccount_id(), packageId);
        
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("{\"status\":\"added\"}");
	}

}
