package packageService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.PackageSearchDao;
import util.Command;
import vo.PackagesVo;

public class PackageSearchAll implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String destination = request.getParameter("destination");
		String departure = request.getParameter("departure");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		List<PackagesVo> list = new PackageSearchDao().searchPackages(destination, departure, startDate, endDate);
		
		 // 리뷰 조회를 위한 DAO 객체
	    PackageSearchDao reviewDao = new PackageSearchDao();

	    // 각 상품의 리뷰 별점 평균과 리뷰 수 설정
	    for (PackagesVo packageItem : list) {
	        String pkgId = packageItem.getPackage_id();

	        double avgRating = reviewDao.totreviewrating(pkgId);
	        int reviewCount = reviewDao.totreivew(pkgId);

	        packageItem.setAvgRating(avgRating);
	        packageItem.setReviewCount(reviewCount);
	    }
	    
		request.setAttribute("list", list);
		request.setAttribute("searchcnt", list.size());
		System.out.println("검색어 - 여행지: " + destination);
		System.out.println("검색어 - 출발지: " + departure);
		System.out.println("검색어 - 출발일: " + startDate);
		System.out.println("검색어 - 종료일: " + endDate);
		System.out.println("검색된 패키지 개수: " + list.size());
	}

}
