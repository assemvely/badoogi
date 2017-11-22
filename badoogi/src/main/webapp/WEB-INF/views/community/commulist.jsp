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
.img_wrap{
width:700px;
margin-top:10px

}

.img_wrap img{
max-width:100%;
align:center;
}


.cmn-toggle {
  position: absolute;
  margin-left: -9999px;
  visibility: hidden;
}
.cmn-toggle + label {
  display: block;
  position: relative;
  cursor: pointer;
  outline: none;
  user-select: none;
}
input.cmn-toggle-round + label {
  padding: 2px;
  width: 100px;
  height: 20px;
  background-color: #dddddd;
  border-radius: 60px;
}
input.cmn-toggle-round + label:before,
input.cmn-toggle-round + label:after {
  display: block;
  position: absolute;
  top: 1px;
  left: 1px;
  bottom: 1px;
  content: "";
}
input.cmn-toggle-round + label:before {
  right: 1px;
  background-color: #FF0080;
  border-radius: 60px;
  transition: background 0.4s;
}
input.cmn-toggle-round + label:after {
  width: 40px;

  background-color: #fff;
  border-radius: 100%;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
  transition: margin 0.4s;
}
input.cmn-toggle-round:checked + label:before {
  background-color:#f1f1f1;
}
input.cmn-toggle-round:checked + label:after {
  margin-left: 60px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	
	hashtag();


});

function insert(v,y){

	 
	 if($("#login").val()==null){alert("로그인후 이용가능합니다."); return false;}else{
	 if($(v).prop("checked")){
		 
		    
	       $.ajax({
	         	contentType:'application.json',
	         	type:'get',
	         	url:'/likebadoom/insert',
	         	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom',
	         	
	         	success:function(){
	         		
	         	}
	         
	         });
	 	
	 }else{
		 

		  $.ajax({
	         	contentType:'application.json',
	         	type:'get',
	         	url:'/likebadoom/delete',
	          	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom',
	          	success:function(result){

	 					$("#badoomm").html($("#badoomm").val()-1);
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
		         	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=like',
		         	
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
		          	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=like',
		          	success:function(result){
		         		alert("성공");
		         		getlist();
		         	}
		         
		         });
		 }
		 }
		}

function hashtag(){
	var cols = document.querySelectorAll('#hashtag'); 
	 
	for( var i = 0; i < cols.length; i++ ){
		  var item = cols.item(i);
		var hashtag=item.innerHTML;
		
		var Arr=hashtag.split(' ');
		var str="";
		var email=$("#login").val();
		 for(var word in Arr)
		{
			
		  word = Arr[word];
		
		   if(word.indexOf('#') == 0) // # 문자를 찾는다.
		   { 
			

			      word= "<a href='/search/searchpage?keyword="+word.replace("#","")+"&email="+email+"'>"+word+"</a>"; 
		
		   }
		   str += word+' ';
		   
		} 
			/* "<br><p onclick='hashtag(this);'>"+this.hashtag+"</p>"
		; */
		
		item.innerHTML = str;
	}


}



</script>
</head>

<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<div id="form_style">

<form action="/search/searchpage">
<input type="hidden" id="login" name="email" value="${login.email}">
<input type="text" id="commusearch" name="keyword" style="width:700px;height:55px;" value="${dto}" placeholder="#검색어를 입력해주세요"><button class="btn">검색</button>

</form>

<c:forEach items="${commuvo}" var="commuvo">


<h3> <a href="/community/personallist?email=${commuvo.email}">${commuvo.nickname} )</a></h3> 
<input type="hidden" id="private" value="${commuvo.privateor }">

<br/>

<input type="hidden" id="bno" value="${commuvo.communitybno}">
<a href="/community/detail?communitybno=${commuvo.communitybno}&email=${login.email}">
	<img class="img_wrap" src="/user/showimg?realPath=${commuvo.realPath}&realfilename=${commuvo.realfilename}">
	</a>
	<br/>
	

	<div id="hashtag" >${commuvo.comment}</div>
	
	
	
<%-- 	<c:choose>
	<c:when test="${commuvo.privateor=='Y' }">
	<img src="/resources/glyphicons/glyphicons-204-lock.png"><hr/>
							
	</c:when>
	</c:choose> --%>
	<c:choose>
	<c:when test="${commuvo.badoom==1}">
	<input type="checkbox" id="badoom" onclick="insert(this,${commuvo.communitybno });" checked>
	<h3>바둠  ${commuvo.badoomnum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="badoom" onclick="insert(this,${commuvo.communitybno });">
	<h3>바둠  ${commuvo.badoomnum}</h3>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${commuvo.likee==1}">
	<input type="checkbox" id="like" onclike="insertlike(this,${commuvo.communitybno });" checked>
	<h3>좋아요  ${commuvo.likenum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="like" onclike="insertlike(this,${commuvo.communitybno });">
	<h3>좋아요  ${commuvo.likenum}</h3>
	</c:otherwise>
	</c:choose>
	
	<button type="submit" style="font-size:20px;">댓글 ${commuvo.rownum }</button>
	<hr/>


</c:forEach>
</div>
</div>
</body>
</html>