package com.spring.project.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.project.commons.SearchVO;
import com.spring.project.model.AdminVO;
import com.spring.project.model.UserVO;



public interface IAdminMapper {

	// 회원 가입
		void a_join(AdminVO vo);

		// 아이디 중복 체크 기능
		int a_checkIdDuplicate(String admin_id);

		// 회원 정보 조회
		AdminVO a_selectOne(String admin_id);


		/*
		// 회원정보 전체 조회 (검증)
		List<UserVO> u_findAll();
		*/
		
		// 회원 아이디 찾기
		AdminVO a_findId(@Param("a") AdminVO vo, @Param("find_by") String find_by);
		
		
		// 회원 비번 난수 지정
		int a_updatePw(AdminVO r);
		
		// 마이페이지 수정
		int a_updateMyPage(AdminVO vo);

		// 회원 탈퇴
		int a_delete(AdminVO vo);

		List<UserVO> a_userAllList(SearchVO search);

		int a_userTotalCount(SearchVO search);

		UserVO a_userSelect(String user_id);

		int a_userDelete(String user_id);

		int a_userContDelete(int content_no);
}
