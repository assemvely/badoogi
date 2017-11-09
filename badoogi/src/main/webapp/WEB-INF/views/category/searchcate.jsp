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
#searchbtn{
width:100px;
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
<script type="text/javascript">




function insert(v,y){


if($("#login").val()==null){alert("로그인후 이용가능합니다."); return false;}else{
if($(v).prop("checked")){


$.ajax({
 	contentType:'application.json',
 	type:'get',
 	url:'/likebadoom/insert',
 	data:'licensenumber='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom'+'&communitybno=1',
 	
 	success:function(result){
 		alert("성공");
 		getlist();
 	}
 
 });

}else{


$.ajax({
 	contentType:'application.json',
 	type:'get',
 	url:'/likebadoom/delete',
  	data:'licensenumber='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom'+'&communitybno=1',
  	success:function(result){
 		alert("성공");
 		getlist();
 	}
 
 });
}
}
}

function insertlike(v,y){


if($("#login").val()==null){alert("로그인후 이용가능합니다."); return false;}else{
if($(v).prop("checked")){
 
    
   $.ajax({
     	contentType:'application.json',
     	type:'get',
     	url:'/likebadoom/insert',
     	data:'licensenumber='+y+'&email='+$('#login').val()+'&likebadoomcode=like'+'&communitybno=1',
     	
     	success:function(result){
     		alert("성공");
     		getlist();
     	}
     });
	
}else{
 

  $.ajax({
     	contentType:'application.json',
     	type:'get',
     	url:'/likebadoom/delete',
      	data:'licensenumber='+y+'&email='+$('#login').val()+'&likebadoomcode=like'+'&communitybno=1',
      	success:function(result){
     		alert("성공");
     		getlist();
     	}
     
     });
}
}
}
</script>
</head>

<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<div id="form_style">
<form action="/search/catehash">
<img src="/resources/glyphicons/glyphicons-28-search.png">  <input type="text" id="keyword" value="${dto}" style="width:700px;height:55px;" placeholder="${keyword}검색결과입니다"><button id="searchbtn" class="btn">검색</button>
<input type="hidden" id="email" value="${login.email }">
</form>
<input type="hidden" id="mygps" value="${keyword}">
<input type="hidden" id="login" value="${login.email }">

<c:forEach items="${catedto }" var="catedto">


<h3>${catedto.storename}</h3><br/>
<p>${catedto.address}</p>
<a href="/category/detail?licensenumber=${catedto.licensenumber }&email=${login.email}">
<img class="img_wrap" src="/user/showimg?realPath=${catedto.realPath}&realfilename=${frontimg}"/>
</a>
<input type="hidden" id="licensenumber" value="${catedto.licensenumber}">
		
		

	<c:choose>
	<c:when test="${catedto.badoom==1}">
	<input type="checkbox" id="badoom" onclick="insert(this,${catedto.licensenumber});" checked>
	<h3>바둠  ${catedto.badoomnum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="badoom" onclick="insert(this,${catedto.licensenumber}});">
	<h3>바둠  ${catedto.badoomnum}</h3>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${catedto.likee==1}">
	<input type="checkbox" id="like" onclike="insertlike(this,${catedto.licensenumber});" checked>
	<h3>좋아요  ${catedto.likenum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="like" onclike="insertlike(this,${catedto.licensenumber});">
	<h3>좋아요  ${catedto.likenum}</h3>
	</c:otherwise>
	</c:choose>
	
	<button type="submit" style="font-size:20px;">댓글 ${catedto.rownum }</button>
	<hr/>
		
	
</c:forEach>			
</div>
</body>
</html>