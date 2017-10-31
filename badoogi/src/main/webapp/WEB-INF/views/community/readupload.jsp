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

	getreplylist();
	
	var privateor=$("#private").val();

	if(privateor=="Y"){//비공개면
		
		$("#cmn-toggle-1").prop("checked",true);//회색
		
	}else{//공개면
		$("#cmn-toggle-1").prop("checked",false);//분홍색
	}

	$("#cmn-toggle-1").click(function(){
		//버튼을 눌럿을때
		if($(this).prop('checked')){		//체크
			
			$.ajax({
				contentType:'application.json',
				type:'get',
				url:'/community/changeprivate',
				data:'communitybno='+$("#bno").val()+'&privateor=Y',
				
				success:function(){
				
					alert("비공개전환");
					  $("#cmn-toggle-1").prop("checked", true); //체크
					
				}
				
			});
	   
			}else{								//체크풀리면
				
				$.ajax({
					contentType:'application.json',
					type:'get',
					url:'/community/changeprivate',
					data:'communitybno='+$("#bno").val()+'&privateor=N',
					
					success:function(){
					
						alert("공개전환");
						 $("#cmn-toggle-1").prop("checked",false);    //체크풀기
					}
					
				});
		
		}
	});
	
	$('#replyAddBtn').on("click",function(){
		
		var email=$("#email").val();
		var reply=$("#reply").val();
		var communitybno=$("#bno").val();
		var replycode="community";
		
		$.ajax({
			contentType:'application.json',
			type:'get',
			url:'/reply/insertreply',
			data:'email='+email+'&reply='+reply+'&communitybno='+communitybno+'&replycode='+replycode,
			
			success:function(){
				
				alert("성공!");
				getreplylist();
			}
		});
		
		
	});
	
});

function getreplylist(){
	var replycode="community";
	$.ajax({
		url:'/reply/replylist/',
		type:'GET',
		data:'communitybno='+$('#bno').val()+'&replycode=community',
		success:function(data){

	var str="";
	//var str2="";
	
	//alert("!!!");

	$(data).each(
		
			function(){
			
				
			
			
			
				str+=	"<div style='height:150px;'>"
					+"<div style='width:150px; height:150px;  float:left;'>"
					+"<div style='width: 50px; height: 50px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;'>"
			
					;
					
					if(this.usercode=='cus'){
					 str+="<a href='/community/personallist?email="+this.email+"'>"+this.nickname+"</a>";
					}else if(this.usercode=='ent'){
						str+="<a href='/category/detail?licensenumber="+this.licensenumber+"'>"+this.nickname+"</a>";
							
						
					}
					str+="</div>"
					+"<h6>"+this.writedate+"</h6>	</div>"
					+"<div style=' height:150px;  float:left;'>"
					+"<p>"+this.reply+"</p></div></div></div>"
						+"<a href='/reply/replypage?replybno="+this.replybno+"'>댓글"+this.rownum+"</a>"
					
								;
						 
				 
					
				
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

<h3> <a href="/community/personallist?email=${commuvo.email}">${commuvo.nickname} )</a></h3> 
<input type="hidden" id="private" value="${commuvo.privateor }">
<c:choose>
<c:when test="${login.email==commuvo.email}">


<div class="switch" style="margin-left:600px;">
<h6>게시물 공개/비공개 </h6>
  <input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox" name="privateor" value="Y" >
  <label for="cmn-toggle-1"></label>
</div>

</c:when>
</c:choose>
<br/>

<input type="hidden" id="bno" value="${commuvo.communitybno}">
	<img class="img_wrap" src="/user/showimg?realPath=${commuvo.realPath}&realfilename=${commuvo.realfilename}">
	<br/>
	<c:choose>
	<c:when test="${commuvo.badoom==1}">
	<input type="checkbox" id="badoom" onclike="insert(this,${commuvo.communitybno });" checked>
	<h3>바둠  ${commuvo.badoomnum}</h3>
	</c:when>
	<c:otherwise>
	<input type="checkbox" id="badoom" onclike="insert(this,${commuvo.communitybno });">
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
<p>${commuvo.comment}</p>

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