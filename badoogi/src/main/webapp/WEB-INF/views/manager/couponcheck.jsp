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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	var coupon=$("#coupon").val();
	
	
	$('.btn').on("click",function(){
		
		
		var check=$("#check").val();

		if(coupon==check){
			$.ajax({
				contentType:'applicationn/json',
				type:'get',
				url:'/user/changestatus',
				data:'randomnum='+$("#randomnum").val()+"&email="+$("#email").val(),
			
			success:function(){
				alert("사용완료!");
				$("#frm").submit();
			}
			});
		}else{
			str="<h3 style='color:red;'>일치하지않습니다</h3>";
			$("#mention").html(str);	
			return false;
		}
		
	});
});

</script>
</head>
<body>

<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">직원확인</p>
<hr/>
<div id="form_style">

<br/><br/><br/>
<img src="/resources/glyphicons/glyphicons-204-lock.png"><input type="text" id="check">
<br/><br/><br/>
<form action="/user/mycoupon">
<button class="btn">완료</button>

<br/><br/><br/>
<h3>직원입력란입니다</h3>
<h6>결제시 직원에게 제시해주시길 바랍니다</h6>

<div id="mention"></div>

<input type="hidden" id="coupon" value="${coupon.cp_entnum }">
<!-- 인당 발부된 랜덤 번호 -->
<input type="hidden" id="randomnum" value="${randomnum }">
<input type="hidden" name="email" id="email" value="${login.email }">
</form>
</div>
</div>
</body>
</html>