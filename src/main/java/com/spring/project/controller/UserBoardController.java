package com.spring.project.controller;

import java.io.File;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.spring.project.commons.PageCreator;
import com.spring.project.commons.PageVO;
import com.spring.project.commons.SearchVO;
import com.spring.project.model.AdminVO;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;
import com.spring.project.service.UserService;

@Controller
@RequestMapping("/user/community")
public class UserBoardController {
	
	@Autowired
	private UserService service;
	
	/*
	 * @GetMapping("/list") public String listGet(HttpSession session) { return
	 * "users/community/community_list"; }
	 */
	
	@GetMapping("/write")
	public String writeGet(Model model, HttpSession session, HttpServletResponse response, RedirectAttributes ra) throws Exception {

		String id = (String) session.getAttribute("session_id");
		
		String[] l = {"도봉구","노원구","강북구","은평구","성북구","중랑구","종로구","동대문구","서대문구","중구","성동구","광진구","마포구","용산구",
		"강동구","송파구","강남구","서초구","동작구","관악구","금천구","영등포구","구로구","양천구","강서구"};	
		Arrays.sort(l);
		
		UserVO vo = service.u_selectOne(id);
		model.addAttribute("l",l);
		model.addAttribute("p", vo);
		return "users/community/community_write";

	}
	
	
	/*
	 * //썸네일 업로드 이전
	 * 
	 * @PostMapping(value="/write", produces="application/json;charset=utf-8")
	 * 
	 * @ResponseBody public int writePost(@RequestBody ContVO input){
	 * 
	 * ContVO vo = new ContVO(); vo.setContent_id(input.getContent_id());
	 * vo.setContent_name(input.getContent_name());
	 * vo.setContent_title(input.getContent_title());
	 * vo.setContent_local(input.getContent_local());
	 * vo.setContent_cont(input.getContent_cont());
	 * 
	 * 
	 * System.out.println(vo.toString());
	 * 
	 * int result = service.u_insertCont(vo); return result; }
	 */
	
	//썸네일 업로드 포함
	@PostMapping(value="/write", produces="application/json;charset=utf-8")
	@ResponseBody
	public int writePost(ContVO vo, HttpServletRequest request) throws Exception{

		String saveFolder = request.getRealPath("/resources");
		String homedir = saveFolder+"/thumbnail";
		File path01 = new File(homedir);
		if(!(path01.exists())) {
			path01.mkdir();
		}
		
		int fileSize = 5*1024*1024;
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, homedir, fileSize, "UTF-8");
		
		String content_id = multi.getParameter("content_id");
		String content_name = multi.getParameter("content_name");
		String content_title = multi.getParameter("content_title");
		String content_local = multi.getParameter("content_local");
		String content_cont = multi.getParameter("content_cont");
		
		File upFile = multi.getFile("content_file");
		String url = "";
		
		if(upFile != null) {
			String fileName = upFile.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			
			
			
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			int index = fileName.lastIndexOf(".");
			String fileExtendsion = fileName.substring(index+1);
			String refileName = "Thumbnail"+year+month+date+random+"."+fileExtendsion;
			//String fileDBName = refileName;
			
			upFile.renameTo(new File(homedir+"/"+refileName));
			
			vo.setContent_file("/resources/thumbnail/"+refileName);
		}else {
			String fileDBName = "";
			vo.setContent_file(fileDBName);
		}

		vo.setContent_id(content_id);
		vo.setContent_name(content_name);
		vo.setContent_title(content_title);
		vo.setContent_local(content_local);
		vo.setContent_cont(content_cont);
		
