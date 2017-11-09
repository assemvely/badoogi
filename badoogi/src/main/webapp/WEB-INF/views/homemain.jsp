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
aling:center;
margin-top:100px;
margin-left:400px;
margin-bottom:80px;
margin-right:350px;
}

.btn{
width:300px;
height:60px;
background-color:white;
border:1x solid yellow;
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
                  </script>
</head>
<body>


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
                                 alt="no images" style="width:2000px;hight:450px;"></a>
                               <input type="hidden" name="managecode" value="${banner.managecode}">  
                           </div>
 
                        </c:forEach>
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
                     <!-- 끝 Controls 화살표 표시 창 끝-->
                  </div>

<div id="form_style">
<a href="/category/categorylist?category=All">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
전체보기
</button></a>
<a href="/category/categorylist?category=HOSPITAL">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
동물병원
</button></a>
<a href="/category/categorylist?category=CAFE">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
애견카페
</button></a>
<a href="/category/categorylist?category=SHOP">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
애견용품
</button></a>
<br/>
<a href="/category/categorylist?category=PENSION">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
애견팬션
</button></a>
<a href="/category/categorylist?category=SCHOOL">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
애견학교
</button></a>
<a href="/category/categorylist?category=HOTEL" >
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
애견호텔
</button></a>
<a href="/category/categorylist?category=ADOPT">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
유기견입양
</button></a>

<br/>
<br/>
<br/>

<br/>

<bR/>
<hr/><h3>기획전</h3> <a href="/manager/promotionlist">
<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-28-search.png">기획전전체보기
</button>


</a><hr/><br/>
<c:forEach items="${PROMOTION}"  var="provo">
<a href="/manager/readpromotion?bno=${provo.bno }">
 <img  src="/user/showimg?realPath=${provo.realPath}&realfilename=${provo.realfilename}"
                                 alt="no images">
                                 </a>
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

<a href="/manager/getlist?managecode=event">,
<button type="submit"   style="font-size:20px;">
이벤트 목록
</button>
</a>

<a href="/manager/getlist?managecode=noti">,
<button type="submit"   style="font-size:20px;">
공지사항
</button>
</a>
<a href="/search/location">
<button type="submit"   style="font-size:20px;">
지역검색
</button>
</a>

<a href="/community/uploadpage">
<button type="submit"   style="font-size:20px;">
커뮤니티 업로드
</button>
</a>

<a href="/community/commulist?email=${login.email}">
<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-28-search.png">커뮤니티
</button>
</a>

<a href="/all/more">
<button type="submit" style="font-size:20px;">
더보기
</button>

<a href="/user/userjoin">
<button type="submit" style="font-size:20px;">
 일반회원가입
</button></a>

<a href="/user/entjoin">
<button type="submit"   style="font-size:20px;">
 업체 가입
</button></a>

<a href="/user/loginpage">
<button type="submit"   style="font-size:20px;">
 로그인
</button>


</a>

<a href="/manager/topromotion">
<button type="submit"   style="font-size:20px;">
기획전
</button>
</a>

<a href="/manager/promotionlist">
<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-28-search.png">기획전전체보기
</button>


</a>
</div>
</body>
</html>