package packageService;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import util.Command;
import util.FileUploadUtil;
import util.RandomUtil;
import vo.PackagesVo;

public class PackageAdd implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		packageModel.PackageAdd dao = new packageModel.PackageAdd();
		FileUploadUtil uploadimg = new FileUploadUtil();
		
		String productCode = RandomUtil.generateUpperAlphaNumeric(10); 	// 상품 코드
		String package_name = request.getParameter("name"); // 패키지 제목
		int package_price = Integer.parseInt(request.getParameter("package_price")); // 성인 가격
		int child_price = Integer.parseInt(request.getParameter("child_price")); // 아동 가격
		int baby_price = Integer.parseInt(request.getParameter("baby_price")); // 유아 가격
		String start_date = request.getParameter("start_date"); // 여행 출발일
		String end_date = request.getParameter("end_date"); // 여행 종료일
		String package_info = request.getParameter("content"); // 상품 내용
		String included_services = request.getParameter("included_services"); // 태그
		int category_id = Integer.parseInt(request.getParameter("destination")); //목적지
		int departure_id = Integer.parseInt(request.getParameter("departure"));  // 출발지
		
		
		// 이미지 
        Collection<Part> parts = request.getParts();
        String uploadPath = request.getServletContext().getRealPath("") + "uploads";
        List<String> imagePaths = uploadimg.uploadImages(parts, uploadPath);

        // 상품 이미지 DB에 저장
        for (String imgPath : imagePaths) {
        	dao.saveProductImage(productCode, imgPath);
        }
        
        PackagesVo vo = new PackagesVo();
        
        vo.setPackage_id(productCode);
        vo.setPackage_name(package_name);
        vo.setPackage_price(package_price);
        vo.setChild_price(child_price);
        vo.setBaby_price(baby_price);
        vo.setStart_date(start_date);
        vo.setEnd_date(end_date);
        vo.setPackage_info(package_info);
        vo.setIncluded_services(included_services);
        vo.setCategory_id(category_id);
        vo.setDeparture_id(departure_id);
        
        dao.pakageInsert(vo);
        
	}

}
