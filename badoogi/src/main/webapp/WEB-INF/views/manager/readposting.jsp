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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>

<p style="text-align:center;color:gray;font-size:20px;">readmanage</p>
<hr/>
<br/>
<div id="form_style">
<c:choose>
<c:when test="${readmanagevo.managecode=='event'}">
<h3>[${readmanagevo.startdate}~${readmanagevo.enddate}]</h3>
</c:when>
<c:when test="${readmanagevo.managecode='noti'}">
<h3>[${readmanagevo.writedate}]</h3>
</c:when>


</c:choose>
<h3>${readmanagevo.title }</h3>
<br/>
<br/>
<div>
${readmanagevo.content}
</div>
</div>

<c:choose>
<c:when test="${readmanagevo.managecode=='event' }">

</c:when>
<c:when test="${readmanagevo.managecode=='noti' }">
</c:when>
</c:choose>
</body>
</html>