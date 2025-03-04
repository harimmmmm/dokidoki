package util;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

public class FileUploadUtil {

	public List<String> uploadImages(Collection<Part> parts, String uploadDirPath) {

		// 파일 여러개 저장 후 DB 저장용 상대경로 목록 반환

		List<String> savedFilePaths = new ArrayList<>();

		File uploadDir = new File(uploadDirPath);
		if (!uploadDir.exists())
			uploadDir.mkdirs();

		for (Part imgfile : parts) {
			if (imgfile.getName().equals("imgfile") && imgfile.getSize() > 0) {
				String filename = UUID.randomUUID().toString() + "_" + imgfile.getSubmittedFileName();
				String filePath = uploadDirPath + File.separator + filename;

				try {
					imgfile.write(filePath); // 파일 저장
					savedFilePaths.add("uploads/" + filename); // DB 저장용 경로 추가
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return savedFilePaths;
	}
}