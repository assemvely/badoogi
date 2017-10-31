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
margin-top:50px;
margin-left:570px;
margin-bottom:80px;

}

.btn{
width:775px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">log in</p>
<hr/>
</div>
<form action="/user/login" method="POST"><div id="form_style">
<input type="text" size="55" placeholder="email입력" name="email" style="font-size:19pt;border-radius:10px;margin-bottom:10px;">
<br/>
<input type="password" size="55" placeholder="password입력" name="pw" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">

</div>
<div id="form_style" style="margin-top:40px;">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
login
</button>
</div>
</form>
</body>
</html>