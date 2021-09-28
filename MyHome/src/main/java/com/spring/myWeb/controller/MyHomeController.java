package com.spring.myWeb.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.myhome.service.IMyHomeService;
import com.spring.myWeb.myhome.util.PageVO;

@Controller
@RequestMapping("/myhome")
public class MyHomeController {

	@Autowired
	private IMyHomeService service;

	@GetMapping("/homeList")
	public String homeList() {
		System.out.println("/myhome/homeList: GET");
		PageVO paging = new PageVO();
		System.out.println("총 게시물 수: " + service.getTotalArticles(paging));

		return "myhome/homeList";
	}

	//내집뽐내기 글 목록 이동 (페이지 이동)
	@ResponseBody
	@GetMapping("/getList")
	public Map<String, Object> getList(PageVO paging, Model model) {
		System.out.println("/myhome/getList: GET");
		System.out.println("page객체: " + paging);

		List<MyHomeVO> list = service.getList(paging);				
		int total = service.getTotalArticles(paging);

		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("total", total);		

		System.out.println("총 게시물 수: " + service.getTotalArticles(paging));

		return map;
	}

	//내집뽐내기 글쓰기 페이지 이동
	@GetMapping("/homeWrite")
	public void homeWrite() {
		System.out.println("/myhome/homeWrite: GET");
	}		


	//내집뽐내기 글 등록
	@PostMapping("/homeWrite")
	public String homeWrite(MyHomeVO vo, @RequestParam("file") MultipartFile file, HttpSession session, RedirectAttributes ra) {
		System.out.println("/myhome/homeWrite: POST");

		try {
//			int userNum = ((UserVO)session.getAttribute("user")).getUserNum();
			int userNum = 0720;

			//업로드 경로 설정
			String fileRealName = file.getOriginalFilename();
			long size = file.getSize();		
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
			String path = "C:\\home\\myhome\\upload\\" + Integer.toString(userNum);

			//폴더 생성
			File folder = new File(path);
			if(!folder.exists())
				folder.mkdirs();		

			//날짜객체 생성
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileDate = sdf.format(date);

			//파일명 난수화
			UUID uuid = UUID.randomUUID();
			String codeName = uuid.toString().split("-")[0];
			String fileName = codeName + "_" + fileDate + fileExtension;

			//파일 저장
			File saveFile = new File(path + "\\" + fileName);			
			file.transferTo(saveFile);	

			//DB에 저장
			vo.setThumbImg(path + "\\" + fileName);
			System.out.println("이미지 경로: " + path + "\\" + fileName);
			service.regist(vo);

		} catch (Exception e) {
			e.printStackTrace();
		}	

		return "redirect:/myhome/homeList";

	}
	

	//내집뽐내기 글 상세보기 이동
	@GetMapping("/homeDetail")
	public void homeDetail(int bno, Model model) {
		System.out.println("/myhome/homeDetail: GET");
		MyHomeVO vo = service.getDetail(bno);
		vo.setProfile(service.getProfile(vo.getWriter()));

		model.addAttribute("home", vo);
	}

	//사진 가져오는 메서드
	@GetMapping("/display")
	public ResponseEntity<byte[]> display(String userNum, String fileName) {
		System.out.println("fileLoca: " + userNum);

		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);		
		System.out.println("변환 후 fileName: " + fileName);

		File file = new File("C:\\home\\myhome\\upload\\" + userNum + "\\" + fileName);
		System.out.println(file);

		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 반환해 주는 메서드.
			//사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있습니다.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			//ResponseEntity<>(바디에 담을 내용, 헤더에 담을 내용, 상태 메세지)
			//FileCopyUtils: 파일 및 스트림 복사를 위한 간단한 유틸리티 메서드의 집합체.
			//file 객체 안에 있는 내용을 복사해서 byte배열 형태로 바디에 담아서 전달.
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	//내집뽐내기 글 수정페이지 이동
	@GetMapping("/homeModify")
	public void homeModify() {
		System.out.println("/myhome/homeModify: GET");
	}

	//내집뽐내기 글 수정
	@PostMapping("/homeUpdate")
	public String homeUpdate(MyHomeVO vo, RedirectAttributes ra) {
		System.out.println("/myhome/homeUpdate: POST");
		ra.addFlashAttribute("msg", "updateSuccess");

		return "redirect:/myhome/homeDetail?bno=" + vo.getBno();
	}

	//내집뽐내기 글 삭제
	@GetMapping("/homeDelete")
	public String homeDelete(int bno, RedirectAttributes ra) {
		System.out.println("/myhome/homeDelete: GET");
		ra.addFlashAttribute("msg", "deleteSuccess");

		return "redirect:/myhome/homeList";
	}		



}