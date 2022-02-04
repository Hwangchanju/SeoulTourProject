package com.spring.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.project.commons.SearchVO;
import com.spring.project.model.Bbs2VO;
import com.spring.project.model.ContVO;
import com.spring.project.service.Bbs2Service;
import com.spring.project.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Bbs2Service bbs2Service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value="/main")
	public String main(Model model) {
		/*
		 * SearchVO vo = new SearchVO(); vo.setPage(1); List<ContVO> list =
		 * userService.u_ListCont(vo); model.addAttribute("community_list", list);
		 * return "main";
		 */
		
		  SearchVO vo = new SearchVO(); vo.setPage(1); 
			 String concert_category = "%"+"전시"+"%"; 
			 List<Bbs2VO> clist = this.bbs2Service.getConcertList(concert_category); 
		     List<ContVO> ulist = this.userService.u_ListCont(vo);
		     model.addAttribute("ulist",ulist);
			 model.addAttribute("clist",clist);
		 
		return "main";

	}
	
	
	@RequestMapping("/district")
	public String district() {
		return "travel/district_1";
	}
	
	@RequestMapping("/concert")
	public String concert() {
		return "travel/concert_1";
	}
	
	@RequestMapping("/season")
	public String season() {
		return "travel/season_1";
	}
	
	@RequestMapping("/success")
	public String success() {
		return "travel/success";
	}
	
	@RequestMapping("/ticketing")
	public String ticketing() {
		return "travel/ticketing_1";
	}
	
	
}
