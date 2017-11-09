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
	getAllList();
	
	
});

function getAllList(){
	
	$.ajax({
		
		type:'get',
		url:'/community/personal',
		data:'email='+$('#email').val(),
		
		success:function(data){
		
			var str="";
			var login=$('#login').val();
			var email=$('#email').val();
		
			
			$(data).each(function(){
				
				if(login==email){
					//피드가 본인계정이면 
					
					str+="<a href='/community/personallist?email="+email+"'>"+this.nickname+"</a><br/>"
							+"<a href='/community/detail?communitybno="+this.communitybno+"&email="+this.email+"'>"
							+"<img class='img_wrap' src='/user/showimg?realPath="+this.realPath+"&realfilename="+this.realfilename+"'/>"
							+"</a><br/><p>";
							
							
							var hashtag=""+this.comment+"";
							var Arr=hashtag.split(' ');
						
							 for(var word in Arr)
							{
							  word = Arr[word];
							
							   if(word.indexOf('#') == 0) // # 문자를 찾는다.
							   { 
								

								      word= "<a href='/search/searchpage?keyword="+word.replace("#","")+"'>"+word+"</a>"; 
							
							   }
							   str += word+' ';
							   
							} 
								/* "<br><p onclick='hashtag(this);'>"+this.hashtag+"</p>"
							; */
							str+="</p>";
							
							if(this.privateor=="Y"){
								//비공개면
								str+="<img src='/resources/glyphicons/glyphicons-204-lock.png'/><hr/>";
							
							
							}
							if(this.badoom==1){
								//바둠에 체크가 되어있으면
								str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.communitybno+");' checked>"
										+"바둠"+this.badoomnum+"";
								
							}else{
								str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.communitybno+");'>"
								+"바둠"+this.badoomnum;
							}
							
							if(this.likee==1){
								
								str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.communitybno+");' checked>"
								+"좋아요"+this.likenum;
					
							}else{
								str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.communitybno+");'>"
								+"좋아요"+this.likenum;
					
								
							}
							
							str+="<button type='submit' style='font-size:20px;'>"
								+"댓글"+this.rownum+"</button>"
								+"<hr/>";
							
				}else{//본인 계정이 아니거나 세션이 없거나 
					if(this.privateor=='Y'){
						//비공개면
						str+="";
						
					}else if(this.privateor=="N"){
						//공개면
						str+="<a href='/community/personallist?email="+email+"'>"+this.nickname+"</a></br>"
						+"<a href='/community/detail?communitybno="+this.communitybno+"'>"
						+"<img class='img_wrap' src='/user/showimg?realPath="+this.realPath+"&realfilename="+this.realfilename+"'/>"
						+"</a><br/><p>";
						
						
						var hashtag=""+this.comment+"";
						var Arr=hashtag.split(' ');
					
						 for(var word in Arr)
						{
						  word = Arr[word];
						
						   if(word.indexOf('#') == 0) // # 문자를 찾는다.
						   { 
							

							      word= "<a href='/search/searchpage?keyword="+word.replace("#","")+"&email="+login+"'>"+word+"</a>"; 
						
						   }
						   str += word+' ';
						   
						} 
							/* "<br><p onclick='hashtag(this);'>"+this.hashtag+"</p>"
						; */
						str+="</p>";
						if(this.badoom==1){
							//바둠에 체크가 되어있으면
							str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.communitybno+");' checked>"
									+"바둠"+this.badoomnum+"";
							
						}else{
							str+= "<input type='checkbox' id='badoom' onclick='insert(this,"+this.communitybno+");'>"
							+"바둠"+this.badoomnum;
						}
						
						if(this.likee==1){
							
							str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.communitybno+");' checked>"
							+"좋아요"+this.likenum;
				
						}else{
							str+= "<input type='checkbox' id='like' onclick='insertlike(this,"+this.communitybno+");'>"
							+"좋아요"+this.likenum;
				
							
						}
						
						str+="<button type='submit' style='font-size:20px;'>"
							+"댓글"+this.rownum+"</button>"
							+"<hr/>";
						+"<hr/>";
						
					}
					
					
				}

				
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
         	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom',
         	
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
          	data:'communitybno='+y+'&email='+$('#login').val()+'&likebadoomcode=badoom',
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
</script>
</head>

<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">list</p>
<hr/>
<div id="form_style">
<h2>${email} 님의 개인공간</h2>
<div id="onoff">
</div>
 <input type="hidden" id="email" value="${email}">
 <input type="hidden" id="login" value="${login.email }">

</div>
</div>
</body>
</html>