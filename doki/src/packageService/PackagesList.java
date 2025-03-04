package packageService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.PackageListDao;
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
		
		
		
		
		request.setAttribute("allList", allList);
		request.setAttribute("newList", newList);
		request.setAttribute("bestList", bestList);
		
	}

}
