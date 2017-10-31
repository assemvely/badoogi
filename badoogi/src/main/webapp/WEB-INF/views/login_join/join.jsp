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
width:300px;
margin-top:50px

}

.img_wrap img{
max-width:100%;
align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JOIN PAGE</title>


</head>
<script type="text/javascript">

$(document).ready(function() { 

	$("#nickInput").on("keyup",function() {
	
		
		$.ajax({
			contentType:'application/json',
			type:'get',
			url:'/check/nickoverlap',
			data:'nickname='+$("#nickInput").val(),
			
			success:function(data){
				var str="";
			
				if(data!=""){
					
					str+="<li style='color:#FE2E2E;'>you can't use this nickname</li>";
					
				}else{
					
					str+="<li style='color:#01DF01;'>you can use this nickname</li>";
				}
			
				$('#nickconform').html(str);
			}
		});
	
	});
	

	$("#emailInput").on("keyup",function() {
	
		
		$.ajax({
			contentType:'application/json',
			type:'get',
			url:'/check/emailoverlap',
			data:'email='+$("#emailInput").val(),
			
			success:function(data){
				var str="";
			
				if(data!=""){
					
					str+="<li style='color:#FE2E2E;'>you can't use this email</li>";
					
				}else{
					
					str+="<li style='color:#01DF01;'>you can use this email</li>";
				}
			
				$('#emailconform').html(str);
			}
		});
	
	});
	
	var sel_file;

	$("#input_img").on("change",Imgfileselect);
		

});

	function Imgfileselect(e){
		
	
		var files=e.target.files;
		var filesArr=Array.prototype.slice.call(files);

		filesArr.forEach(function(f){
		 
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}

		sel_file=f;

		var reader=new FileReader();
		reader.onload=function(e){
		$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
		});
		

	}
		
	


</script>
<body>


<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">회원가입</p>
<hr/>

</div>
<form id="frm" action="/user/join" method="POST" enctype="multipart/form-data">

<div style="text-align:center; margin-top:45px; margin-bottom:75px;">



<input type=file id="input_img" name='imageFile' > 
<div class="img_wrap">
	<img id="img">
</div>
<input type="hidden" name="savePath" value="C://badoogi//USERIMG/">
<br/>
<br/>
<p3>프로필 사진</p3>

<br/>
</div>

<div id="form_style">
<input id="nickInput" type="text" size="55" placeholder="닉네임입력" name="nickname" style="font-size:19pt; border-radius:10px;">
<br/>
<h5 id="nickconform"></h5>

<input id="emailInput" type="text" size="55" placeholder="badugi@naver.com" name="email" style="font-size:19pt;border-radius:10px;margin-bottom:10px;">
<br/>
<h5 id="emailconform"></h5>

<input type="password" size="55" placeholder="특수문자 1개 이상을 포함한 영문 8~16자리" name="pw" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">
<input type="hidden" name="usercode" value="cus">
<input type="hidden" name="certify" value="y">
<br/>
<input type="checkbox" name="chk1" value="service">서비스약관
<br/>
<input type="checkbox" name="chk2" value="info">개인정보 취급방침
<br/>
<input type="checkbox" name="chk3" value="loca">위치기반서비스 이용약관
<br/>
</div>
<p style="text-align:center">정확하지 않은 이메일 주소는<br/>
계정삭제 및 이벤트, 쿠폰등의 혜택에서 제한될 수 있습니다. </p>
<div id="form_style" style="margin-top:40px;">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
완료
</button>
</div>
</form>
</body>
</html>