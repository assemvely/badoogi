<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/npm.js"></script>
<!-- Bootstrap Core CSS 깔기 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<!-- css admin깔기 -->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<link href="font-awsome/css/font-awesome.cin.css" rel="stylesheet"
   type="text/css">

<head>
<style>
#form_style{
text-align:center;
align:center;

margin:0 auto;

}

.btn{
width:160px;
height:55px;
background-color:white;
border:0;
outline:0;
color:black;

font-size:18px;
}

.btn1{
width:126px;
height:55px;
background-color:white;
border:0;
outline:0;
color:black;
border-right: 1px solid  #e6e6e6 ;

}
.owl-controls{
vertical-align:center;
margin-left:1000px;
}

.owl-prev {
margin-top:10px;
width:50px;
height:20px;
font-weight: bold;
color:#999999;
vertical-align:center;
font-size: 14px;
font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
}
 
.owl-next {
vertical-align:center;
width:50px;
height:20px;
font-weight: bold;
color:#999999;
font-size: 14px;
font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
   
}
body {
    font-family: "Lato", sans-serif;
    
}

.sidenav {
	--right;
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: white;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {

    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 15px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

div.backLayer {
       display:none;
       background-color:black;
        position:absolute;
        left:0px;
        top:0px;
        opacity:0.5;
    }

#banner{
width:1920px;
height:230px; 
}

#promotion{
margin-left:5px;
margin-right:5px;
text-align:center;


}
.pro{
width:990px;
height:230px;
margin-left: auto; margin-right: auto; display: block;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <script type="text/javascript">
                     $(document).ready(function() {
 
                        $(".owl-carousel").owlCarousel({
                           loop : true,
                           margin : 10,
                           nav : true,
                           responsive : {
                              0 : {
                                 items : 1
                              },
                              600 : {
                                 items : 3
                              },
                              1000 : {
                                 items : 5
                              }
                           }
                        });
 
                     });
                     
                     function openNav() {
                    	    document.getElementById("mySidenav").style.width = "200px";
                    	    var width = $(document).width();
                    	    var height=$(document).height();
                    	    
                    	    $(".backLayer").width(width);
                    	     $(".backLayer").height(height);
                    	     $(".backLayer").fadeTo(500, 0.3);
                    	    
                    	    
                    	}

                    	function closeNav() {
                    	    document.getElementById("mySidenav").style.width = "0";
                    	   
                    	    $(".backLayer").hide();
                    	    $(".backLayer").fadeOut(300);
                    	}
                    	
                    	$(window).resize(function(){
                    		        var width = $(window).width();
                    		        var height = $(window).height();
                    		        $(".backLayer").width(width).height(height);
                    		    });


                  </script>
</head>
<body>
<div class="backLayer "></div>
<div id="form_style">
<div id="topbar" style="height:88px:">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <c:choose><c:when test="${login.email!=null}"> <h3>${login.nickname }</h3>
  <h6>${login.email}</h6>
  <a href="#">바둠</a>
 <a href="/user/mycoupon?email=${login.email }">쿠폰</a>
   <a href="/community/personallist?email=${login.email}">My페이지</a>
  <a href="#">계정설정</a>
  <a href="/manager/getlist?managecode=event">이벤트</a>
  <a href="#">1:1문의하기</a></c:when>
  <c:when test="${login.usercode=='manager' }">
  
  <h6>${login.email}</h6>
  <a href="#">바둠</a>
 <a href="/user/mycoupon?email=${login.email }">쿠폰</a>
   <a href="/community/personallist?email=${login.email}">My페이지</a>
  <a href="#">계정설정</a>
  <a href="/manager/getlist?managecode=event">이벤트</a>
  <a href="#">문의함</a>
  
  
  </c:when>

  <c:otherwise>
 <a href="/user/loginpage">로그인</a>
 <a href="/user/userjoin">가입</a>
  <a href="#">바둠</a>
  <a href="#">쿠폰</a>
  <a href="#">My페이지</a>
  <a href="#">계정설정</a>
  <a href="/manager/getlist?managecode=event">이벤트</a>
  <a href="#">1:1문의하기</a>
  
  </c:otherwise>
  
  </c:choose>
 
  
</div><div style="float:left;margin-bottom:10px;">
                 
<a href="/all/page" >
<button type="submit"  class="btn"  style="font-size:20px;">
<img src="/resources/basicimg/badoogilogo.png" style="width:80px; height:30px;">
</button>
</a>
<a href="/community/commulist?email=${login.email}" >
<button type="submit"  class="btn1"  style="font-size:20px;">
<img src="/resources/basicimg/commu_icon.gif"><br/>
커뮤니티
</button>
</a>

<a href="/search/location">
<button type="submit"  class="btn1" style="font-size:20px;">
<img src="/resources/basicimg/area_icon.gif"><br/>
지역검색
</button>
</a>

<a href="/search/catesearch">
<button type="submit" class="btn1"   style="font-size:20px;">
<img src="/resources/basicimg/search_icon.gif"><br/>검색
</button>
</a>

</div>
<span style="font-size:20px;cursor:pointer;" onclick="openNav()"><img src="/resources/basicimg/more_icon.gif"> 더보기</span>
</div>

<!-- topbar 끝 -->
<div id="banner">
 <div id="carousel-example-generic" class="carousel slide"
                     data-ride="carousel">
 
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                     </ol>

   <div class="carousel-inner" role="listbox">
                        <div class="item active">
                      
 
     
                        <c:forEach items="${BANNER}" var="banner">
                           <div class="item">
                              <a href="/manager/readposting?bno=${banner.bno}"><img
                                 src="/user/showimg?realPath=${banner.realPath}&realfilename=${banner.realfilename}"
                                 alt="no images" style="width:100%; height:100%;"></a>
                               <input type="hidden" name="managecode" value="${banner.managecode}">  
                           </div>
 
                        </c:forEach>
                        </div>
                        
                   
 					
                     </div> 
                     
                     </div>

      <!-- Controls 화살표 표시 창 -->
                    <a class="left carousel-control"
                           href="#carousel-example-generic" role="button"
                           data-slide="prev"> <span
                           class="glyphicon glyphicon-triangle-left" aria-hidden="true"
                           style="padding-top:120px;"></span> <span align="center"
                           class="sr-only">Previous</span>
                        </a> <a class="right carousel-control"
                           href="#carousel-example-generic" role="button"
                           data-slide="next"> <span
                           class="glyphicon glyphicon-triangle-right" aria-hidden="true"
                           style="margin-top: 120px;"></span> <span align="center"
                           class="sr-only">Next</span>
                        </a>
        
                  </div>


<div id="category">
<a href="/category/categorylist">
<button type="submit" name="btn"  class="btn">
<img src="/resources/basicimg/category_0.gif"><br/>
전체보기
</button></a>
<a href="/category/categorylist?category=HOSPITAL">
<button type="submit" name="btn"  class="btn" >
<img src="/resources/basicimg/category_1.gif"><br/>
동물병원
</button></a>
<a href="/category/categorylist?category=CAFE">
<button type="submit" name="btn"  class="btn" >
<img src="/resources/basicimg/category_2.gif"><br/>
애견카페
</button></a>
<a href="/category/categorylist?category=SHOP">
<button type="submit" name="btn"  class="btn">
<img src="/resources/basicimg/category_3.gif"><br/>
애견용품
</button></a>
<a href="/category/categorylist?category=PENSION">
<button type="submit" name="btn"  class="btn" >
<img src="/resources/basicimg/category_4.gif"><br/>
애견팬션
</button></a>
<a href="/category/categorylist?category=SCHOOL">
<button type="submit" name="btn"  class="btn">
<img src="/resources/basicimg/category_5.gif"><br/>
애견학교
</button></a>
<a href="/category/categorylist?category=HOTEL" >
<button type="submit" name="btn"  class="btn" >
<img src="/resources/basicimg/category_6.gif"><br/>
애견호텔
</button></a>
<a href="/category/categorylist?category=ADOPT">
<button type="submit" name="btn"  class="btn" >
<img src="/resources/basicimg/category_7.gif"><br/>
유기견입양
</button></a>
</div>
<br/>
<br/>
<br/>

<br/>


<hr/>
<div id="promotion">
<h3 style="font-size:18px; font-weight:bold;">기획전</h3> <a href="/manager/promotionlist"><button type="submit" class="btn"  style="margin-left:1080px;font-size:18px;">
 전체보기 <img src="/resources/basicimg/arrow_right_47.gif">
</button>
</div> 

</a><br/><br/>

<c:forEach items="${PROMOTION}"  var="provo">
<div class="pro">
<a href="/manager/readpromotion?bno=${provo.bno }" >
 <img  src="/user/showimg?realPath=${provo.realPath}&realfilename=${provo.realfilename}"
                                 alt="no images" style="width:100%;height:100%;">
                                 </a>
</div>                                 
 </c:forEach>

 
 <a href="/manager/managepage">
<button type="submit"   style="font-size:20px;">
배너/이벤트/공지쓰기
</button>
</a>
<a href="/manager/managelist">
<button type="submit"   style="font-size:20px;">
배너리스트보기
</button>
</a>



<a href="/manager/getlist?managecode=noti">,
<button type="submit"   style="font-size:20px;">
공지사항
</button>
</a>


<a href="/community/uploadpage">
<button type="submit"   style="font-size:20px;">
커뮤니티 업로드
</button>
</a>



<!-- <a href="/all/more">
<button type="submit" style="font-size:20px;">
더보기
</button> -->

<a href="/user/userjoin">
<button type="submit" style="font-size:20px;">
 일반회원가입
</button></a>

<a href="/user/entjoin">
<button type="submit"   style="font-size:20px;">
 업체 가입
</button></a>



<a href="/manager/topromotion">
<button type="submit"   style="font-size:20px;">
기획전
</button>
</a>

<a href="/manager/promotionlist">
<button type="submit"   style="font-size:20px;">기획전전체보기
</button>
</a>


<a href="/manager/coupon">
<button type="submit"   style="font-size:20px;">
쿠폰입력
</button>
</a>

<a href="/manager/tocouponlist">
<button type="submit"   style="font-size:20px;">
쿠폰목록
</button>
</a>

<a href="/user/userlist">
<button type="submit"   style="font-size:20px;">
유저목록
</button>
</a>

</div>

</body>
</html>