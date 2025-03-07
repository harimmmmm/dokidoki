package mypages.serivce;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.ReviewVo;

@MultipartConfig
public class Reviewservice implements Command {

    @Override
    public void docommand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        // 세션에서 로그인한 사용자 정보 가져오기
        AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
        if (userSession != null) {
            int usernum = userSession.getAccount_id();
            System.out.println("세션아이디-------> : " + usernum);

            // 폼 파라미터 가져오기
            String content = request.getParameter("content");
            String packageId = request.getParameter("packageid");
            String rating = request.getParameter("rating");

            System.out.println("++" + packageId);
            Collection<Part> parts = request.getParts(); 
            Part imagePart = null;
            String filename = null;

            for (Part part : parts) {
                if ("image".equals(part.getName())) {
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

            ReviewVo vo = new ReviewVo();
            vo.setPackage_id(packageId);
            vo.setAccount_id(usernum);
            vo.setContent(content);
            vo.setRating(rating);
            vo.setImage(filename);
            // DB에 리뷰 저장
            MyPageDao dao = new MyPageDao();
            dao.ReviewInsert(vo);

            // 성공 응답 반환
            response.getWriter().write("success");
        } else {
            System.out.println("세션 없다...");
        }
    }
}
