package packageService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import packageModel.WishlistDao;
import travelService.Command;
import vo.AccountVo;
import vo.PackagesVo;

public class WishlistList implements Command {
    @Override
    public void docommand(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(false);
            if(session == null || session.getAttribute("user") == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            AccountVo account = (AccountVo) session.getAttribute("user");
            WishlistDao dao = new WishlistDao();

            // 🔥 반드시 DAO로부터 매번 DB에서 실시간 조회해서 응답
            List<String> wishlist = dao.selectWishlistByAccount(account.getAccount_id());
            
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(new Gson().toJson(wishlist));

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
