package managerService;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import managerDao.ManagerDao;
import travelService.Command;
import vo.BoardVo;

public class NoticeInsert implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");

		 Collection<Part> parts = request.getParts(); 
         Part imagePart = null;
         String filename = null;

         for (Part part : parts) {
        	    if ("board_img".equals(part.getName())) { 
        	        imagePart = part;
        	        break;
        	    }
        	}


         // 이미지 파일이 있다면 처리
         if (imagePart != null && imagePart.getSize() > 0) {
             filename = UUID.randomUUID().toString() + "_" + imagePart.getSubmittedFileName();
             System.out.println("Uploaded file name: " + filename);


             // 업로드 경로 설정
             String uploadPath = request.getServletContext().getRealPath("") + "uploads"; 
             System.out.println("upload path = " + uploadPath);
             File uploadDir = new File(uploadPath);

             // 업로드 디렉토리가 없으면 생성
             if (!uploadDir.exists()) {
                 uploadDir.mkdir();
             }

             // 파일 저장 경로 설정
             String filePath = uploadPath + File.separator + filename;
             imagePart.write(filePath); 
         }

		System.out.println("sdsd11"+filename);
		BoardVo vo = new BoardVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setCategory(category);
		vo.setBoard_img(filename);
		
		ManagerDao dao = new ManagerDao();
		dao.boardInsert(vo);
	}

}
