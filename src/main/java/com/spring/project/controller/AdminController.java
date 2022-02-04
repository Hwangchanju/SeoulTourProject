package com.spring.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.model.AdminVO;
import com.spring.project.service.AdminService;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 회원가입 요청 처리
		@PostMapping("/join")
		public String join(@RequestBody AdminVO vo) {
			System.out.println("/admin/ : POST 요청 방식!  param" + vo);
			vo.setAdmin_state(1);
			service.a_join(vo);
			return "Join_Success";
		}

		// 아이디 중복 확인 요청 처리
		@PostMapping("/checkId")
		public String checkId(@RequestBody String admin_id) {
			int check = service.a_checkIdDuplicate(admin_id);
			if (check == 1) {
				return "Id_NO";
			} else {
				return "Id_OK";
			}

		}

		// 로그인 요청 처리
		@PostMapping("/login")
		public String login(@RequestBody AdminVO input, HttpServletRequest request) {
			String result = null;
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			AdminVO data = service.a_selectOne(input.getAdmin_id());
			System.out.println(data.toString());

			HttpSession session = request.getSession();

			if (data != null && data.getAdmin_state()==1) {
				if (encoder.matches(input.getAdmin_pwd(), data.getAdmin_pwd()) ) {
					session.setAttribute("session_id", data.getAdmin_id());
					result = "Admin_Login_Success";
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
			
			return new ModelAndView("redirect:/admin/admin_login_form");
		}
		
		
	

}
