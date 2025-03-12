package packageService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.PackageSearchDao;
import util.Command;
import vo.PackagesVo;
import vo.ReviewVo;

public class SelectPackage implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String package_id = request.getParameter("package_id");
		System.out.println(package_id);
		PackagesVo vo = new PackagesVo();
		PackageSearchDao dao = new PackageSearchDao();
		
		dao.viewsCount(package_id); // 조회수
		List<ReviewVo> review = dao.review(package_id); // 리뷰
		double totrating = dao.totreviewrating(package_id); // 리뷰별점평균
		int totreivew = dao.totreivew(package_id);  //총리뷰 수
		
		
		List<String> images = dao.getImagePathsByProductCode(package_id); // 이미지
		int totNumReservation = dao.totNumReservation(package_id); // 총 예약인원
		
		vo = dao.selectIdPackage(package_id);
		
		int basicadult = vo.getPackage_price()-1540;
		int basicchild = vo.getChild_price()-1540;
		int basicbaby = vo.getBaby_price()-1540;
		
		//박수 ------------------------------------------------------------------------------
        // 패턴 설정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // VO에서 불러온 날짜 문자열 예시
        String startDateStr = vo.getStart_date();;
        String endDateStr = vo.getEnd_date();;

        // 날짜 변환
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        // 숙박일수 계산 (체크아웃 - 체크인)
        long nights = ChronoUnit.DAYS.between(startDate, endDate);

        // 며칠은 숙박일수 + 1
        long days = nights + 1;
        //------------------------------------------------------------------------------
        
        
        
		request.setAttribute("view", vo);
		request.setAttribute("review", review);
		request.setAttribute("totrating", totrating);
		request.setAttribute("totreivew", totreivew);
		request.setAttribute("totNumReservation", totNumReservation);
		request.setAttribute("nights", nights);
		request.setAttribute("days", days);
		request.setAttribute("imagePaths", images);
		request.setAttribute("basicadult", basicadult);
		request.setAttribute("basicchild", basicchild);
		request.setAttribute("basicbaby", basicbaby);
		
	}

}
