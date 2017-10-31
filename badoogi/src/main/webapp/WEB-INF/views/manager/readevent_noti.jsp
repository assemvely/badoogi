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
margin-left:300px;
margin-bottom:80px;
margin-right:300px;
}

.btn{
width:100px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
margin-left:1000px;
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
<script type="text/javascript">

	
function on(v,y){

	$.ajax({
		contentType:'application.json',
		type:'get',
		url:'/manager/delbanner',
		data:'bno='+y,
		
		success:function(){
		
			alert("삭제합니다");
			document.getElementById(v).style.display = "none"; 
			

			
			
		}
		
		
	});
}


</script>
</head>


<body>

<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<div id="form_style">
<br/>


<c:forEach items="${managevo}" var="managevo">


<c:choose>
<c:when test="${managevo.managecode=='event'}">
<h2>이벤트</h2>



<h3> 이벤트번호  ${managevo.bno}</h3>
 <%-- <h2><a href="/category/detail?licensenumber=${catelist.licensenumber}">${catelist.storename}</h2></a>
 --%>

<h3>[${managevo.startdate}~${managevo.enddate}]</h3>
<br/>
<button id="title">타이틀 ${managevo.title}</button>
<a href="/manager/readposting?bno=${managevo.bno}"> <p>타이틀 ${managevo.title}</p></a>
<br/>

</c:when>

<c:when test="${managevo.managecode=='noti'}">
<hr/>
<h2>공지사항</h2>
<h3> 공지번호  ${managevo.bno}</h3>
 <%-- <h2><a href="/category/detail?licensenumber=${catelist.licensenumber}">${catelist.storename}</h2></a>
 --%>

<h3>${managevo.writedate}</h3>
<br/>
<button id="title">타이틀 ${managevo.title}</button>
<a href="/manager/readposting?bno=${managevo.bno}"><p>타이틀 ${managevo.title}</p></a>
<div id="readcontent"></div>
<br/>

<hr/>

</c:when>
</c:choose>
 </c:forEach>
</div>
</div>
</body>
</html>