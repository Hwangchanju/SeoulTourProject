<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>

<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
<link rel="stylesheet" type="text/css" href="./resources/css/travel/travel_main.css">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/travel.js"></script>

<script>

 $(document).ready(function(){        
  radio_check();
 });

 function radio_check(){
    var inputR_D = $('input[name="tab"]:checked').val();
    
    $.ajax({
       type:"get",
       url:"distRad",
       dataType:"json",
       data:"inputR_D="+inputR_D,
       headers:{
          "Content-Type" : "json/application"
       },
       success:function(objD){
          var numD = 2;
          getDistrictListCallback(objD, numD);
       },
       error:function(){
          alert("실패");
          console.log(error);
       }
    });
    
    function getDistrictListCallback(objD, numD){
          
          var listD = objD;
          var listDLen = objD.length;
          
          console.log(listD);
          console.log(listDLen);
          
          var strD = "";
          
         if(listDLen >  0){
              
              for(var a=0; a<numD; a++){
                 var bbsD_no = listD[a]?.bbs_no;
                 var bbsD_title = listD[a]?.bbs_title;
                 var bbsD_file = listD[a]?.bbs_file;
                 var bbsD_category = listD[a]?.bbs_category;
                       
                 var pageD = (bbsD_no-1)/8;
                 pageD = parseInt(pageD)+1;
                 
                 strD += "<a href='bbs2_cont?bbs2_no="+ bbsD_no +"&page=" + pageD + "&state=cont'>" + "<img src='./upload2" + bbsD_file + "'/>";
                 strD += "<span class='img_title'>" + bbsD_title
                 strD += "</span>";
                 strD += "<span class='img_cont'>" + bbsD_category + "</span>";
                 strD += "</a>";
              }
              
          } else {
            
          }
         
          $('.tab_cont').html(strD);
           
      }
 }
 
 $(document).ready(function(){        
     sradio_check();
    });
 
  function sradio_check(){
     
     var inputR_S = $('input[name="s_tab"]:checked').val();
     
     $.ajax({
          type:"get",
          url:"seasonRad",
          dataType:"json",
          data:"inputR_S="+inputR_S,
          headers:{
             "Content-Type":"json/application"
          },
          success:function(objS){
             var numS = 3;
             getSeasonListCallback(objS, numS);
          },
          error:function(){
             alert("실패");
             console.log(error);
          }
       });
     
     function getSeasonListCallback(objS, numS){
          
          var listS = objS;
          var listSLen = objS.length;
          
          console.log(listS);
          console.log(listSLen);
          
          var strS = "";
          
          if(listSLen >  0){
              
              for(var b=0; b<numS; b++){
                 var bbsS_no = listS[b]?.bbs_no;
                 var bbsS_title = listS[b]?.bbs_title;
                 var bbsS_file = listS[b]?.bbs_file;
                 var bbsS_category = listS[b]?.bbs_category;
                 
                 var pageS = (bbsS_no-1)/8;
                 pageS = parseInt(pageS)+1;
                  
                 
                  strS += "<a href='bbs2_cont?bbs2_no=" + bbsS_no + "&page="+pageS+"&state=cont'>" + "<img src='./upload2" + bbsS_file + "'/>";
                  strS += "<span class='img_title'>" + bbsS_title + "</span>";
                  strS += "<span class='img_cont'>" + bbsS_category + "</span>";
                  strS += "</a>";
              } 
              
          } else {

          }
          $(".s_cont").html(strS);
      }
  }
  
  $(document).ready(function(){        
     cradio_check();
    });

  function cradio_check(){
     
     var inputR_C = $('input[name="c_tab"]:checked').val();
     
     
     $.ajax({
          type:"get",
          url:"concertRad",
          dataType:"json",
          data:"inputR_C="+inputR_C,
          headers:{
             "Content-Type":"json/application"
          },
          success:function(objC){
             var numC = 3;
             getConcertListCallback(objC, numC);
          },
          error:function(){
             alert("실패");
             console.log(error);
          }
       });
     
     function getConcertListCallback(objC, numC){
          
          var listC = objC;
          var listCLen = objC.length;
          
          console.log(listC);
          console.log(listCLen);
          
          var strC = "";
          
          if(listCLen >  0){
              
              for(var c=0; c<numC; c++){
                 var bbsC_no = listC[c]?.bbs_no;
                 var bbsC_title = listC[c]?.bbs_title;
                 var bbsC_file = listC[c]?.bbs_file;
                 var bbsC_category = listC[c]?.bbs_category;

                 
                 var pageC = (bbsC_no-1)/8;
                 pageC = parseInt(pageC)+1;
                 
                  strC += "<a href='bbs2_cont?bbs2_no=" + bbsC_no + "&page="+pageC+"&state=cont'>" + "<img src='./upload2" + bbsC_file + "'/>";
                  strC += "<span class='img_title'>" + bbsC_title + "</span>";
                  strC += "<span class='img_cont'>" + bbsC_category + "</span>";
                  strC += "</a>";
                  
              } 
              
          } else {

          }
          
          $(".c_cont").html(strC);
      }
  }
