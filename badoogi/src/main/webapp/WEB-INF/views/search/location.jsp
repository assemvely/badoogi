<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<head>
<style>
#form_style{
aling:center;
margin-top:10px;
margin-left:570px;
margin-bottom:80px;
margin-right:570px;
}
.btn{
width:100px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}

#locabtn{
width:250px;
height:100px;
background-color:white;
}
.img_wrap{
width:300px;
margin-top:50px

}

.img_wrap img{
max-width:100%;
align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">지역별검색</p>

</div>
<hr/>
<div id="form_style">

<img src="/resources/glyphicons/glyphicons-28-search.png"><input type="text" id="keyword" style="width:700px;height:55px;" placeholder="지역명 검색"><button id="btn" class="btn">검색</button>
<p>5개까지 선택가능합니다</p><h3 id="mygps" style="margin-left:600px;"><a href="/search/mygps?email=${login.email}"><img src="/resources/glyphicons/glyphicons-243-map-marker.png">현재위치</a></h3>

<br/>
<br/>
<br/>

<div id="first">

<form action="/search/locadetail">
<button id="locabtn"  name="location" value="seoul">서울</button>
<button name="location" value="gyeonggi" id="locabtn">경기</button>
<button name="location" value="inchon" id="locabtn">인천</button>
<button name="location" value="busan" id="locabtn">부산</button>
<button name="location" value="deagu"  id="locabtn">대구</button>
<button name="location" value="deajeon"  id="locabtn">대전</button>
<button name="location" value="gyeongnam" id="locabtn">경남</button>
<button name="location" value="jeonnam" id="locabtn">전남</button>
<button name="location" value="chungnam" id="locabtn">충남</button>
<button name="location" value="guangju"  id="locabtn">광주</button>
<button name="location" value="ulsan"  id="locabtn">울산</button>
<button name="location" value="geangbuk" id="locabtn">경북</button>
<button name="location" value="jeonbuk"  id="locabtn">전북</button>
<button name="location" value="chungbuk" id="locabtn">충북</button>
<button name="location" value="gangwon" id="locabtn">강원</button>
<button name="location" value="jeju"  id="locabtn">제주</button>
<button name="location" value="sejong"  id="locabtn">세종</button>
<button name="location" value="all" id="locabtn">전국</button>

</form>
</div>



</div>
</body>
</html>