package com.spring.project.controller;

import java.io.File;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.spring.project.model.Bbs2VO;
import com.spring.project.service.Bbs2Service;

@Controller
public class Bbs2Controller {

   @Autowired
   private Bbs2Service bbs2Service;
   
   //자료실 글쓰기 폼
   @GetMapping("/bbs2_write") //get으로 접근하는 매핑주소를 처리
   public String bbs2_write(HttpServletRequest request, Model wm) {
      int page=1;
      if(request.getParameter("page") != null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      wm.addAttribute("page", page);
      return "bbs2/bbs2_write";
   }//bbs2_write()
   
   @PostMapping("/bbs2_write_ok")
   public String bbs2_write_ok(@ModelAttribute Bbs2VO b2, HttpServletRequest request) throws Exception{
      
      String saveFolder=request.getRealPath("upload2"); //이진파일 업로드 서버 경로
      int fileSize=10*1024*1024; //파일 업로드 최대크기
      MultipartRequest multi = null; //파일 업로드 참조변수 
      
      multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
      
      String bbs_name=multi.getParameter("bbs2_name");
      String bbs_title=multi.getParameter("bbs2_title");
      String bbs_pwd=multi.getParameter("bbs2_pwd");
      String bbs_cont=multi.getParameter("bbs2_cont");
      String bbs_category=multi.getParameter("bbs2_category");
      
      File upFile=multi.getFile("bbs2_file"); //첨부파일 정보를 가져온다.
      
      if(upFile != null) {//첨부한 파일이 있는경우
         String fileName=upFile.getName(); //첨부한 파일명
         Calendar c=Calendar.getInstance(); 
         int year=c.get(Calendar.YEAR);
         int month=c.get(Calendar.MONTH)+1;
         int date=c.get(Calendar.DATE);
         
         String homedir=saveFolder+"/"+year+"-"+month+"-"+date; //오늘날짜 폴더 경로 저장
         File path01=new File(homedir);
         if(!(path01.exists())) {//해당경로가 없으면
            path01.mkdir(); //폴더 생성
         }
         Random r = new Random();
         int random=r.nextInt(1000000000); //1억미만 사이의 정수형 숫자 난수를 발생
         
         /*첨부한 파일 확장자를 구함*/
         int index=fileName.lastIndexOf(".");
         String fileExtendsion=fileName.substring(index+1); //.이후부터 마지막 문자까지 구함. 즉 첨부 파일의 확장자를 구한다.
         String refileName = "bbs"+year+month+date+random+"."+fileExtendsion; //새로운 파일명 저장
         String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName; //데이터베이스에 저장될 레코드 값
         
         upFile.renameTo(new File(homedir+"/"+refileName)); //변경된 파일명으로 업로드
         b2.setBbs_file(fileDBName);
      }else { //파일을 첨부하지 않았을떄
         String fileDBName="";
         b2.setBbs_file(fileDBName);
      }
      b2.setBbs_name(bbs_name); b2.setBbs_title(bbs_title); b2.setBbs_pwd(bbs_pwd); b2.setBbs_cont(bbs_cont); b2.setBbs_category(bbs_category);
      
      this.bbs2Service.insertBbs2(b2);
      
      return "redirect:/bbs2_list";
   }//bbs2_write_ok();
   
   @RequestMapping("/bbs2_list")
	public String bbs_list2(Model listM, HttpServletRequest request, @ModelAttribute Bbs2VO b2, HttpSession session)
			throws Exception {

		String session_id = "";
		String view = "";
		String sId = "";
		try {
			session_id = session.getAttribute("session_id").toString();
			sId = session_id.substring(0, 5);
			if (sId.equals("admin")) {
				view = "admins/admin/admin_board2";
			} else {
				view = "bbs2/bbs2_list";
			}

		} catch (NullPointerException e) {
			view = "bbs2/bbs2_list";
		}
      int page=1;
      int limit=8; //한페이지에 보여지는 목록 개수
      if(request.getParameter("page") != null) {//get으로 전달된 쪽번호가 있는 경우
         page=Integer.parseInt(request.getParameter("page"));//쪽번호를 정수 숫자로 변경해서 저장
      }
      
      //검색 필드와 검색어
      String find_field=request.getParameter("find_field");
      String find_name=request.getParameter("find_name");
      b2.setFind_field(find_field);
      b2.setFind_name("%"+find_name+"%"); //%는 검색에서 하나이상의 임의의 모르는 문자와 매핑대응한다.
      
      int totalCount=this.bbs2Service.getTotalCount2(b2);//검색전은 총레코드 갯수, 검색이후에는 검색한 레코드 개수
      
      b2.setStartrow((page-1)*8+1); //시작행번호
      b2.setEndrow(b2.getStartrow()+limit-1); //끝행번호
      
      List<Bbs2VO> blist=this.bbs2Service.getBbsList(b2);
      
      //총페이지수
      int maxpage=(int)((double)totalCount/limit+0.95);
      //시작페이지
      int startpage=(((int)((double)page/8+0.9))-1)*8+1;
      //현재 페이지에 보여질 마지막 페이지
      int endpage=maxpage;
      if(endpage>startpage+8-1) endpage=startpage+8-1;
      
      listM.addAttribute("blist", blist);//blist키이름에 목록저장
      listM.addAttribute("page", page); //page키이름에 쪽번호 저장
      listM.addAttribute("startpage",startpage);
      listM.addAttribute("endpage", endpage);
      listM.addAttribute("maxpage", maxpage);
      listM.addAttribute("totalCount", totalCount);//totalCount 키이름에 총 레코드 개수 저장
      listM.addAttribute("find_field", find_field); //find_field 속성 키이름에 검색 필드를 저장
      listM.addAttribute("find_name", find_name); //fin_name 속성 키이름에 검색 어를 저장
      
      return view;
   }//bbs_list2()
   
   //자료실 내용보기
   @RequestMapping("/bbs2_cont")
   public ModelAndView bbs2_cont(@RequestParam("bbs2_no") int bbs2_no, int page,String state,Bbs2VO b2) {
      
      int bbs_no = bbs2_no;
      
      if(state.equals("cont")) {
         b2=this.bbs2Service.getBbs2Cont(bbs_no);
      }else {//답변폼,수정폼,삭제폼일때 조회수 증가 안함.
         b2=this.bbs2Service.getBbs2Cont2(bbs_no);
      }
      String bbs_cont=b2.getBbs_cont().replace("\n","<br/>");
      
      ModelAndView cm=new ModelAndView();
      cm.addObject("b2", b2);
      cm.addObject("bbs_cont", bbs_cont);
      cm.addObject("page", page);
      
      
      if(state.equals("cont")) {
         cm.setViewName("bbs2/bbs2_cont");
      }else if(state.equals("reply")) {
         cm.setViewName("bbs2/bbs2_reply");
      }else if(state.equals("edit")) {
         cm.setViewName("bbs2/bbs2_edit");
      }else if(state.equals("del")) {
         cm.setViewName("bbs2/bbs2_del");
      }
      return cm;
   }//bbs2_cont
   
   //자료실 수정 완료
   @RequestMapping("/bbs2_edit_ok")
   public ModelAndView bbs2_edit_ok(HttpServletRequest request, HttpServletResponse response, Bbs2VO b2) throws Exception{
      
      response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 파일형식과 언어코딩 타입 지정
      PrintWriter out=response.getWriter();//출력스트림 객체 생성
      String saveFolder=request.getRealPath("upload2");//이진파일 업로드 서버 경로=>톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
      int fileSize=10*1024*1024;//이진파일 최대 크기
      
      MultipartRequest multi=null;
      multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");//이진파일을 가져올 multi생성
      
      int bbs_no=Integer.parseInt(multi.getParameter("bbs2_no"));//히든으로 전달된 번호값을 받아서 정수 숫자로 변경해서 저장
      int page=1;
      if(multi.getParameter("page") != null) {
         page=Integer.parseInt(multi.getParameter("page"));
      }
      
      String bbs_name=multi.getParameter("bbs2_name");//수정할 이름,제목,내용을 받아서 각각 저장
      String bbs_title=multi.getParameter("bbs2_title");
      String bbs_pwd=multi.getParameter("bbs2_pwd");
      String bbs_cont=multi.getParameter("bbs2_cont");
      String bbs_category=multi.getParameter("bbs2_category");
      
      Bbs2VO db_pwd=this.bbs2Service.getBbs2Cont(bbs_no);
      
      if(!db_pwd.getBbs_pwd().equals(bbs_pwd)) {
         out.println("<script>");
         out.println("alert('비밀번호를 확인해주십시오');");
         out.println("history.back();");
         out.println("</script>");
      }else {
         File upFile=multi.getFile("bbs2_file");//수정 첨부한 이진파일을 가져옴.
         
         
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
            b2.setBbs_file(fileDBName);
         }else {//수정 파일을 첨부하지 않은 경우
            String fileDBName="";
            if(db_pwd.getBbs_file() != null) {//기존 첨부된 파일이 있는경우
               b2.setBbs_file(db_pwd.getBbs_file());
            }else {
               b2.setBbs_file(fileDBName);
            }
         }
         b2.setBbs_no(bbs_no); b2.setBbs_name(bbs_name); b2.setBbs_title(bbs_title); b2.setBbs_cont(bbs_cont); b2.setBbs_category(bbs_category);
         this.bbs2Service.editBbs2(b2);
         
         ModelAndView em = new ModelAndView("redirect:/bbs2_cont");
         
         em.addObject("bbs2_no", bbs_no);
         em.addObject("page", page);
         em.addObject("state", "cont");
         return em;
      }
      return null;
   }//bbs2_edit_ok()
   
