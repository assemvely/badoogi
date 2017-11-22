<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<style>
#form_style{
aling:center;
margin-top:10px;
margin-left:570px;
margin-bottom:80px;

}

.btn{
width:560px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function showmodal(v){
	$.ajax({
		contentType:'application/json',
		type:'get',
		url:'/manager/incoupon',
		data:'couponbno='+v,
		
		
		success:function(data){
			
			str="";
			
			
			str+= "<h3>"+data.storename+"<h3>"
				+"<h4>"+data.address+"</h4><br/>"
				+"<img src='/user/showimg?realPath="+data.realPath+"&realfilename="+data.realfilename+"' alt='no images'>"
				+"<h3>"+data.benefit+"</h3><hr/>"
				+"<h3>유효기간"+data.startdate+"~"+data.enddate+"</h3>"
          			+"<h4>"+data.caution+"</h4>"
          			+"<input type='hidden' name='licensenumber' value='"+data.licensenumber+"'>"
          			;      
				

			$("#coupon").html(str);
			$("#myModal").modal('toggle');
		}
	});
}


</script>
</head>

<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">쿠폰 전체보기</p>
<hr/>

<div id="form_style">

<input type="hidden" name="email" value="${login.email}">
<form action="/manager/cptouser">
<c:forEach items="${uservo}"  var="uservo">

<br/>
<hr/>
<input type="hidden" name="couponbno" value="${couponbno }">
<input type="checkbox" name="email" value="${uservo.email }">
<img  src="/user/showimg?realPath=${uservo.realPath}&realfilename=${uservo.realfilename}"
                                 alt="no images" >
  <h3>${uservo.nickname}</h3>       
  <h4> ${uservo.email }</h4> <h6>${uservo.usercode}</h6>

 
 </c:forEach>
 <hr/>
 	<button class="btn">선택완료</button>
</form>
<c:forEach items="${entvo}"  var="entvo">
<div>
<br/>
<hr/>
<img  src="/user/showimg?realPath=${entvo.realPath}&realfilename=${entvo.realfilename}"
                                 alt="no images" >
  <h3>${entvo.nickname}</h3>       
  <h4> ${entvo.email }</h4> <h6>${entvo.usercode}</h6>
	<hr/>
  </div>
 </c:forEach>
 <br/>
</div>

</div>
</body>
</html>