package com.spring.project.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.project.model.AdminVO;
import com.spring.project.service.AdminService;

public class BbsInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private AdminService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String id= request.getAttribute("session_id").toString();
		if( id !=null && id.contains("admin_")) {
			AdminVO vo = service.a_selectOne(id);
			if(vo.getEnabled()==0) {
				response.sendRedirect(request.getRequestURI());
				return true;
			}
		}
		return false;
	}

}
