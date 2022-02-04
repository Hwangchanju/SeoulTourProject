package com.spring.project.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.spring.project.model.BbsVO;
import com.spring.project.service.BbsService;

@Controller //@Controller 애노테이션으로 스프링에 컨트롤러 라는 것을 인식하게 한다.
public class BbsController {

	@Autowired
	private BbsService bbsService;
	
	//자료실 글쓰기 폼
	@GetMapping("/bbs_write") //get으로 접근하는 매핑주소를 처리,bbs_write 매핑주소 등록
	public String bbs_write(HttpServletRequest request,Model wm) {
		int bbs=1;
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);//페이징에서 책갈피 기능을 구현		
		return "bbs/bbs_write";//뷰페이지 경로=> /WEB-INF/views/bbs/bbs_write.jsp
	}//bbs_write()
	
	@PostMapping("/bbs_write_ok") //post로 접근하는 매핑주소를 처리
	public String bbs_write_ok(@ModelAttribute BbsVO b, HttpServletRequest request) throws Exception{
		
		String saveFolder=request.getRealPath("upload2");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=10*1024*1024;//이진파일 업로드 최대크기=>5M
		MultipartRequest multi=null;//이진파일 업로드 참조변수->cos.jar로 부터 읽어들임.
		
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		String bbs_name=multi.getParameter("bbs_name");
		String bbs_title=multi.getParameter("bbs_title");
		String bbs_pwd=multi.getParameter("bbs_pwd");
		String bbs_cont=multi.getParameter("bbs_cont");
		
		File upFile=multi.getFile("bbs_file");//첨부한 이진파일을 가져온다.
		
		if(upFile != null) {//첨부한 이진파일이 있는 경우
			String fileName=upFile.getName();//첨부한 이진파일명
			Calendar c=Calendar.getInstance();//Calendar는 추상클래스로 new로 객체 생성을 못함. 년월일 시분초 값을 구할 수 있다.
			int year=c.get(Calendar.YEAR);//년도값
			int month=c.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문이다.
			int date=c.get(Calendar.DATE);//일값
			
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;//오늘 날짜 폴더 경로를 저장
			File path01=new File(homedir);
			if(!(path01.exists())) {//해당 경로가 없어면
				path01.mkdir();//폴더 경로를 생성
			}
		    Random r=new Random();
		    int random=r.nextInt(100000000);//0~1억 미만 사이의 정수형 숫자 난수를 발생
		    
		    /*첨부한 파일 확장자를 구함*/
		    int index=fileName.lastIndexOf(".");//첨부한 파일에서 .를 맨 오른쪽 부터 찾아서 가장먼저 나오는 .의 위치번호를 맨 왼쪽첫문자를 0부터 시작해서 카운터한 위치
		    //번호를 반환.
		    String fileExtendsion=fileName.substring(index+1);//.이후 부터 마지막 문자까지 구함. 즉 첨부한 파일의 확장자를 구함.
		    String refileName="bbs"+year+month+date+random+"."+fileExtendsion;//새로운 이진파일명 저장
		    String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
		    
		    upFile.renameTo(new File(homedir+"/"+refileName));//변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
		    b.setBbs_file(fileDBName);//오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			b.setBbs_file(fileDBName);
		}
		b.setBbs_name(bbs_name); b.setBbs_title(bbs_title); b.setBbs_pwd(bbs_pwd); b.setBbs_cont(bbs_cont);
		
		this.bbsService.insertBbs(b);//자료실 저장
		
		return "redirect:/bbs_list";//목록보기 매핑으로 이동		
	}//bbs_write_ok()
	
	//지료실 목록(페이징+검색)
	@RequestMapping("/bbs_list")
	public String bbs_list(Model listM,HttpServletRequest request, @ModelAttribute BbsVO b, HttpSession session) throws Exception{
		
		String session_id = "";
		String view = "";
		String sId = "";
		try {
			session_id = session.getAttribute("session_id").toString();
			sId = session_id.substring(0, 5);
			if (sId.equals("admin")) {
				view = "admins/admin/admin_board";
			} else {
				view = "bbs/bbs_list";
			}

		} catch (NullPointerException e) {
			view = "bbs/bbs_list";
		}

		int page=1;
		int bbs=2;
		int limit=8; //한페이지에 보여지는 목록 개수
		if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있는 경우
			page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 저장
		}
		
		//검색 필드와 검색어
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%"); //%는 검색에서 하나이상의 임의의 모르는 문자와 매핑대응한다.
		
		int totalCount=this.bbsService.getTotalCount(b); //검색전은 총레코드 갯수, 검색이후에는 검색한 레코드 개수
		
		b.setStartrow((page-1)*8+1); //시작행번호
		b.setEndrow(b.getStartrow()+limit-1); //끝행번호
		
		List<BbsVO> blist=this.bbsService.getBbsList(b);
		
		//총페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지
		int startpage=(((int)((double)page/8+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지
		int endpage=maxpage;
		if(endpage>startpage+8-1) endpage=startpage+8-1;
		
		listM.addAttribute("blist", blist);//blist키이름에 목록저장
		listM.addAttribute("page", page); //page키이름에 쪽번호 저장
		listM.addAttribute("bbs", bbs);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("totalCount", totalCount);//totalCount 키이름에 총 레코드 개수 저장
		listM.addAttribute("find_field", find_field); //find_field 속성 키이름에 검색 필드를 저장
		listM.addAttribute("find_name", find_name); //fin_name 속성 키이름에 검색 어를 저장
		
		
		return view;
		
		//뷰페이지 경로
	}//bbs_list()

	//자료실 내용보기+답변폼+수정폼+삭제폼 한개의 매핑주소로 4개의 뷰화면이 실행됨.
	@RequestMapping("/bbs_cont")
	public ModelAndView bbs_cont(@RequestParam("bbs_no") int bbs_no, int page, String state, BbsVO b) {
		//@RequestParam("bbs_no")는 request.getParameter("bbs_no")와 같다.
		
		if(state.equals("cont")) {//내용보기 일때만 조회수 증가(aop를 통한 트랜잭션 적용)
			b=this.bbsService.getBbsCont(bbs_no);
		}else {//답변폼, 수정폼 일때는 조회수 증가 안함.
			b=this.bbsService.getBbs_cont2(bbs_no);
		}
		
		String bbs_cont=b.getBbs_cont().replace("\n", "<br/"); //textarea에서 엔터킨 치면 줄바꿈
		
		ModelAndView cm = new ModelAndView();
		cm.addObject("b", b);
		cm.addObject("bbs_cont", bbs_cont);
		cm.addObject("page", page);
		
		if(state.equals("cont")) {//내용보기
			cm.setViewName("bbs/bbs_cont");
		}else if(state.equals("reply")) {//답변폼
			cm.setViewName("bbs/bbs_reply");
		}else if(state.equals("edit")) { //수정폼
			cm.setViewName("bbs/bbs_edit");
		}else if(state.equals("del")) { //삭제폼
			cm.setViewName("bbs/bbs_del");
		}
		
		return cm;
	}//bbs_cont()

	//관리자 답변 저장
	@PostMapping("/bbs_reply_ok")
	public ModelAndView bbs_reply_ok(BbsVO rb, int page) {
		this.bbsService.replyBbs(rb); //답변 저장
		
		ModelAndView rm=new ModelAndView();
		rm.setViewName("redirect:/bbs_list?page="+page);
		return rm;
	}//bbs_reply_ok()
	
	//자료실 수정
	@RequestMapping("/bbs_edit_ok")
	public ModelAndView bbs_edit_ok(HttpServletRequest request, HttpServletResponse response,BbsVO b)
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 파일형식과 언어코딩 타입 지정
		PrintWriter out=response.getWriter();//출력스트림 객체 생성
		String saveFolder=request.getRealPath("upload2");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
		int fileSize=10*1024*1024;//이진파일 최대 크기
		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");//이진파일을 가져올 multi생성
		
		int bbs_no=Integer.parseInt(multi.getParameter("bbs_no"));//히든으로 전달된 번호값을 받아서 정수 숫자로 변경해서 저장
		int bbs=1;
		int page=1;
		if(multi.getParameter("page") != null) {
			page=Integer.parseInt(multi.getParameter("page"));
		}
		
		String bbs_name=multi.getParameter("bbs_name");//수정할 이름,제목,내용을 받아서 각각 저장
		String bbs_title=multi.getParameter("bbs_title");
		String bbs_pwd=multi.getParameter("bbs_pwd");
		String bbs_cont=multi.getParameter("bbs_cont");
		
		BbsVO db_pwd=this.bbsService.getBbs_cont2(bbs_no);//오라클로 부터 레코드를 가져옴.
		
		if(!db_pwd.getBbs_pwd().equals(bbs_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			File upFile=multi.getFile("bbs_file");//수정 첨부한 이진파일을 가져옴.
			
			if(upFile != null) {//수정첨부한 이진파일이 있는 겨우
				String fileName=upFile.getName();//수정 첨부한 파일명
				File delFile=new File(saveFolder+db_pwd.getBbs_file());//기존 첨부된 삭제할 파일 객체를 생성
				if(delFile.exists()) {//삭제할 파일이 있다면
					delFile.delete();//기존 이진파일을 삭제
				}
				Calendar c=Calendar.getInstance();//칼렌더는 추상클래스로 new키워드로 객체 생성을 못함. 하지만 년월일 시분초 값을 반환할 수 있다.
				int year=c.get(Calendar.YEAR);//년도
				int month=c.get(Calendar.MONTH)+1;//월값,+1을 한 이유는 1월이 0부터 시작하기 때문이다.
				int date=c.get(Calendar.DATE);//일값
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				File path01=new File(homedir);
				if(!(path01.exists())) {
					path01.mkdir();
				}
				Random r=new Random();
				int random=r.nextInt(100000000);
				
				//확장자를 구함
				int index=fileName.lastIndexOf(".");//.의 위치번호를 구함
				String fileExtendsion=fileName.substring(index+1);//첨부파일의 확장자를 구함.
				String refileName="bbs"+year+month+date+random+"."+fileExtendsion;
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
				upFile.renameTo(new File(homedir+"/"+refileName));
				b.setBbs_file(fileDBName);
			}else {//수정 파일을 첨부하지 않은 경우
				String fileDBName="";
				if(db_pwd.getBbs_file() != null) {//기존 첨부된 파일이 있는경우
					b.setBbs_file(db_pwd.getBbs_file());
				}else {
					b.setBbs_file(fileDBName);
				}
			}//if else
			
			b.setBbs_no(bbs_no); b.setBbs_name(bbs_name); b.setBbs_title(bbs_title); b.setBbs_cont(bbs_cont);
			this.bbsService.editBbs(b);
			/* 문제) 서비스,모델 dao,mybatis 매퍼태그까지 스프링의 흐름도 따라 번호를 기준으로 글쓴이,제목,내용,첨부파일을 수정되게 한다. 개발자 테스트까지 완료한다.
			 */
			
			ModelAndView em=new ModelAndView("redirect:/bbs_cont");
			em.addObject("bbs_no",bbs_no);
			em.addObject("page",page);
			em.addObject("bbs", bbs);
			em.addObject("state","cont");
			return em;// 주소창에 노출되는 get방식으로 3개의 인자값이 전달됨. bbs_cont?bbs_no=번호&page=쪽번호&state=cont
		}
		return null;
	}//bbs_edit_ok()

	//자료실 삭제
	@RequestMapping("/bbs_del_ok")
	public String bbs_del_ok(int bbs_no, int page, String del_pwd, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String up = request.getRealPath("upload2");
		
		BbsVO db_pwd=this.bbsService.getBbs_cont2(bbs_no);
		
		if(!db_pwd.getBbs_pwd().equals(del_pwd)) {
			out.println("<script>");
			out.println("alert('비밀번호를 확인해주십시오!');");
			out.println("history.go(-1)");
			out.println("</script>");
		}else {
			this.bbsService.delBbs(bbs_no);//자료실 삭제
			
			if(db_pwd.getBbs_file() != null) { //첨부파일이 있는경우
				File file=new File(up+db_pwd.getBbs_file());
				file.delete(); //upload폴더안의 첨부파일 삭제
			}
			return "redirect:/bbs_list?page="+page;
		}
		
		return null;
	}

}