</script>
</head>
<body>

 <div class="section">
 
    <input type="radio" name="slide" id="slide01" checked />
    <input type="radio" name="slide" id="slide02" />
    <input type="radio" name="slide" id="slide03" />
    
    <div class="slidewrap">
       
       <ul class="slidelist">
          <li>
          
             <a class="slidebutton" href="bbs2_cont?bbs2_no=70&page=9&state=cont">
                <img src="./upload2/2021-9-16/bbs2021916641485232.jpg">
                <label for="slide03" class="left"></label>
                <span class="img_title">경복궁</span>
                <span class="img_cont">종로구 #한국전통 #서울명소</span>
                <label for="slide02" class="right"></label>
             </a>
          </li>
          
          <li>
             <a class="slidebutton" href="bbs2_cont?bbs2_no=74&page=10&state=cont">
                 <img src="./upload2/2021-9-16/bbs2021916587774958.jpg">
                <label for="slide01" class="left"></label>
                <span class="img_title">롯데월드타워</span>
                <span class="img_cont">송파구 신천동 #서울스카이 #석촌호수 #롯데월드</span>
                <label for="slide03" class="right"></label>
             </a>
          </li>
          
          <li>
             <a class="slidebutton" href="bbs2_cont?bbs2_no=73&page=10&state=cont">
                <img src="./upload2/2021-9-16/bbs2021915849220751.png">
                <label for="slide02" class="left"></label>
                <span class="img_title">별마당도서관</span>
                <span class="img_cont">강남구 삼성동 #문화 #북콘서트 #코엑스</span>
                <label for="slide01" class="right"></label>
             </a>
          </li>
       </ul>
    </div>
 </div>
 
 <div id="wrap">
 
    <p>지역별</p>
    <hr/>
 
 <div id="district_tab">
    
    <input id="tab01" type="radio" name="tab" value="강남구" onclick="radio_check();" checked />
    <input id="tab02" type="radio" name="tab" value="강동구" onclick="radio_check();" />
    <input id="tab03" type="radio" name="tab" value="강북구" onclick="radio_check();" />
    <input id="tab04" type="radio" name="tab" value="강서구" onclick="radio_check();" />
    <input id="tab05" type="radio" name="tab" value="관악구" onclick="radio_check();" />
    <input id="tab06" type="radio" name="tab" value="광진구" onclick="radio_check();" />
    <input id="tab07" type="radio" name="tab" value="구로구" onclick="radio_check();" />
    <input id="tab08" type="radio" name="tab" value="금천구" onclick="radio_check();" />
    <input id="tab09" type="radio" name="tab" value="노원구" onclick="radio_check();" />
    <input id="tab10" type="radio" name="tab" value="도봉구" onclick="radio_check();" />
    <input id="tab11" type="radio" name="tab" value="동대문구" onclick="radio_check();" />
    <input id="tab12" type="radio" name="tab" value="동작구" onclick="radio_check();" />
    <input id="tab13" type="radio" name="tab" value="마포구" onclick="radio_check();" />
    <input id="tab14" type="radio" name="tab" value="서대문구" onclick="radio_check();" />
    <input id="tab15" type="radio" name="tab" value="서초구" onclick="radio_check();" />
    <input id="tab16" type="radio" name="tab" value="성동구" onclick="radio_check();" />
    <input id="tab17" type="radio" name="tab" value="성북구" onclick="radio_check();" />
    <input id="tab18" type="radio" name="tab" value="송파구" onclick="radio_check();" />
    <input id="tab19" type="radio" name="tab" value="양천구" onclick="radio_check();" />
    <input id="tab20" type="radio" name="tab" value="영등포구" onclick="radio_check();" />
    <input id="tab21" type="radio" name="tab" value="용산구" onclick="radio_check();" />
    <input id="tab22" type="radio" name="tab" value="은평구" onclick="radio_check();" />
    <input id="tab23" type="radio" name="tab" value="종로구" onclick="radio_check();" />
    <input id="tab24" type="radio" name="tab" value="중구" onclick="radio_check();" />
    <input id="tab25" type="radio" name="tab" value="중랑구" onclick="radio_check();" />
    
    <label for="tab01">강남구</label>
    <label for="tab02">강동구</label>
    <label for="tab03">강북구</label>
    <label for="tab04">강서구</label>
    <label for="tab05">관악구</label>
    <label for="tab06">광진구</label>
    <label for="tab07">구로구</label>
    <label for="tab08">금천구</label>
    <label for="tab09">노원구</label>
    <label for="tab10">도봉구</label>
    
    <div id="tog_btn" onclick="toggle()">더보기</div>
    
    <div class="clear"></div>
    
    <div id="tab_hidden">
    
    <label for="tab11">동대문구</label>
   <label for="tab12">동작구</label>
   <label for="tab13">마포구</label>
   <label for="tab14">서대문구</label>
   <label for="tab15">서초구</label>
   <label for="tab16">성동구</label>
   <label for="tab17">성북구</label>
   <label for="tab18">송파구</label>
    <label for="tab19">양천구</label>
    <label for="tab20">영등포구</label>
    <label for="tab21">용산구</label>
    <label for="tab22">은평구</label>
    <label for="tab23">종로구</label>
    <label for="tab24">중구</label>
    <label for="tab25">중랑구</label>
    </div>
 </div>

     <div class="tab_cont">
        
        
    </div>
    <div class="clear"></div>
    
    <div id="season_tab">
 
    <p>계절별</p>
    <hr/>
    
    <input id="s_tab01" type="radio" name="s_tab" value="봄" onclick="sradio_check();" checked />
    <input id="s_tab02" type="radio" name="s_tab" value="여름" onclick="sradio_check();" />
    <input id="s_tab03" type="radio" name="s_tab" value="가을" onclick="sradio_check();" />
    <input id="s_tab04" type="radio" name="s_tab" value="겨울" onclick="sradio_check();" />
 
    <div id="season_title">
    <label for="s_tab01">#봄</label>
    <label for="s_tab02">#여름</label>
    <label for="s_tab03">#가을</label>
    <label for="s_tab04">#겨울</label>
    </div>
    
    <div class="s_cont">
    
    </div>
 </div>   

   <div id="concert_tab">
   
   <p>문화 Contents</p>
   <hr/>
 
    <input id="c_tab01" type="radio" name="c_tab" value="공연" onclick="cradio_check();" checked />
    <input id="c_tab02" type="radio" name="c_tab" value="전시" onclick="cradio_check();" />
    <input id="c_tab03" type="radio" name="c_tab" value="축제" onclick="cradio_check();" />
    
    <div id="concert_title">
    <label for="c_tab01">#공연</label>
    <label for="c_tab02">#전시</label>
    <label for="c_tab03">#축제</label>
    </div>
    
    <div class="c_cont">
    
    </div>
 
 </div>
</div> 
</body>
</html>

<jsp:include page="../include/footer.jsp" />