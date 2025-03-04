package packageService;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageModel.PackageSearchDao;
import util.Command;
import vo.PackagesVo;

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
		List<String> images = dao.getImagePathsByProductCode(package_id); // 이미지
		
		vo = dao.selectIdPackage(package_id);
		
		int basicadult = vo.getPackage_price()-15400;
		int basicchild = vo.getChild_price()-15400;
		int basicbaby = vo.getBaby_price()-15400;
		
		request.setAttribute("view", vo);
		request.setAttribute("imagePaths", images);
		request.setAttribute("basicadult", basicadult);
		request.setAttribute("basicchild", basicchild);
		request.setAttribute("basicbaby", basicbaby);
		
	}

}
