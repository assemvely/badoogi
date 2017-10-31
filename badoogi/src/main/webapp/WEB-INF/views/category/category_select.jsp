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

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.radio').click(function(){
		//radio가 눌렸으면
		if($(this).prop('checked')){		//체크되어있ㅇ면
	     $('input[type="checkbox"]').not(this).prop("checked", false); //체크풀기
		 $('input[type="checkbox"]').not(this).prop("disabled",true);  //나머지 선택불가
		}else{								//체크풀리면
		 $('input[type="checkbox"]').not(this).prop("disabled",false);    //선택불기가 풀기
		}
	});
	

	
});

</script>
<body>


<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">카테고리선택</p>
<hr/>

</div>
<br/>
<br/>
<br/>
<br/>
<p>해당하는 카테고리를 선택해 주세요</p>
<P >병원,유기견입양업체와 애완용품 카테고리는 중복불가합니다.<P>
<form action="/category/regist_place">
<section>
<div>
  <input type="checkbox" id="control_01" name="category" value="HOSPITAL" class="radio">
  <label for="control_01">
    <h2>PET HOSPITAL</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_02" name="category" value="HOTEL">
  <label for="control_02">
    <h2>PET HOTEL</h2>
  </label>
</div>
<div>
  <input type="checkbox" id="control_03" name="category" value="PENSION">
  <label for="control_03">
    <h2>PET PENSION</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_04" name="category" value="SCHOOL">
  <label for="control_04">
    <h2>PET SCHOOL</h2>
   
  </label>
</div>
<div>
  <input type="checkbox" id="control_05" name="category" value="CAFE">
  <label for="control_05">
    <h2>PET CAFE</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_06" name="category" value="SHOP" class="radio">
  <label for="control_06">
    <h2>PET SHOP</h2>
    
  </label>
</div>
<div>
  <input type="checkbox" id="control_07" name="category" value="ADOPT" class="radio">
  <label for="control_07">
    <h2>PET ADOPTION</h2>
    
  </label>
</div>
</section>
<br/>
<br/>
<br/>

<button type="submit" name="btn"  class="btn" style="font-size:20px;">
next page
</button>

</form>
</body>
</html>