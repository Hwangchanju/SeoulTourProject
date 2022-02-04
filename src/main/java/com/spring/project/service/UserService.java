package com.spring.project.service;

import java.util.List;

import com.spring.project.commons.SearchVO;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;

public interface UserService {

	// 회원 가입
	int u_join(UserVO vo);

	// 아이디 중복 체크 기능
	int u_checkIdDuplicate(String user_id);

	// 회원 정보 조회
	UserVO u_selectOne(String user_id);

	// 회원 탈퇴
	int u_delete(UserVO vo);

	// 회원정보 전체 조회 (검증)
	//List<UserVO> u_findAll();
	
	//----------------
	
	// 회원 아이디 찾기
	UserVO u_findId(UserVO vo, String find_by);
	
	// 회원 비번 찾기
	UserVO u_findPw(UserVO vo, String find_by);
	

	// 마이페이지 수정
	int u_updateMyPage(UserVO vo);


	
	//-------커뮤니티---------//
	// 글 저장
	int u_insertCont(ContVO vo);
	
	// 글 불러오기
	ContVO u_selectCont(int content_no);
	
	// 게시판 목록 불러오기 (검색기능 포함하면 SearchVO로 바꾸기)
	List<ContVO> u_ListCont(SearchVO search);
	
	// 총 게시물 수 주회
	int u_ContTotalCount(SearchVO search);

	int u_editCont(ContVO vo);

	
	int u_deleteCont(int content_no);

	int u_insertReply(ContVO vo);

	List<ContVO> u_selectReplies(int content_no, int content_step);
	
	List<ContVO> u_mypageListCont(SearchVO search);

	int u_mypageContTotalCount(SearchVO search);

	ContVO u_editReply(ContVO vo);
	
	List<UserVO> u_selectPhoneEmail(UserVO vo);

	List<ContVO> u_HitListCont(SearchVO search);

}
