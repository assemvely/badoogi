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
	
	
	getAlllist();
});
function getAlllist(){
	
	var login=$("#login").val();
	$.ajax({
		
		type:'get',
		url:'/category/getlist',
		data:'category='+$("#category").val()+'&email='+$("#login").val(),
		

		success:function(data){
			
			var str="";
			
		
			$(data).each(function(){
				
					//피드가 본인계정이면 
					
					str+="<h3>"+this.storename+"</h3><br/>"
							+"<p>"+this.address+"</p>"+"<a href='/category/detail?licensenumber="+this.licensenumber+"&email="+$("#login").val()+"'>"
							+"<img class='img_wrap' src='/user/showimg?realPath="+this.realPath+"&realfilename="+this.frontimg+"'/>"
							+"</a>"
							+"<input type='hidden' id='licensenumber' value='"+this.licensenumber+"'><br/><p>";
							
							var hashtag=""+this.hashtag+"";
							var Arr=hashtag.split(' ');
						
							 for(var word in Arr)
							{
							  word = Arr[word];
						
							   if(word.indexOf('#') == 0) // # 문자를 찾는다.
							   { 
								
								   word= "<a href='/search/catehash?keyword="+word.replace("#","")+"&email="+login+"'>"+word+"</a>"; 
									 }
							   str += word+' ';
							   
							} 
								/* "<br><p onclick='hashtag(this);'>"+this.hashtag+"</p>"
							; */
							str+="</p>";
					
							if(this.badoom==1){
								//바둠에 체크가 되어있으면
								str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.licensenumber+");' checked>"
										+"바둠"+this.badoomnum+"";
								
							}else{
								str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.licensenumber+");'>"
								+"바둠"+this.badoomnum;
							}
							
							if(this.likee==1){
								
								str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.licensenumber+");' checked>"
								+"좋아요"+this.likenum;
					
							}else{
								str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.licensenumber+");'>"
								+"좋아요"+this.likenum;
					
								
							}
							
							str+="<button type='submit' style='font-size:20px;'>"
								+"댓글"+this.rownum+"</button>"
								+"<hr/>";
							
				

				
			});
			
			$("#onoff").html(str);
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
</script>
</head>

<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<div id="form_style">

<input type="hidden" id="category" value="${catelist.category }">
<input type="hidden" id="login" value="${login.email }">
<div id="onoff"></div>
</div>
</div>
</body>
</html>