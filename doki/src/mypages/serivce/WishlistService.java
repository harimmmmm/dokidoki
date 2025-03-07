package mypages.serivce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.dao.MyPageDao;
import packageModel.PackageListDao;
import travelService.Command;
import vo.AccountVo;
import vo.PackagesVo;
import vo.WishlistVo;

public class WishlistService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
		    int usernum = userSession.getAccount_id();
		    
		    List<PackagesVo> wishlist = new MyPageDao().wishList(usernum);
		    		
		    		
		    request.setAttribute("wishlist", wishlist);
		} else {
		    System.out.println("세션 없다...");
		}
		
	}

}
