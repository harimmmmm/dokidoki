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
		
		request.setAttribute("list", list);
		request.setAttribute("searchcnt", list.size());
		System.out.println("검색어 - 여행지: " + destination);
		System.out.println("검색어 - 출발지: " + departure);
		System.out.println("검색어 - 출발일: " + startDate);
		System.out.println("검색어 - 종료일: " + endDate);
		System.out.println("검색된 패키지 개수: " + list.size());
	}

}
