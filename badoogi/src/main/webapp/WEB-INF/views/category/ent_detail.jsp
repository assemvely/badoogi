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
<script type="text/javascript">
$(document).ready(function(){
	getreplylist();
	hashtag();
	
	$('#replyAddBtn').on("click",function(){
		
		var email=$("#email").val();
		var reply=$("#reply").val();
		var licensenumber=$("#licensenumber").val();
		var replycode="category";
		var communitybno="1";//아무 숫자 communitybno에있는 ㄱㅣ본숫자 어차피 안쓰기떄문에
		
		$.ajax({
			contentType:'application.json',
			type:'get',
			url:'/reply/insertreply',
			data:'email='+email+'&reply='+reply+'&licensenumber='+licensenumber+'&replycode='+replycode+'&communitybno='+communitybno,
			
			success:function(){
				
				alert("성공!");
				getreplylist();
			}
		});
		
		
	});
});

function getreplylist(){
	var replycode="category";
	$.ajax({
		url:'/reply/replylist/',
		type:'GET',
		data:'licensenumber='+$('#licensenumber').val()+'&replycode=category',
		success:function(data){

	var str="";
	//var str2="";
	
	//alert("!!!");
	
	$(data).each(
		
			function(){
			
				
			
			
			
				str+=	"<div style='height:150px;'>"
					+"<div style='width:150px; height:150px;  float:left;'>"
					+"<div style='width: 50px; height: 50px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;'>";
					
					if(this.usercode='cus'){
					 str+="<a href='/community/personallist?email="+this.email+"'>"+this.nickname+"</a>";
					}else if(this.usercode='ent'){
						str+="<a href='/category/detail?licensenumber="+this.licensenumber+"'>"+this.nickname+"</a>";
							
						
					}
					str+="</div>"
					+"<h6>"+this.writedate+"</h6>	</div>"
					+"<div style=' height:150px;  float:left;'>"
					+"<p>"+this.reply+"</p></div></div>"
						+"<a href='/reply/replypage?replybno="+this.replybno+"'>댓글"+this.rownum+"</a>";
				 
					
				
				//alert("str : " + str);
			});
	
	$("#replies").html(str);
	//$("#replies").html(str2);
		}
	});
	
}



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

function hashtag(){
	
	var hashtag=document.getElementById("hashtag").innerHTML;

	var Arr=hashtag.split(' ');
	var str="";
	
	 for(var word in Arr)
	{
		
	  word = Arr[word];
	
	   if(word.indexOf('#') == 0) // # 문자를 찾는다.
	   { 
		
	      word= "<a href='/'>"+word+"</a>"; 
	   }
	   str += word+' ';
	   
	} 
		/* "<br><p onclick='hashtag(this);'>"+this.hashtag+"</p>"
	; */
	
	document.getElementById("hashtag").innerHTML = str;
}
</script>
</head>
<body>

<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">${DETAIL.storename}</p>
<hr/>
<br/>
<br/><br/>
<hr/>

<img class="img_wrap" src="/user/showimg?realPath=${DETAIL.realPath}&realfilename=${DETAIL.frontimg}">
<BR/>

<c:choose>
	<c:when test="${DETAIL.badoom==1}">
	<input type="checkbox" id="badoom" onclike="insert(this,${DETAIL.licensenumber});" checked>
	<h3>바둠  ${DETAIL.badoomnum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="badoom" onclike="insert(this,${cDETAIL.licensenumber});">
	<h3>바둠  ${DETAIL.badoomnum}</h3>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${DETAIL.likee==1}">
	<input type="checkbox" id="like" onclike="insertlike(this,${DETAIL.licensenumber});" checked>
	<h3>좋아요  ${DETAIL.likenum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="like" onclike="insertlike(this,${DETAIL.licensenumber});">
	<h3>좋아요  ${DETAIL.likenum}</h3>
	</c:otherwise>
	</c:choose>
	
	<button type="submit" style="font-size:20px;">댓글 ${DETAIL.rownum }</button>
	<hr/>
<h2>기본정보</h2>
<h4>address ${DETAIL.address}</h4>
<c:choose>
<c:when test="${not empty DETAIL.parking}">
<h4>주차가능</h4>
</c:when>
</c:choose>
<br/>
<h4>주중 ::: ${DETAIL.weekday} 주말:::${DETAIL.weekend }</h4>
<br/>
<h4>contact ${DETAIL.contact }</h4>
<h4><a href="http://${DETAIL.domain}" target="_blank">${DETAIL.domain }</a></h4>

<hr/>
<h2>편의시설</h2>
<c:forEach items="${FACILITY}" var="facility">
<p>${facility.facility}</p>
</c:forEach>
<h2>comment</h2>
<p>${DETAIL.comment}</p>
<hr/>
<h2>이용가이드</h2>
<p>${DETAIL.guide }</p>
<hr/>
<h2>확인사항</h2>
<p>${DETAIL.precaution}</p>
<input type="hidden" id="email" value="${login.email }">
<input type="hidden" id="licensenumber" value="${DETAIL.licensenumber}">
<hr/>

<div id="hashtag">${DETAIL.hashtag }</div>
<hr/>
<div id="replies"></div>


<c:choose>
<c:when test="${login==null }">
<h4>댓글을 달기위해 로그인해주세요!</h4>
</c:when>
<c:otherwise>
<table border="1">
			<td>
				<div
					style="width: 100px; height: 100px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;"
					title="Captain Slow">
					<h3>${login.nickname}</h3>
				</div>
			</td>
			<td>${login.nickname}</td>

			<td><textarea rows="5" cols="70" id="reply" name="reply" /></textarea> </pre></td>
			
			<td><button id="replyAddBtn">ADD REPLY</button></td>
			
			</table>
			
</c:otherwise>
</c:choose>		
</div>
</body>
</html>