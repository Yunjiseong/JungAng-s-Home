package com.spring.myWeb.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;

	//회원가입페이지이동
	@GetMapping("userJoinPage")
	public String joinPage() {
		return "user/joinpage";
	}

	//회원가입요청
	@PostMapping("/userJoin")
	public void join(UserVO vo) {
		System.out.println("회원가입요청");
		service.userJoin(vo);
	}
	
	//회원정보수정요청
	@PostMapping("/userUpdate")
	public void userUpdate(UserVO vo) {
		System.out.println("회원정보수정요청");
		service.userUpdate(vo);
	}
	
	//회원탈퇴요청
	@PostMapping("/userDelete")
	public void userDelete(@Param("id")String id, @Param("pw")String pw) {
		System.out.println("회원탈퇴요청");
		service.userDelete(id, pw);
	}

	//로그인페이지이동
	@GetMapping("/userLoginPage")
	public String loginPage() {
		return "user/loginpage";
	}
	
}
