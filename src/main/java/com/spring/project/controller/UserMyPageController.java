package com.spring.project.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.project.commons.PageCreator;
import com.spring.project.commons.SearchVO;
import com.spring.project.model.ContVO;
import com.spring.project.model.UserVO;
import com.spring.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserMyPageController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender mailSender;



	@RequestMapping(value = "/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=93de6231c9989f5db01a876829267562"
				+ "&redirect_uri=http://localhost/project/user/login/oauth_kakao"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	
	@RequestMapping(value = "/login/getKakaoAuthUrl_email")
	  public @ResponseBody String XtraUserInfo (HttpServletRequest request) throws Exception{
	        String reqURL = "https://kauth.kakao.com/oauth/authorize"
	        		+ "?client_id=93de6231c9989f5db01a876829267562"
	        		+ "&redirect_uri=http://localhost/project/user/login/oauth_kakao"
	        		+ "&response_type=code"
	        		+ "&scope=account_email";
	        return reqURL;
	 }
	    
	        
	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao")
	public ModelAndView oauthKakao(
			@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        
       // System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###userInfo_email#### : " + userInfo.get("email"));
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        
        int idx = userInfo.get("email").toString().lastIndexOf("@");
        String user_mail_id = userInfo.get("email").toString().substring(0, idx);
        String user_mail_domain = userInfo.get("email").toString().substring(idx+1,userInfo.get("email").toString().length());
        System.out.println("아이디 : "+user_mail_id+"/ 도메인 : "+user_mail_domain);
        
        UserVO vo = new UserVO();
        vo.setUser_phone("010");
        //vo.setUser_id(userInfo.get("nickname").toString());
        vo.setUser_mail_id(user_mail_id);
        vo.setUser_mail_domain(user_mail_domain);
        List<UserVO> list= service.u_selectPhoneEmail(vo);
        
        if(list.size()==0) {
        	mv.addObject("kakao_info", vo);
        	mv.addObject("msg", "kakaoInfo_null");
        	mv.setViewName("users/user/join");
        }else {
        	session.setAttribute("session_id",list.get(0).getUser_id()); //????????????????????

        	  mv.addObject("kakaoInfo", kakaoInfo);        
              mv.setViewName("main");
        }
        
        return mv; //본인 원하는 경로 설정
	}
	
    //토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=93de6231c9989f5db01a876829267562");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost/project/user/login/oauth_kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body1 : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            //JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            //String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            //System.out.println(nickname);
            System.out.println(email);
            
            userInfo.put("accessToken", access_Token);
            //userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
	

 
	// 회원가입 폼 열기
	@GetMapping("/joinForm")
	public String joinForm() {
		return "users/user/join";
	}
	
	// 회원 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "users/user/login_find_id";
	}

	@PostMapping("/findId")
	public String findIdPost(UserVO vo, Model model) {

		System.out.println("id 찾을 떄 : "+vo.toString());
		String find_by = "";

		// radio박스 특성상 배열로 들어옴
		String[] name_arr = vo.getUser_name().split(",");

		if (vo.getUser_mail_id() != "") { // 이메일로 찾기
			find_by = "byEmail";
			vo.setUser_name(name_arr[1]);
		} else if (vo.getUser_phone() != null) { // 폰번호로 찾기
			find_by = "byPhone";
			vo.setUser_name(name_arr[0]);
		}
		// System.out.println(vo.toString()+"/"+find_by);
		UserVO f = service.u_findId(vo, find_by);
		System.out.println(f);

		model.addAttribute("f", f);

		return "users/user/login_find_complete";
	}

	// 회원 비밀번호 찾기 (랜덤 번호 출력)
	@GetMapping("/findPw")
	public String findPw() {
		return "users/user/login_find_pwd";
	}

	@PostMapping("/findPw")
	public ModelAndView findPwPost(UserVO vo) {

		System.out.println("이거 정보 : " +vo.toString());
		ModelAndView mv = new ModelAndView();

		String find_by = "";

		// radio박스 특성상 배열로 들어옴
		String[] id_arr = vo.getUser_id().split(",");
		String[] name_arr = vo.getUser_name().split(",");

		if (vo.getUser_mail_id() != "") { // 이메일로 찾기
			find_by = "byEmail";
			vo.setUser_id(id_arr[1]);
			vo.setUser_name(name_arr[1]);
		} else if (vo.getUser_phone() != null) { // 폰번호로 찾기
			find_by = "byPhone";
			vo.setUser_id(id_arr[0]);
			vo.setUser_name(name_arr[0]);
		}

		UserVO f;
		try {
			f = service.u_findPw(vo, find_by);
			sendMailTest2(f);
			
		} catch (Exception e) {
			f = null;
		}
		
		
		mv.addObject("f", f);
		mv.setViewName("users/user/login_find_complete");

		return mv;
	}
	
	
    public void sendMailTest2(UserVO tempvo) throws Exception{
 
        String subject = "Seoul Tour 사이트에서 임시비밀번호를 알려드립니다.";
        String content = tempvo.getUser_id()+"님의 임시 비밀번호는 "+tempvo.getUser_pwd()+"입니다.";
        String from = "whskadyd29@naver.com";
        String to = tempvo.getUser_mail_id()+"@"+tempvo.getUser_mail_domain();
        
        
        final MimeMessagePreparator preparator = new MimeMessagePreparator() {
            
            public void prepare(MimeMessage mimeMessage) throws Exception{
                final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                
                mailHelper.setFrom(from);
                mailHelper.setTo(to);
                mailHelper.setSubject(subject);
                mailHelper.setText(content, true);
 
            }
            
        };
        
        try {    
            mailSender.send(preparator);
            
        } catch(Exception e) {
            e.printStackTrace();
        }        
        
    }
	
	
	
	
	

	// 마이페이지 보기
	@GetMapping("/mypage")
	public String mypageGet(HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = (String) session.getAttribute("session_id"); // 세션 아이디값을 구함
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back()");
			out.println("</script>");
		} else {

			return "users/user/mypage_main";

		}
		return null;
	}

	// 회원정보 수정
	@GetMapping("/mypage/join_update")
	public String join_update(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String user_id = session.getAttribute("session_id").toString();
		if (user_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			UserVO f = service.u_selectOne(user_id);
			model.addAttribute("f", f);
			return "users/user/join_update";
		}
		return null;

	}

	@PostMapping("/mypage/join_update")
	public String join_updatePost(UserVO input, Model model, HttpServletResponse response) throws IOException {
		System.out.println(input.toString());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = service.u_updateMyPage(input);
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
	@PostMapping("/user_del")
	public String user_del(UserVO input, HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user_id = session.getAttribute("session_id").toString();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if (user_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("history.back()"); // home url
			out.println("</script>");
		} else {
			UserVO data = service.u_selectOne(input.getUser_id());

			if (!encoder.matches(input.getUser_pwd(), data.getUser_pwd())) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				int result = service.u_delete(input);
				if (result != 1) {
					out.println("<script>");
					out.println("alert('회원 탈퇴에 실패했습니다. 다시 시도해주세요.');");
					out.println("history.back();");
					out.println("</script>");
				} else {
					session.invalidate();
					out.println("<script>");
					out.println("alert('회원 탈퇴에 성공했습니다.');");
					out.println("location='/project/main';");
					out.println("</script>");

				}
			}

		}
		return null;

	}

	@GetMapping("/mypage/list")
	public String ListCont(@ModelAttribute SearchVO search, Model model, RedirectAttributes ra, HttpSession session) {
		if (session.getAttribute("session_id") != null) {
			String id = session.getAttribute("session_id").toString();
			System.out.println(search.toString());
			search.setContent_id(id);
			List<ContVO> list = service.u_mypageListCont(search);

			PageCreator pc = new PageCreator();
			search.setCounterPerPage(8);
			pc.setPaging(search);
			pc.setArticleTotalCount(service.u_mypageContTotalCount(search));
			System.out.println(pc.getBeginPage());
			System.out.println(pc.getEndPage());

			model.addAttribute("articles", list);
			model.addAttribute("pc", pc);
			ra.addFlashAttribute("msg", "auth_success");

			return "users/user/mypage_main";

		} else {
			ra.addFlashAttribute("msg", "auth_fail");
			return "redirect:/main";
		}
	}
	


}
