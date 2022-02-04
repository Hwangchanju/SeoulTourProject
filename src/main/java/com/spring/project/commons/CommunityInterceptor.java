package com.spring.project.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class CommunityInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("session_id")==null) {
			System.out.println("회원 인증 실패");

			response.sendRedirect("main");
			return false;
		}
		
		System.out.println("회원 인증 성공!");
		return true;
	}
	
	
	

}