   //자료실 삭제
   @RequestMapping("bbs2_del_ok")
   public String bbs2_del_ok(int bbs2_no, int page, String del_pwd,HttpServletResponse response, HttpServletRequest request) throws Exception {
      int bbs_no = bbs2_no;
      response.setContentType("text/html;charset=UTF8");
      PrintWriter out = response.getWriter();
      String up=request.getRealPath("upload2");
      
      Bbs2VO db_pwd = this.bbs2Service.getBbs2Cont(bbs_no);
      
      if(!db_pwd.getBbs_pwd().equals(del_pwd)) {
         out.println("<script>");
         out.println("alert('비밀번호를 확인해주십시오!');");
         out.println("history.back();");
         out.println("</script>");
      }else {
         this.bbs2Service.delBbs(bbs_no);
         
         if(db_pwd.getBbs_file() != null) {
            File file = new File(up+db_pwd.getBbs_file());
            file.delete();
         }
         return "redirect:/bbs2_list?page="+page;
      }
      return null;
   }
   
   
   @RequestMapping("/travel")
   public String travel(){
      
      /*
       * response.setContentType("text/html;charset=UTF-8");
       * 
       * String dist_category = inputRadio_d != null? "%"+inputRadio_d+"%":
       * "%"+"성북구"+"%"; String season_category = inputRadio_s != null?
       * "%"+inputRadio_s+"%": "%"+"#봄"+"%"; String concert_category = inputRadio_c !=
       * null? "%"+inputRadio_c+"%": "%"+"#공연"+"%";
       * 
       * List<Bbs2VO> dlist = this.bbs2Service.getDistList(dist_category);
       * List<Bbs2VO> slist = this.bbs2Service.getSeasonList(season_category);
       * List<Bbs2VO> clist = this.bbs2Service.getConcertList(concert_category);
       * 
       * model.addAttribute("dist_category", dist_category);
       */
      
      return "travel/travel_main";
   }
   
   @RequestMapping("/travel_test")
   public String travel_test() {
      
      return "travel/travel_test";
   }
   
   @GetMapping(value="/distRad", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public List<Bbs2VO> distRad(String inputR_D){
      
      String dist_category = "%"+inputR_D+"%";
      System.out.println(dist_category);
      List<Bbs2VO> dlist = bbs2Service.getDistList(dist_category);
      System.out.println(dlist);

      return dlist;
   }
   
   @GetMapping(value="/seasonRad", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public List<Bbs2VO> seasonRad(String inputR_S){
      
      String season_category = "%"+inputR_S+"%";
      System.out.println(season_category);
      List<Bbs2VO> slist = bbs2Service.getSeasonList(season_category);
      System.out.println(slist);
      
      return slist;
   }
   
   @GetMapping(value="/concertRad", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public List<Bbs2VO> concertRad(String inputR_C){
      
      String concert_category = "%"+inputR_C+"%";
      System.out.println(concert_category);
      List<Bbs2VO> clist = bbs2Service.getConcertList(concert_category);
      System.out.println(clist);
      
      return clist;
   }
   
}