package managerService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import managerDao.ManagerDao;
import travelService.Command;
import vo.PackagesVo;

public class PackageView implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		List<PackagesVo> palist = new ManagerDao().packageView();
		
		request.setAttribute("palist", palist);

	}

}
