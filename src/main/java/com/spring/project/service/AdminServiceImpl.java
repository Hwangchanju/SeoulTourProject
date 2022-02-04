package com.spring.project.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.commons.SearchVO;
import com.spring.project.dao.user.IAdminMapper;
import com.spring.project.model.AdminVO;
import com.spring.project.model.UserVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private IAdminMapper mapper;
	
	@Override
	public void a_join(AdminVO vo) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePW = encoder.encode(vo.getAdmin_pwd());
		
		vo.setAdmin_pwd(securePW);
		mapper.a_join(vo);
	}

	@Override
	public int a_checkIdDuplicate(String admin_id) {
		return mapper.a_checkIdDuplicate(admin_id);
	}

	@Override
	public AdminVO a_selectOne(String admin_id) {
		return mapper.a_selectOne(admin_id);
	}


	/*
	@Override
	public List<UserVO> u_findAll() {
		return mapper.u_findAll();
	}
	*/
	
	
	
	//-----------------
	

	
	@Override
	public AdminVO a_findId(AdminVO vo, String find_by) {
		return mapper.a_findId(vo, find_by);
	}
	
	

	@Transactional
	@Override
	public AdminVO a_findPw(AdminVO vo , String find_by) {	
		System.out.println(vo.toString());
		
		int leftLimit = 48; //0
		int rightLimit = 122; // z
		int targetStringLength=10;

		Random random = new Random();
		
		String generatedString = random.ints(leftLimit, rightLimit+1) // 시작과 끝범위 지정
				.filter(i-> (i<=57 || i>=65)&&(i<=90 || i>=97)) 
				.limit(targetStringLength) // 최종 길이 설정
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
				
				// ClassName::new의 형식으로 생성자를 나타낼 수 있음
				// StringBuilder : A mutable sequence of characters
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePW = encoder.encode(generatedString);

		System.out.println("id : " + vo.getAdmin_id());
		AdminVO r;

			r = mapper.a_selectOne(vo.getAdmin_id());
			System.out.println(r.toString());


			AdminVO newVo = new AdminVO();
		if(find_by.equals("byEmail")) {
			if(r.getAdmin_mail_id().equals(vo.getAdmin_mail_id()) && r.getAdmin_mail_domain().equals(vo.getAdmin_mail_domain()) && r.getAdmin_id().equals(vo.getAdmin_id()) && r.getAdmin_name().equals(vo.getAdmin_name())) {
				r.setAdmin_pwd(securePW);
				mapper.a_updatePw(r);
				
				
				newVo.setAdmin_pwd(generatedString);
				newVo.setAdmin_id(r.getAdmin_id());
				
				
				return newVo;
			} else {
				return null;
			}
		}else {
			if(r.getAdmin_phone().equals(vo.getAdmin_phone()) && r.getAdmin_id().equals(vo.getAdmin_id()) && r.getAdmin_name().equals(vo.getAdmin_name())) {
				r.setAdmin_pwd(securePW);
				mapper.a_updatePw(r);
				
				
				newVo.setAdmin_pwd(generatedString);
				newVo.setAdmin_id(r.getAdmin_id());
				
				
				return newVo;
			}else {
				return null;
			}
		}
		
	
	}

	
	@Transactional
	@Override
	public int a_updateMyPage(AdminVO vo) {
		
		// 비밀번호가 수정된 경우
		if(!vo.getAdmin_pwd().equals("")) {
	
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePW = encoder.encode(vo.getAdmin_pwd());
			vo.setAdmin_pwd(securePW);
			
			int pwSave = mapper.a_updatePw(vo);
			if(pwSave !=1) {
				return 0;
			}
			
			return mapper.a_updateMyPage(vo);
		}else {
			// 비밀번호가 수정되지 않은 경우
			AdminVO pwd = mapper.a_selectOne(vo.getAdmin_id());
			vo.setAdmin_pwd(pwd.getAdmin_pwd());
			return mapper.a_updateMyPage(vo);
		}
		
	}
	
	
	@Override
	public int a_userDelete(String user_id) {
		return mapper.a_userDelete(user_id);
	}

	@Override
	public int a_delete(AdminVO vo) {
		return mapper.a_delete(vo);
	}
	
	
	@Override
	public List<UserVO> a_userAllList(SearchVO search) {
		return mapper.a_userAllList(search);
	}
	
	
	@Override
	public int a_userTotalCount(SearchVO search) {
		
		return mapper.a_userTotalCount(search);
	}
	

	
	@Override
	public UserVO a_userSelect(String user_id) {
		return mapper.a_userSelect(user_id);
	}

	
	@Override
	public int a_userContDelete(int content_no) {
		return mapper.a_userContDelete(content_no);
	}
}