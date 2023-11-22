package com.kh.muze.attachment.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AttachmentController {
	
	// 파일 명,경로 생성 메소드
	public String saveFiles(MultipartFile upfile,HttpSession session) {
		// 파일의 원본명, 서버의 업로드 할 경로 + 바뀐 이름을 a에 이어서 담기
		// 파일 명 수정 전,후 서버에 업로드시키기(예)"bono.jsp → 날짜+시간+랜덤넘버.jsp
		
		// 파일 원본 명
		String originName = upfile.getOriginalFilename();
		// 업로드 날짜,시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 랜덤 숫자
		int ranNum = (int)Math.random() * 90000 + 10000;
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		// 수정 명
		String modifiedName = currentTime + ranNum + ext;
		// 저장 경로
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + modifiedName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "resources/uploadFiles/" + modifiedName;
	}

}
