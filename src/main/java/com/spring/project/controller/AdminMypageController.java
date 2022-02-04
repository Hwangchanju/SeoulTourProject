package com.spring.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.commons.PageCreator;
import com.spring.project.commons.SearchVO;
import com.spring.project.model.AdminVO;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;
import com.spring.project.service.AdminService;
import com.spring.project.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminMypageController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private UserService userService;

	// 회원 로그인 폼
	@GetMapping("/admin_login_form")
	public String a_login() {
		return "admins/admin/admin_login";
	}

	// 회원 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "admins/admin/admin_login_find_id";
	}

	@PostMapping("/findId")
	public String findIdPost(AdminVO vo, Model model) {

		String find_by = "";

		if (vo.getAdmin_mail_id() != "") { // 이메일로 찾기
			find_by = "byEmail";
		} else if (vo.getAdmin_phone() != null) { // 폰번호로 찾기
			find_by = "byPhone";
		}
		// System.out.println(vo.toString()+"/"+find_by);
		AdminVO f = service.a_findId(vo, find_by);
		System.out.println(f);

		model.addAttribute("f", f);

		return "admins/admin/admin_login_find_complete";
	}

	// 회원 비밀번호 찾기 (랜덤 번호 출력)
	@GetMapping("/findPw")
	public String findPw() {
		return "admins/admin/admin_login_find_pwd";
	}

	@PostMapping("/findPw")
	public ModelAndView findPwPost(AdminVO vo) {

		System.out.println(vo.toString());
		ModelAndView mv = new ModelAndView();

		String find_by = "";

		// radio박스 특성상 배열로 들어옴
		String[] id_arr = vo.getAdmin_id().split(",");
		String[] name_arr = vo.getAdmin_name().split(",");

		AdminVO f;

		if (vo.getAdmin_mail_id() != "") { // 이메일로 찾기
			find_by = "byEmail";
			vo.setAdmin_id(id_arr[1]);
			vo.setAdmin_name(name_arr[1]);
		} else if (vo.getAdmin_phone() != null) { // 폰번호로 찾기
			find_by = "byPhone";
			vo.setAdmin_id(id_arr[0]);
			vo.setAdmin_name(name_arr[0]);
		} else if (id_arr == null || name_arr == null) {
			f = null;
		}

		try {
			f = service.a_findPw(vo, find_by);
			f.setAdmin_name(vo.getAdmin_name());

		} catch (NullPointerException e) {
			f = null;
		}
		mv.addObject("f", f);
		mv.setViewName("admins/admin/admin_login_find_complete");

		return mv;
	}

	// 마이페이지 보기
	@GetMapping("/mypage")
	public String mypageGet(HttpServletResponse response, HttpSession session, SearchVO search, Model model) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = (String) session.getAttribute("session_id"); // 세션 아이디값을 구함
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			
			if(search.getCondition().equals("title")) {
				search = new SearchVO();
				search.setCondition("user_id");
				search.setKeyword("");
				search.setCounterPerPage(15);
			}
			
			List<UserVO> list = service.a_userAllList(search);
			if(list.size()== 0) {
				list = null;
			}
			
			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setArticleTotalCount(service.a_userTotalCount(search));
			
			model.addAttribute("userList", list);
			model.addAttribute("search", search);
			model.addAttribute("pc", pc);
			
			System.out.println(search.getKeyword()+"/컨디션"+search.getCondition());
			return "admins/admin/admin_main";

		}
		return null;
	}
	
	
	
	//회원 정보 수정 전 조회
	@GetMapping("/user_update")
	public String user_update(@RequestParam("user_id") String user_id, Model model) {
		
		UserVO vo = service.a_userSelect(user_id);
		model.addAttribute("f", vo);
		return "admins/admin/admin_user_update";
	}
	
	@PostMapping("/user_delete")
	public String user_delete(@RequestParam("user_id") String user_id, RedirectAttributes ra) {
		int result = service.a_userDelete(user_id);
		if(result == 1) {
			ra.addFlashAttribute("msg", "delete_success");
		}
		return "redirect:/admin/mypage";
	}

	// 내 수정
	@GetMapping("/mypage/join_update")
	public String join_update(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String admin_id = session.getAttribute("session_id").toString();
		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			AdminVO f = service.a_selectOne(admin_id);
			model.addAttribute("f", f);
			return "admins/admin/join_update";
		}
		return null;

	}

	@PostMapping("/mypage/join_update")
	public String join_updatePost(AdminVO input, Model model, HttpServletResponse response) throws IOException {
		System.out.println(input.toString());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = service.a_updateMyPage(input);
		if (result == 1) {
			out.print("<script>");
			out.print("alert('회원정보가 수정되었습니다.');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

	// 회원 탈퇴
	@PostMapping("/admin_del")
	public String admin_del(AdminVO input, HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user_id = session.getAttribute("session_id").toString();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if (user_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			AdminVO data = service.a_selectOne(input.getAdmin_id());

			if (!encoder.matches(input.getAdmin_pwd(), data.getAdmin_pwd())) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				int result = service.a_delete(input);
				if (result != 1) {
					out.println("<script>");
					out.println("alert('회원 탈퇴에 실패했습니다. 다시 시도해주세요.');");
					out.println("history.back();");
					out.println("</script>");
				} else {
					session.invalidate();
					out.println("<script>");
					out.println("alert('회원 탈퇴에 성공했습니다.');");
					out.println("location='/project/';");
					out.println("</script>");

				}
			}

		}
		return null;

	}

	
	@GetMapping("/admin_board")
	public String admin_board_main() {
		return "admins/admin/admin_board";
	}
	

	// =--------------------축제란 크롤링--------------------------//
	@GetMapping("/exhibition/{category}/{page}")
	public String exhibition(@PathVariable String category, @PathVariable int page, Model model) {

		String url;
		if (category.equals("exhibition")) {
			url = "https://korean.visitseoul.net/exhibition?curPage=" + page;
		} else if (category.equals("events")) {
			url = "https://korean.visitseoul.net/events?curPage=" + page;
		} else {
			url = "https://korean.visitseoul.net/culture?curPage=" + page;
		}

		Document doc = null;

		List<String> list_url = new ArrayList<String>();
		List<String> list_img = new ArrayList<String>();
		List<String> list_title = new ArrayList<String>();
		List<String> list_date = new ArrayList<String>();
		

		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		Elements element = doc.select("ul.article-list");

		if (category.equals("culture")) {
			for (Element e : element.select("li a")) {
				list_url.add(e.getElementsByAttribute("href").attr("href"));
				list_img.add(e.select(".thumb > img").attr("src"));
				list_title.add(e.getElementsByClass("title").text());
				list_date.add(e.getElementsByClass("small-text text-dot-d").text());
				
			}
		} else {
			for (Element e : element.select("li a")) {
				list_url.add(e.getElementsByAttribute("href").attr("href"));
				int start = e.getElementsByAttribute("style").attr("style").lastIndexOf("(");
				int last = e.getElementsByAttribute("style").attr("style").lastIndexOf(")");
				list_img.add(e.getElementsByAttribute("style").attr("style").substring(start + 1, last));
				list_title.add(e.getElementsByClass("title").text());
				list_date.add(e.getElementsByClass("small-text text-dot-d").text());
			}
		}
		
		int paging_cnt =0;
		Elements paging  = doc.select(".paging-lst");
		
		for(Element p : paging.select("a")) {
			paging_cnt++;
		}
		
		model.addAttribute("list_url", list_url);
		model.addAttribute("list_img", list_img);
		model.addAttribute("list_title", list_title);
		model.addAttribute("list_date", list_date);
		model.addAttribute("paging_cnt", paging_cnt);
		return "admins/notice/"+category;
	}
	
	
	
	// 페이징 처리 이후 게시글 목록 불러오기 요청
	@GetMapping("/admin_community")
		public String admin_community(@ModelAttribute SearchVO search, Model model, RedirectAttributes ra, HttpSession session) {
			if(session.getAttribute("session_id")!=null) {
			System.out.println(search.toString());
			List<ContVO> list =userService.u_ListCont(search);
			
			/*
			 * File f; for(ContVO v : list) { f = new File(v.getContent_file());
			 * v.setThumbnail(f); list.add(v); }
			 */
			
			
			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setArticleTotalCount(userService.u_ContTotalCount(search));
			//System.out.println(pc.getBeginPage());
			//System.out.println(pc.getEndPage());
			
			model.addAttribute("articles", list);
			model.addAttribute("pc", pc);
			ra.addFlashAttribute("msg", "auth_success");
			
			return "admins/admin/admin_user_community";
			
			}else {
				ra.addFlashAttribute("msg", "auth_fail");
				return "redirect:/main";
			}
		}
	
	@PostMapping("/cont_delete")
	public String cont_delete(ContVO vo ,RedirectAttributes ra) {
		System.out.println(vo.toString());
		int result = service.a_userContDelete(vo.getContent_no());
		if(result ==1) {
			ra.addFlashAttribute("msg", "delete_success");
		}
		return "redirect:/admin/admin_community";
		
	}
}
