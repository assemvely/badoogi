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
	
	$('#replyAddBtn').on("click",function(){
		
		
		var email=$("#email").val();
		var reply=$("#reply").val();
		var replybno=$("#replybno").val();
	
		
		$.ajax({
			contentType:'application.json',
			type:'get',
			url:'/reply/insertsubreply',
			data:'email='+email+'&reply='+reply+'&replybno='+replybno,
			
			success:function(){
				
				alert("성공!");
				getreplylist();
			}
		});
		
		
	});
});


function getreplylist(){
	
	$.ajax({
		url:'/reply/rereplylist',
		type:'GET',
		data:'replybno='+$('#replybno').val(),
		success:function(data){

	var str="";
	//var str2="";
	
	//alert("!!!");

	$(data).each(
		
			function(){
			
				
			
			
			
				str+=	"<div style='height:150px;'>"
						+"<div style='width:150px; height:150px;  float:left;'>"
						+"<div style='width: 50px; height: 50px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;'>";
						
						if(this.usercode=='cus'){
						 str+="<a href='/community/personallist?email="+this.email+"'>"+this.nickname+"</a>";
						}else if(this.usercode=='ent'){
							str+="<a href='/category/detail?licensenumber="+this.licensenumber+"'>"+this.nickname+"</a>";
								
							
						}
						str+="</div>"
						+"<h6>"+this.writedate+"</h6>	</div>"
						+"<div style=' height:150px;  float:left;'>"
						+"<p>"+this.reply+"</p></div></div><hr/>";
						
				 
					
				
				//alert("str : " + str);
			});
	
	$("#replies").html(str);
	//$("#replies").html(str2);
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
<div style="height:150px;">
  <div style="width:150px; height:150px;  float:left;">
	<div style="width: 50px; height: 50px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;">
						<input type="hidden" id="replybno" name="replybno" value="${replyvo.replybno }">
						<a href="/community/personallist?email=${replyvo.email }">${replyvo.nickname }</a>
						</div>
						<h6>${replyvo.writedate }</h6>	
						</div>
						<div style="height:150px;  float:left;">
						<p>${replyvo.reply }</p></div></div>
						<hr/> 
				 

<input type="hidden" id="email" value="${login.email }">
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
</div>
</body>
</html>