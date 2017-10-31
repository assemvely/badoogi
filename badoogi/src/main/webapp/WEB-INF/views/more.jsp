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

}

.btn{
width:775px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
.img_wrap{
width:700px;
margin-top:10px

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

<div  margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<img src="/resources/basicimg/basic_profile.jpg"> 
<a href="/user/loginpage">로그인</a> | <a href="/user/userjoin">회원가입</a>
<br/><br/><br/>
<c:choose>
<c:when test="${login.usercode=='cus'}">

<a href="/community/personallist?email=${login.email}">
<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-4-user.png"/>마이페이지
</button>
</a>
</c:when>
<c:when test="${login.usercode=='ent'}">

<a href="/category/detail?licensenumber=${login.licensenumber}">
<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-4-user.png"/>My페이지
</button>
</a>
</c:when>
<c:when test="${login==null }">

<button type="submit"   style="font-size:20px;">
<img src="/resources/glyphicons/glyphicons-4-user.png"/>My페이지
</button>

</c:when>

</c:choose>
</div>
</body>
</html>