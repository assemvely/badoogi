<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style>
#form_profile{
align:center;
margin-top:150px;
margin-left:400px;
margin-bottom:80px;
margin-right:80px
}

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


body {
  padding: 1rem;
  color: hsla(215, 5%, 50%, 1);
}
h1 {
  color: hsla(215, 5%, 10%, 1);
  margin-bottom: 2rem;
}
section {
  display: flex;
  flex-flow: row wrap;
}
section > div {
  flex: 1;
  padding: 0.5rem;
}
input[type="checkbox"] {
  display: none;
  &:not(:disabled) ~ label {
    cursor: pointer;
  }
  &:disabled ~ label {
    color: #A9F5F2;
    border-color: #A9F5F2;
    box-shadow: none;
    cursor: not-allowed;
  }
}

label {
  height: 50%;
  display: block;
  background: white;
  border: 2px solid #A9F5F2;
  border-radius: 20px;
  padding: 1rem;
  margin-bottom: 1rem;
  //margin: 1rem;
  text-align: center;
  box-shadow: 0px 3px 10px -2px #A9F5F2;
  position: relative;
}
input[type="checkbox"]:checked + label {
  background: #A9F5F2;
  color: hsla(215, 0%, 100%, 1);
  box-shadow: 0px 0px 20px #A9F5F2;
  &::after {
    color:#A9F5F2;
    font-family: FontAwesome;
    border: 2px solid hsla(150, 75%, 45%, 1);
    content: "\f00c";
    font-size: 24px;
    position: absolute;
    top: -25px;
    left: 50%;
    transform: translateX(-50%);
    height: 50px;
    width: 50px;
    line-height: 50px;
    text-align: center;
    border-radius: 50%;
    background: white;
    box-shadow: 0px 2px 5px -2px hsla(0, 0%, 0%, 0.25);
  }
}

input[type="radio"]:checked + label {

p {
  font-weight: 900;
}


@media only screen and (max-width: 700px) {
  section {
    flex-direction: column;
  }
}
#jusosearch {
	align-items: flex-start;
	text-align: center;
	cursor: default;
	color: #ffffff;
	background-color: #d9534f;
	box-sizing: border-box;
	padding: 10px 16px;
	font-size: 14px;
	border-width: 2px;
	border-color: #d43f3a;
	border-style: none;
	border-radius: 6px;
}


input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: buttonface;
    box-sizing: border-box;
    padding: 16px 16px;
    border-width: 2px;
    border-style: solid;
    border-color: #d9534f;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/category/jusoPopup", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
	  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
		roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	
	document.form.address.value = roadFullAddr;

}


</script>
</head>
<body>

<p style="text-align:center;color:gray;font-size:20px;">업체등록</p>
<hr/>

<div style="text-align:center; margin-top:45px; margin-bottom:75px;">


<br/>
</div>

<form action="/category/ent_details" id="form" name="form">

<div id="form_style">
<input type="text" size="55" placeholder="업체이름등록" name="storename" style="font-size:19pt; border-radius:10px;margin-bottom:30px;">


<h3>도로명주소</h3>
<h3><input type="text" style="width: 500px; padding-left: 15px;" id="address" name="address" /> 
<input id="jusosearch" style="margin-left: 15px;" type="button" onClick="goPopup();" value="주소검색" /></h3>
										
<input type="text" size="55" placeholder="contact" name="contact" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">

<input type="text" size="55" placeholder="주말영업시간" name="weekend" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">

<input type="text" size="55" placeholder="주중영업시간" name="weekday" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">

<input type="text" size="55" placeholder="online 주소" name="domain" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">


<input type="text" size="55" placeholder="쿠폰인증4글자" name="cp_entnum" style="font-size:19pt;border-radius:10px;margin-bottom:30px;">
<input type="hidden" name="licensenumber" value="${login.licensenumber}">
<br/>
<p3>주차여부</p3>
<br/>
<input type="radio" name="parking" value="Y" >YES <input type="radio" name="parking" value="N" placeholder="N">no
<br/>
<br/>
<h2>편의 시설을 입력해주세요 </h2>
<p>중복가능</p>
<section style="width:800px;">
<div>
  <input type="checkbox" id="control_01" name="facility" value="BARBER" class="radio">
  <label for="control_01">
    <h2>PET barber</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_02" name="facility" value="HOTEL">
  <label for="control_02">
    <h2>PET HOTEL</h2>
  </label>
</div>
<div>
  <input type="checkbox" id="control_03" name="facility" value="PENSION">
  <label for="control_03">
    <h2>PET PENSION</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_04" name="facility" value="SCHOOL">
  <label for="control_04">
    <h2>PET SCHOOL</h2>
   
  </label>
</div>

<br/>

<div>
  <input type="checkbox" id="control_05" name="facility" value="CAFE">
  <label for="control_05">
    <h2>PET CAFE</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_06" name="facility" value="SHOP" class="radio">
  <label for="control_06">
    <h2>PET SHOP</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_07" name="facility" value="ADOPT" class="radio">
  <label for="control_07">
    <h2>PET ADOPTION</h2>
    
  </label>
</div>

</section>
</div>

</div>
<br/>
<br/>

<div id="form_style" style="margin-top:40px;">
<button type="submit" name="btn"  class="btn" style="font-size:20px;">
완료
</button>
</div>
</form>
</body>
</html>