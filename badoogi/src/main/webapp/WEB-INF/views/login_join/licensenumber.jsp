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
.btn{
width:50px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JOIN PAGE</title>
</head>
<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">업체가입</p>
<hr/>

</div>

<div align="center">

<form action="/user/license_join" method="POST">
<input type="text" size="55" placeholder="사업자 번호 입력" name="licensenumber"  style="font-size:19pt;">

<button type="submit" name="btn"  class="btn" style="font-size:20px;">
입력
</button>

</form>
</div>
</body>
</html>