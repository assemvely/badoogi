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
  width: 120px;
  height: 60px;
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
  width: 58px;
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
<p style="text-align:center;color:gray;font-size:20px;">업로드</p>
<hr/>
</div>
<form action="/community/upload" method="POST" enctype="multipart/form-data">
<div id="form_style">
<input type="hidden" name="email" value="${login.email}">
<input type="file" id="input_img" name="imageFile" > 
<div class="img_wrap">
	<img id="img">
</div>
<input type="hidden" name="savePath" value="C://badoogi//COMMUNITY/">
<textarea name="comment" rows=10px  placeholder="Write a caption..." cols=100px wrap="hard" name="comment"></textarea>

<h3>게시물 공개/비공개 </h3>
<div class="switch">
  <input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox" name="privateor" value="Y">
  <label for="cmn-toggle-1"></label>
</div>

<input type="hidden" name="usercode" value="${login.usercode }">
</div>

<div id="form_style" style="margin-top:40px;">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
완료
</button>
</div>
</form>

</body>
</html>