package packageService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.PackageListDao;
import packageModel.PackageSearchDao;
import util.Command;
import vo.PackagesVo;

public class PackagesList implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		PackageListDao dao = new PackageListDao();
		
		List<PackagesVo> allList = new ArrayList<PackagesVo>();
		allList = dao.packageAllList();
		List<PackagesVo> newList = new ArrayList<PackagesVo>();
		newList = dao.newPackageList();
		List<PackagesVo> bestList = new ArrayList<PackagesVo>();
		bestList = dao.bestPackageList();
		
		 // 리뷰 조회를 위한 DAO 객체
	    PackageSearchDao reviewDao = new PackageSearchDao();

	    // 각 상품의 리뷰 별점 평균과 리뷰 수 설정
	    for (PackagesVo packageItem : bestList) {
	        String pkgId = packageItem.getPackage_id();

	        double avgRating = reviewDao.totreviewrating(pkgId);
	        int reviewCount = reviewDao.totreivew(pkgId);

	        packageItem.setAvgRating(avgRating);
	        packageItem.setReviewCount(reviewCount);
	    }
	    for (PackagesVo packageItem : newList) {
	        String pkgId = packageItem.getPackage_id();

	        double avgRating = reviewDao.totreviewrating(pkgId);
	        int reviewCount = reviewDao.totreivew(pkgId);

	        packageItem.setAvgRating(avgRating);
	        packageItem.setReviewCount(reviewCount);
	    }
	    for (PackagesVo packageItem : allList) {
	        String pkgId = packageItem.getPackage_id();

	        double avgRating = reviewDao.totreviewrating(pkgId);
	        int reviewCount = reviewDao.totreivew(pkgId);

	        packageItem.setAvgRating(avgRating);
	        packageItem.setReviewCount(reviewCount);
	    }
		
		request.setAttribute("allList", allList);
		request.setAttribute("newList", newList);
		request.setAttribute("bestList", bestList);
	}

}
