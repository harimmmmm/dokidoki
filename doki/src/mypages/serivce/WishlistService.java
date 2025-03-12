package mypages.serivce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.dao.MyPageDao;
import packageModel.PackageListDao;
import packageModel.PackageSearchDao;
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
		    		
			 // 리뷰 조회를 위한 DAO 객체
		    PackageSearchDao reviewDao = new PackageSearchDao();

		    // 각 상품의 리뷰 별점 평균과 리뷰 수 설정
		    for (PackagesVo packageItem : wishlist) {
		        String pkgId = packageItem.getPackage_id();

		        double avgRating = reviewDao.totreviewrating(pkgId);
		        int reviewCount = reviewDao.totreivew(pkgId);

		        packageItem.setAvgRating(avgRating);
		        packageItem.setReviewCount(reviewCount);
		    }		
		    
		    request.setAttribute("wishlist", wishlist);
		} else {
		    System.out.println("세션 없다...");
		}
		
	}

}
