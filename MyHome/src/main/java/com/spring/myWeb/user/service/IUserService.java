package com.spring.myWeb.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.command.QuizVO;
import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.quiz.util.QuizPageVO;

public interface IUserService {

	//CRUD 기능 메서드
	//회원등록
	void userJoin(UserVO vo);
	
	//회원정보 불러오기
	UserVO userInfo(int userNum);
	
	//회원정보 수정
	void userUpdate(UserVO vo);
	
	// 회원탈퇴
	void userDelete(String id);
	
	//로그인 성공 여부
	int userLogin(@Param("id") String id, @Param("pw") String pw);
	
	//아이디 중복체크
	int idCheck(String id);
	
	//닉네임 중복체크
	int nickCheck(String nickName);
	
	// 뽐내기 게시글
	List<MyHomeVO> homeArticles(String nick, QuizPageVO page);
	
	// 뽐내기 글
	MyHomeVO homeArticle(int bno);	
			
	// q&a 게시글
	List<QuizVO> quizArticles(String nick, String type, QuizPageVO page);
		
	// 게시글 수
	int getTotalCount(@Param("type") String type, @Param("nick") String nick);
	
	// 스크랩 게시글
	List<MyHomeVO> getScrap(@Param("pageNum") int pageNum, @Param("nick") String nick);
	
	// 스크랩 게시글 수
	int scrapCount(String nick);
	
	// 등업 회원 정보
	List<UserVO> proInfo(QuizPageVO page);
}
