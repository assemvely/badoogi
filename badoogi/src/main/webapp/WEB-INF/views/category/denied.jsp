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
align:center;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>welcome</title>
</head>
<body>
<p style="text-align:center;color:gray;font-size:20px;">업체등록</p>
<hr/>


<div style="text-align:center; margin-top:150px; margin-bottom:130px">
<img src="/resources/basicimg/logo.jpg">
<br/>
<br/>
<h3> 죄송합니다!</h3>
<p>아직 승인나지않은 업체입니다. 메일받은 후 다시 찾아주세요!</p>
</div>
<div id="form_style" style="margin-top:40px;">
<a href="/user/page">
<button type="submit"  class="btn" style="font-size:20px;">
 home
</button></a>

</div>
</body>
</html>