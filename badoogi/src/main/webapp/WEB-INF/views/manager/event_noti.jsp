<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<head>
<script type="text/javascript"
	src="/resources/Editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<style>
#form_style{
align:center;
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
<title>JOIN PAGE</title>

<script type="text/javascript">
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smarteditor",
		//SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI : "/resources/Editor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {

			}
		},
		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["smarteditor"].exec("PASTE_HTML", [ "포스팅" ]);
		},
		fCreator : "createSEditor2"
	});

	$("#save").click(function() {
		
		oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
	})
	
	

});

$(document).ready(function(){


	var sel_file;

	$("#input_img").on("change",Imgfileselect);
	
	$("#ba").on("click",controlba(v,y));
});
function div_OnOff(v,y){
	
	
	document.getElementById(v).style.display = ""; 
	document.getElementById(y).style.display = "none"; 

}
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
<p style="text-align:center;color:gray;font-size:20px;">배너작성</p>
<hr/>

</div>

	<form id="frm" action="/manager/manageinsert" method="post"
			enctype="multipart/form-data">
			
<div id="form_style">
<h3>업로드 유형</h3>
<input type="radio" name="managecode" value="ba" id="ba" onclick="div_OnOff('Insertfront','Insertdate');">배너
 <input type="radio" name="managecode" value="event" id="ev" onclick="div_OnOff('Insertdate','Insertfront');">event
<input type="radio" name="managecode" value="noti" id="event" ">공지
<br/><br/><br/><br/>
<input type="text" name="title" placeholder="title" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">
<br/>
<div id="Insertfront" style="display:none">

<input type=file id="input_img" name="imageFile" > 
<div class="img_wrap">
	<img id="img">
</div>
<input type="hidden" name="savePath" value="C://badoogi//MANAGE/">

</div>
<div id="Insertdate" style="display:none">
<h4>시작일</h4><input type="date" name="startdate" placeholder= value="" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">
<h4>종료일</h4><input type="date" name="enddate" placeholder="종료일" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">
</div>


<br/>

<textarea rows="10" cols="30"
							id="smarteditor" name="smarteditor"
							style="width: 766px; height: 412px;"> 
				</textarea>

</div>
<div id="form_style" style="margin-top:40px;">
<button type="submit" id="save" name="btn"  class="btn" style="font-size:20px;">
완료
</button>
</div>
</form>


</body>
</html>