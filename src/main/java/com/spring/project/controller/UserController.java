package com.spring.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.model.UserVO;
import com.spring.project.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;

	// 회원가입 요청 처리
	@PostMapping("/join")
	public String join(@RequestBody UserVO vo) {
		System.out.println("/user/ : POST 요청 방식!  param" + vo);
		vo.setUser_state(1);
		int result = service.u_join(vo);
		if(result ==1) {
		return "Join_Success";
		}else {
			return "fail";
		}
	}

	// 아이디 중복 확인 요청 처리
	@PostMapping("/checkId")
	public String checkId(@RequestBody String user_id) {
		int check = service.u_checkIdDuplicate(user_id);
		if (check == 1) {
			return "Id_NO";
		} else {
			return "Id_OK";
		}

	}
	
	

	// 로그인 요청 처리
	@PostMapping("/login")
	public String login(@RequestBody UserVO input, HttpServletRequest request) {
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO data = service.u_selectOne(input.getUser_id());
		//System.out.println(data.toString());

		HttpSession session = request.getSession();

		if (data != null && data.getUser_state()==1) {
			if (encoder.matches(input.getUser_pwd(), data.getUser_pwd()) ) {
				session.setAttribute("session_id", data.getUser_id());
				result = "Login_Success";
			} else {
				result = "Pw_Fail";
			}
		} else {
			result = "Id_Fail";
		}
		return result;
	}

	// 로그아웃 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		Object id = session.getAttribute("session_id");

		if (id != null) {
			session.invalidate();
		}
		
		return new ModelAndView("redirect:/main");
	}
	
	
	
}
