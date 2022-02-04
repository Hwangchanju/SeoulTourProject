package com.spring.project.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.project.commons.SearchVO;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;


public interface IUserMapper {

	
	// 회원 가입
	int u_join(UserVO vo);

	// 아이디 중복 체크 기능
	int u_checkIdDuplicate(String user_id);

	// 회원 정보 조회
	UserVO u_selectOne(String user_id);

	
	List<UserVO> u_selectPhoneEmail(UserVO vo);

	/*
	// 회원정보 전체 조회 (검증)
	List<UserVO> u_findAll();
	*/
	
	// 회원 아이디 찾기
	UserVO u_findId(@Param("u") UserVO vo, @Param("find_by") String find_by);
	
	
	// 회원 비번 난수 지정
	int u_updatePw(UserVO r);
	
	// 마이페이지 수정
	int u_updateMyPage(UserVO vo);

	// 회원 탈퇴
	int u_delete(UserVO vo);

	//---------게시판 저장-----------------------------//
	
	int u_insertCont(ContVO vo);

	ContVO u_selectCont(int content_no);

	List<ContVO> u_ListCont(SearchVO search);

	int u_ContTotalCount(SearchVO search);

	int u_editCont(ContVO vo);

	int u_updateHit(int content_no);
	
	int u_deleteCont(int content_no);

	int u_insertReply(ContVO vo);

	List<ContVO> u_selectReplies(ContVO vo);


	List<ContVO> u_mypageListCont(SearchVO search);

	int u_mypageContTotalCount(SearchVO search);

	int u_editReply(ContVO vo);

	ContVO u_selectReply(int content_no);

	List<ContVO> u_HitListCont(SearchVO search);

}
