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
width:100px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<p style="text-align:center;color:gray;font-size:20px;">search</p>
<hr/>
|
<div id="form_style">

<form action="/search/catehash">
<input type="hidden" name="email" value=${login.email }>
<img src="/resources/glyphicons/glyphicons-28-search.png"><input type="text" name="keyword" style="width:700px;height:55px;" placeholder="#검색어를 입력해주세요"><button class="btn">검색</button>


</form>


<h3>추천 검색어</h3>

<div id="ranking-left" style="float:left;">

<input type="text" placeholder="1">
<input type="text" placeholder="2">
<input type="text" placeholder="3">
<input type="text" placeholder="4">
<input type="text" placeholder="5">
</div>
<div id="ranking-right">
<input type="text" placeholder="6">
<input type="text" placeholder="7">
<input type="text" placeholder="8">
<input type="text" placeholder="9">
<input type="text" placeholder="10">
</div>
</div>
</body>
</html>