		int result = service.u_insertCont(vo);
		return result;
	}
	
	
	
	@GetMapping("/content/{content_no}")
	public String contentGet(@PathVariable("content_no") int content_no, Model model, @ModelAttribute("paging") SearchVO vo,HttpSession session,RedirectAttributes ra) {
		ContVO c = service.u_selectCont(content_no);
		String[] l = {"도봉구","노원구","강북구","은평구","성북구","중랑구","종로구","동대문구","서대문구","중구","성동구","광진구","마포구","용산구",
		"강동구","송파구","강남구","서초구","동작구","관악구","금천구","영등포구","구로구","양천구","강서구"		
		};
		Arrays.sort(l);
		
		String user_id="";
		try {
			user_id = session.getAttribute("session_id").toString();
		
		}catch (NullPointerException e) {
			e.printStackTrace();
			ra.addFlashAttribute("msg", "auth_fail");
			return "redirect:/main";
			
		}
		
		model.addAttribute("l", l);
		model.addAttribute("c", c);

		List<ContVO> reply = service.u_selectReplies(content_no,1);
		
		if(reply.size()==0) {
			reply = null;
		}
		
		List<ContVO> reReply = service.u_selectReplies(content_no, 2);
		if(reReply.size()==0) {
			reReply = null;
		}
		
		
		UserVO user = service.u_selectOne(user_id);
		String e ="";
		
		if(user!= null) {
			e="1";
		}else {
			e="0";
		}
		
		model.addAttribute("u", e);
		model.addAttribute("replies", reply);
		model.addAttribute("reReplies", reReply);
		//System.out.println(c.getContent_cont());
		return "users/community/community_content";
	}
	
	
	// 페이징 처리 이후 게시글 목록 불러오기 요청
	@GetMapping("/list")
	public String ListCont(@ModelAttribute SearchVO search, Model model, RedirectAttributes ra, HttpSession session) {
		if(session.getAttribute("session_id")!=null) {
		System.out.println(search.toString());
		List<ContVO> list = service.u_ListCont(search);

		/*
		 * File f; for(ContVO v : list) { f = new File(v.getContent_file());
		 * v.setThumbnail(f); list.add(v); }
		 */
		
		List<ContVO> mlist =service.u_HitListCont(search);
		
		if(list.size()==0) {
			list = null;
		}else if(mlist.size()==0) {
			mlist = null;
		}
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setArticleTotalCount(service.u_ContTotalCount(search));
		//System.out.println(pc.getBeginPage());
		//System.out.println(pc.getEndPage());
		
		model.addAttribute("mostHit", mlist);
		model.addAttribute("articles", list);
		model.addAttribute("pc", pc);
		ra.addFlashAttribute("msg", "auth_success");
		
		return "users/community/community_list";
		
		}else {
			ra.addFlashAttribute("msg", "auth_fail");
			return "redirect:/main";
		}
	}

	
	@GetMapping("/edit")
	public String EditContGet(@RequestParam("content_no") int content_no, Model model, @ModelAttribute("paging") PageVO paging) {
		ContVO vo = service.u_selectCont(content_no);
		model.addAttribute("c", vo);
		return "users/community/community_edit";
		
	}
	
	/* 썸네일 이전 수정
	 * @PostMapping(value="/edit", produces="application/json;charset=utf-8")
	 * 
	 * @ResponseBody public int EditCont(@RequestBody ContVO input) { int result =
	 * service.u_editCont(input); System.out.println("result" + result); return
	 * result; }
	 */
	
	
	@PostMapping(value="/edit", produces="application/json;charset=utf-8")
	@ResponseBody
	public int EditCont(ContVO vo, HttpServletRequest request) throws Exception{
		String saveFolder = request.getRealPath("/resources");
		String homedir = saveFolder+"/thumbnail";
		File path01 = new File(homedir);
		if(!(path01.exists())) {
			path01.mkdir();
		}
		
		int fileSize = 5*1024*1024;
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, homedir, fileSize, "UTF-8");
		
		String content_no = multi.getParameter("content_no");
		int no = Integer.parseInt(content_no);
		String content_id = multi.getParameter("content_id");
		String content_name = multi.getParameter("content_name");
		String content_title = multi.getParameter("content_title");
		String content_local = multi.getParameter("content_local");
		String content_cont = multi.getParameter("content_cont");
		
		File upFile = multi.getFile("content_file");
		String url = "";
		
		if(upFile != null) {
			String fileName = upFile.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			
			
			
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			int index = fileName.lastIndexOf(".");
			String fileExtendsion = fileName.substring(index+1);
			String refileName = "Thumbnail"+year+month+date+random+"."+fileExtendsion;
			//String fileDBName = refileName;
			
			upFile.renameTo(new File(homedir+"/"+refileName));
			
			vo.setContent_file("/resources/thumbnail/"+refileName);
		}else {
			String fileDBName = "";
			vo.setContent_file(fileDBName);
		}

		vo.setContent_no(no);
		vo.setContent_id(content_id);
		vo.setContent_name(content_name);
		vo.setContent_title(content_title);
		vo.setContent_local(content_local);
		vo.setContent_cont(content_cont);
		
		
		int result = service.u_editCont(vo);
		
		return result;
	}
	
	@PostMapping("/delete")
	public String deleteCont(@RequestParam("content_no") int content_no, RedirectAttributes ra) {
		System.out.println(content_no);
		
		ContVO cont = service.u_selectCont(content_no);
		String file = cont.getContent_file();
		if(file!=null) {
			File f = new File(file);
			f.delete();
		}
		
		int result = service.u_deleteCont(content_no);
		
		if(result ==1) {
			ra.addFlashAttribute("msg", "delete_sucess");
		}else {
			ra.addFlashAttribute("msg", "delete_fail");
		}
		
		if(cont.getContent_step()==0) {
		return "redirect:/user/community/list";
		}else {
			return "redirect:/user/community/content/"+cont.getContent_ref();
		}
	}

	
	// 답변 삽입
	@PostMapping("/reply")
	public String u_insertReply(@RequestParam("reply_step") String step, ContVO vo, @ModelAttribute("paging") PageVO paging, RedirectAttributes ra) {
		int content_step = Integer.parseInt(step);
		vo.setContent_step(content_step);
		vo.setContent_level(0);
		
		int result = service.u_insertReply(vo);
		if(result ==1) {
			ra.addFlashAttribute("msg", "reply_success");
		}
		return "redirect:/user/community/content/"+vo.getContent_ref();
	}
	
	@PostMapping(value="/editReply", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> u_editReply(@RequestBody ContVO vo) {
		System.out.println("vo : "+vo.toString());
		ContVO result = service.u_editReply(vo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("content_no", result.getContent_no());
		map.put("content_id",result.getContent_id());
		map.put("content_cont", result.getContent_cont());
		map.put("content_regdate", result.getContent_regdate());
		map.put("content_ref", result.getContent_ref());
		System.out.println("map : " +map.toString());
		return map;
		
	}
	
	// 대댓글 삽입
	@PostMapping("/reReply")
	public String u_insertReReply(ContVO vo,@ModelAttribute("paging") PageVO paging, RedirectAttributes ra) {
		vo.setContent_step(2);
		int result = service.u_insertReply(vo);
		if(result ==1) {
			ra.addFlashAttribute("msg", "reply_success");
		}
		return "redirect:/user/community/content/"+vo.getContent_ref();
	}
	
	

	
}
