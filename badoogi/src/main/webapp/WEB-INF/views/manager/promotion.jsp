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
width:600px;
margin-top:70px

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
</head>
<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">기획전작성</p>
<hr/>

</div>
<div id="form_style">
<form id="frm" action="/manager/promotion" method="post"
			enctype="multipart/form-data">

<h3>기획전 이미지를 넣어주세요! </h3>
<input type=file id="input_img" name="imageFile" > 
<div class="img_wrap">
	<img id="img">
</div>
<input type="hidden" name="savePath" value="C://badoogi//MANAGE/">

<button type="submit" id="save" name="btn"  class="btn" style="font-size:20px;">
완료
</button>
</form>
</div>

</body>
</html>