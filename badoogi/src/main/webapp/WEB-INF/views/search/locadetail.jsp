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
margin-right:570px;
}
.btn{
width:250px;
height:100px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
.realbtn{
width:750px;
height:60px;
background-color:#FACC2E;
border:1x solid #FACC2E;
}
.locabtn{
width:250px;
height:100px;
background-color:white;
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
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	var location=$("#first").val();

	 document.getElementById(location).style.display="";
	
	 
	 var area0 = ["서울전체"];
	  var area1 = ["강남 전체","개포동","논현동","대치동","도곡동","삼성동","세곡동","수서동","신사동","압구정동","역삼동","율현동","일원동","자곡동","청담동"];
	   var area2 = ["강동전체","강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동","천호동"];
	   var area3 = ["강북 전체","미아동","번동","삼각산동","상암동","송중동","송천동","수유동","우이동","인수동"];
	   var area4 = ["강서전체","가양동","개화동","공항동","과해동","내발산동","등촌동","마곡동","방화동","염창동","오곡동","오쇠동","외발산동","우장산동","화곡동"];
	   var area5 = ["관악 전체","낙성대동","난곡동","난향동","남현동","대학동","미성동","보라매동","봉천동","삼성동","서림동","서원동","성현동","신림동","신사동","신원동","은천동","인헌동","조원동","중앙동","청룡동","청림동","행운동"];
	   var area6 = ["광진 전체","광장동","구의동","군자동","능동","자양동","중곡동","화양동"];
	   var area7 = ["구로구전체","가리봉동","개봉동","고척동","구로동","궁동","신도림동","오류동","온수동","천왕동","항동"];
	   var area8 = ["금천구전체","가산동","독산동","시흥동"];
	   var area9 = ["노원구전체","공릉동","상계동","월계동","중계동","학계동"];
	   var area10 = ["도봉구전체","도봉동","방학동","쌍문동","창동"];
	   var area11 = ["동대문구전체","답십리동","신설동","용두동","이문동","장안동","전농동","제기동","청량리동","회기동","휘경동"];
	   var area12 = ["동작구전체","노량진동","대방동","동작동","본동","사당동","상도동","신대방동","흑석동"];
	   var area13 = ["마포구전체","공덕동","구수동","노고산동","당인동","대흥동","도화동","동교동","마포동","망원동","상수동","상암동","서교동","성산동","신공덕동","신수동","신정동","아현동","연남동","염리동","용강동","중동","창전동","토정동","하중동","합정동","현석동"];
	   var area14 = ["서대문구전체","남가좌동","냉천동","대신동","대현동","미근동","봉원동","북가좌동","북아현동","신촌동","연희동","영천동","옥천동","창천동","천영동","충정로2가","충정로3가","합동","현저동","홍은동","홍제동"];
	   var area15 = ["서초구전체","내곡동","반포동","방배동","서초동","신원동","양재동","염곡동","우면동","원지동","잠원동"];
	   var area16 = ["성동구전체","금호동1가","금호동2가","금호동3가","금호동4가","도선동","마장동","사근동","상왕십리동","성수동1가","성수동2가","송정동","옥수동","왕십리2동","용답동","응봉동","하왕십리동","행당동","홍익동"];
	   var area17=["성북구전체","길음동","돈암동","동선동1가","동선동2가","동선동3가","동선동4가","동선동5가","동소문동1가","동소문가2가","동소문동3가","동소문동4가","동소문동5가","동소문동6가","동소문동7가","보문동1가","보문동2가","보문동3가","보문동4가","보문동 5가","보문동6가","보문동7가","삼선동1가","삼선동2가","삼선동3가","삼선동4가","삼선동5가","상월곡동","석관동","성북동","성북동1가","안암동1가","안암동2가","안암동3가","안암동4가","안암동5가","월곡1동","월곡2동","장위동","정릉동","종암동","하월곡동"];
	   var area18=["송파구전체","가락동","거여동","마천동","문정동","방이동","삼전동","석촌동","송파동","신천동","오금동","오륜동","잠실동","장지동","풍납동"];
	   var area19=["양천구전체","목동","신월동","신정동"];
	   var area20=["영등포구전체","당산동","당산동1가","당산동2가","당산동3가","당산동4가","당산동5가","당산동6가","대림동","도림동","문래동","문래동1가","문래동2가","문래동3가","문래동4가","문래동5가","문래동6가","신길동","양평동","양평동1가","양평동2가","양평동3가","양평동4가","양평동5가","양평동6가","양화동","여의도동","영등포동","영등포동1가","영동포동2가","영등포동3가","영등포동4가","영등포동5가","영등포동6가","영등포동7기","영등포동8가"];
	   var area21=["용산구전체","갈월동","남영동","도원동","동빙고동","동자동","문배동","보광동","산천동","서계동","서빙고동","신계동","신창동","용문동","용산동1가","용산동2가","용산동3가","용산동4가","용산동5가","용산동6가","원효로1가","원효로2가","원효료3가","원효로4가","이촌동","이태원동","주성동","청암동","청파동1가","청파동2가","청파동3가","한강로1가","한강로2가","한강로3가","한남동","효창동","후암동"];
	   var area22=["은평구전체","갈현동","구산동","녹번동","대조동","불광동","수색동","신사동","역촌동","응암동","증산동","진관동"];
	   var area23=["종로구전체","가회동","견지동","경운동","계동","공평동","관수동","관철동","관훈동","교남동","교북동","구기동","궁정동","권농동","낙원동","내수동","내자동","누상동","누하동","당주동","도렴동","돈의동","동숭동","명륜1가","명륜2가","명륜3가","명륜4가","묘동","무악동","봉익동","부암동","사간동","사직동","삼청동","서린동","세종로","소격동","송월동","송현동","수송동","숭인동","신교동","신문로1가","신문로2가","신영동","안국동","연건동","연지동","예지동","옥인동","와룡동","운니동","원남동","원서동","이화동","익선동","인사동","인의동","장사동","재동","적선동","종로1가","종로2가","종로3가","종로4가","종로5가","종로6가","중학동","창성동","창신동","청운동","청진동","체부동","충신동","통의동","통인동","팔판동","평동","평창동","필운동","행촌동","혜화동","홍지동","홍파동","훈정동"];
	   var area24=["중구전체","광희동1가","광희동2가","남대문로1가","남대문로2가","남대문로3가","남대문로4가","남대문로5가","남산동1가","남산동2가","남산동3가","남창동","남학동","다동","만리동1가","만리동2가","명동1가","명동2가","무교동","무학동","묵정동","방산동","봉래동1가","봉래동2가","북창동","산림동","삼각동","서소문동","소공동","수표동","수하동","순화동","신당동","쌍림동","예관동","예장동","오장동","을지로1가","을지로2가","을지로3가","을지로4가","을지로5가","을지로6가","을지로7가","의주로1가","의주로2가","인현동1가","입정동","장교동","장충동1가","장충동2가","저동1가","저동2가","정동","주교동","주자동","중림동","초동","충무로1가","충무로2가","충무로3가","충무로4가","충무로5가","충정로1가","태평로1가","태평로2가","필동1가","필동2가","필동3가","황학동","회현동1가","회현동2가","회현동3가","흥인동"];
	   var area25=["중랑구전체","망우동","면목동","목동","상봉동","신내동"];
	
	 // 시/도 선택 박스 초기화
	/*  $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	 
	 // 시/도 선택시 구/군 설정
	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화
	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
 */
 
 	$('.locabtn').click(function(){
 		
 		var area="area"+document.getElementById(this.getAttribute('id')).getAttribute('id');
 		
 		$('#allbtn').empty();
 		var str="";
 		$.each(eval(area),function(){
 			
 			str+="<input type='checkbox' id='chk' value='"+this+"'>"+this+"";
 		
 		});
 		
 		$('#allbtn').html(str)
 	});
 
 
	 	$('#chk').change(function(){
	 		var count="1";
	 		if($(this).prop("checked")){
	 			count++;
	 			if(count>5){
	 				alert("5개까지 선택가능합니다");
	 				return false;
	 			}
	 		}else{
	 			count--;
	 		}
	 	});
	 	
	 	$('#btn2').on("click",function(){
	 		window.location.reload(true);

	 		
	 	});
	 	
	
});


</script>

</head>
<body>
<div class="form-group" margin-top: 5px; ">
<p style="text-align:center;color:gray;font-size:20px;">지역별검색</p>

</div>
<hr/>
<div id="form_style">
<a href="/search/location"><button id="btn1" class="btn" >시/도</button></a>
<button id="btn2" class="btn" >시/군/구</button>
<button id="btn3" class="btn" >읍/면/동</button>
<p>5개까지 선택가능합니다</p><h3 id="mygps" style="margin-left:600px;"><a href="/search/mygps?email=${login.email}"><img src="/resources/glyphicons/glyphicons-243-map-marker.png">현재위치</a></h3>
<hr/>
<br/>
<br/>
<br/>

<form action="/search/catesearch">
<input type="hidden" id="email" value="${login.email }">
<input type="hidden" id="first" value="${location}">

<div id="allbtn">
<div id="seoul" style="display:none">
<button class="locabtn" id="0" >전체</button>
<button class="locabtn" id="1">강남구</button>
<button class="locabtn" id="2">강동구</button>
<button class="locabtn" id="3">강북구</button>
<button class="locabtn" id="4">강서구</button>
<button class="locabtn" id="5">관악구</button>
<button class="locabtn" id="6">광진구</button>
<button class="locabtn" id="7">구로구</button>
<button class="locabtn" id="8">금천구</button>
<button class="locabtn" id="9">노원구</button>
<button class="locabtn" id="10">도봉구</button>
<button class="locabtn" id="11">동대문구</button>
<button class="locabtn" id="12">동작구</button>
<button class="locabtn" id="13">마포구</button>
<button class="locabtn" id="14">서대문구</button>
<button class="locabtn" id="15">송파구</button>
<button class="locabtn" id="16">양천구</button>
<button class="locabtn" id="17">영등포구</button>
<button class="locabtn" id="18">용산구</button>
<button class="locabtn" id="29">은평구</button>
<button class="locabtn" id="30">종로구</button>
<button class="locabtn" id="31">중구</button>
<button class="locabtn" id="32">중량구</button>
</div>

<div id="gyeonggi" style="display:none">
<button class="locabtn" id="1">경기전체</button>
<button class="locabtn" id="2">가평군</button>
<button class="locabtn" id="3">고양시 덕양구</button>
<button class="locabtn" id="4">고양시 일산동구</button>
<button class="locabtn" id="5">고양시 일산서구</button>
<button class="locabtn" id="6">과천시</button>
<button class="locabtn" id="7">광명시</button>
<button class="locabtn" id="8">광주시</button>
<button class="locabtn" id="9">구리시</button>
<button class="locabtn" id="10">군포시</button>
<button class="locabtn" id="11">김포시</button>
<button class="locabtn" id="12">남양주시</button>
<button class="locabtn" id="13">동두천시</button>
<button class="locabtn" id="14">부천시</button>
<button class="locabtn" id="15">성남시 분당구</button>
<button class="locabtn" id="16">성남시 수정구</button>
<button class="locabtn" id="17">성남시 중원구</button>
<button class="locabtn" id="17">수원시 권선구</button>
<button class="locabtn" id="18">수원시 영통구</button>
<button class="locabtn" id="19">수원시 장안구</button>
<button class="locabtn" id="20">수원시 팔달구</button>
<button class="locabtn" id="21">시흥시</button>
<button class="locabtn" id="22">안산시 단원군</button>
<button class="locabtn" id="23">안산기 상록구</button>
<button class="locabtn" id="24">안성시</button>
<button class="locabtn" id="25">안양시 동안구</button>
<button class="locabtn" id="26">안양시 만안구</button>
<button class="locabtn" id="27">양주시</button>
<button class="locabtn" id="28">양평군</button>
<button class="locabtn" id="29">여주시</button>
<button class="locabtn" id="30">연천군</button>
<button class="locabtn" id="31">오산시</button>
<button class="locabtn" id="32">용인시 기흥구</button>
<button class="locabtn" id="33">용인시 수지구</button>
<button class="locabtn" id="34">용인시 처인구</button>
<button class="locabtn" id="35">의왕시</button>
<button class="locabtn" id="36">의정부시</button>
<button class="locabtn" id="37">이천시</button>
<button class="locabtn" id="38">파주시</button>
<button class="locabtn" id="39">평택시 </button>
<button class="locabtn" id="40">포천시</button>
<button class="locabtn" id="41">하남시</button>
<button class="locabtn" id="42">화성시</button>
</div>


<div id="Inchon" style="display:none">
<button class="locabtn" id="1">인천 전체</button>
<button class="locabtn" id="2">강화구</button>
<button class="locabtn" id="3">계양구</button>
<button class="locabtn" id="4">남구</button>
<button class="locabtn" id="5">남동구</button>
<button class="locabtn" id="6">동구</button>
<button class="locabtn" id="7">부평군</button>
<button class="locabtn" id="8">서구</button>
<button class="locabtn" id="9">연수구</button>
<button class="locabtn" id="10">옹진구</button>
<button class="locabtn" id="11">중구</button>
</div>


<div id="busan" style="display:none">
<button class="locabtn" id="1">부산 전체</button>
<button class="locabtn" id="2">강서구</button>
<button class="locabtn" id="3">금정구</button>
<button class="locabtn" id="4">기장구</button>
<button class="locabtn" id="5">남구</button>
<button class="locabtn" id="6">동구</button>
<button class="locabtn" id="7">동래구</button>
<button class="locabtn" id="8">부산진구</button>
<button class="locabtn" id="9">북구</button>
<button class="locabtn" id="10">사상구</button>
<button class="locabtn" id="11">사하구</button>
<button class="locabtn" id="12">서구</button>
<button class="locabtn" id="13">수영구</button>
<button class="locabtn" id="14">연제구</button>
<button class="locabtn" id="15">영도구</button>
<button class="locabtn" id="16">중구</button>
<button class="locabtn" id="17">해운대구</button>
</div>

<div id="deagu" style="display:none">
<button class="locabtn" id="1">대구 전체</button>
<button class="locabtn" id="2">남구</button>
<button class="locabtn" id="3">달서구</button>
<button class="locabtn" id="4">달성군</button>
<button class="locabtn" id="5">동군</button>
<button class="locabtn" id="6">북구</button>
<button class="locabtn" id="7">서구</button>
<button class="locabtn" id="8">수성구</button>
<button class="locabtn" id="9">중구</button>
</div>

<div id="deajeon" style="display:none">
<button class="locabtn" id="1">대전 전체</button>
<button class="locabtn" id="2">대덕구</button>
<button class="locabtn" id="3">동구</button>
<button class="locabtn" id="4">서구</button>
<button class="locabtn" id="5">유성구</button>
<button class="locabtn" id="6">중구</button>
</div>
<div id="gyeongnam" style="display:none">
<button class="locabtn" id="1">경남전체</button>
<button class="locabtn" id="2">거제시</button>
<button class="locabtn" id="3">거창군</button>
<button class="locabtn" id="4">고성군</button>
<button class="locabtn" id="5">김해시</button>
<button class="locabtn" id="6">남해군</button>
<button class="locabtn" id="7">밀양시</button>
<button class="locabtn" id="8">사천시</button>
<button class="locabtn" id="9">산청군</button>
<button class="locabtn" id="10">양산시</button>
<button class="locabtn" id="11">의령군</button>
<button class="locabtn" id="12">진주시</button>
<button class="locabtn" id="13">창녕구</button>
<button class="locabtn" id="14">창원시 마산합포구</button>
<button class="locabtn" id="15">창원시 마산회원구</button>
<button class="locabtn" id="16">창원시 성산구</button>
<button class="locabtn" id="17">창원시 의창구</button>
<button class="locabtn" id="18">창원시 진해구</button>
<button class="locabtn" id="19">통영시</button>
<button class="locabtn" id="20">하동군</button>
<button class="locabtn" id="21">함안군</button>
<button class="locabtn" id="22">함양군</button>
<button class="locabtn" id="23">합천군</button>
</div>

<div id="jeonnam" style="display:none"> 
<button class="locabtn" id="1">전남전체</button>
<button class="locabtn" id="2">강진군</button>
<button class="locabtn" id="3">고흥군</button>
<button class="locabtn" id="4">곡성군</button>
<button class="locabtn" id="5">광양시</button>
<button class="locabtn" id="6">구례군</button>
<button class="locabtn" id="7">나주시</button>
<button class="locabtn" id="8">담양군</button>
<button class="locabtn" id="9">목포시</button>
<button class="locabtn" id="10">무안군</button>
<button class="locabtn" id="21">보성시</button>
<button class="locabtn" id="22">순천시</button>
<button class="locabtn" id="23">신안구</button>
<button class="locabtn" id="24">여수시</button>
<button class="locabtn" id="25">영광군</button>
<button class="locabtn" id="26">영암군</button>
<button class="locabtn" id="27">완도군</button>
<button class="locabtn" id="28">장성군</button>
<button class="locabtn" id="29">장흥군</button>
<button class="locabtn" id="30">진도군</button>
<button class="locabtn" id="31">함평군</button>
<button class="locabtn" id="32">해남군</button>
<button class="locabtn" id="33">화순군</button>
</div>


<div id="chungnam" style="display:none">
<button class="locabtn" id="1">충남 전체</button>
<button class="locabtn" id="2">계룡시</button>
<button class="locabtn" id="3">공주시</button>
<button class="locabtn" id="4">금산군</button>
<button class="locabtn" id="5">논산시</button>
<button class="locabtn" id="6">당진시</button>
<button class="locabtn" id="7">보령시</button>
<button class="locabtn" id="8">부여군</button>
<button class="locabtn" id="9">서산시</button>
<button class="locabtn" id="10">서천군</button>
<button class="locabtn" id="11">아산시</button>
<button class="locabtn" id="12">연기군</button>
<button class="locabtn" id="13">예산군</button>
<button class="locabtn" id="14">천안시 동남구</button>
<button class="locabtn" id="15">천안시 서북구</button>
<button class="locabtn" id="16">청양군</button>
<button class="locabtn" id="17">태안군</button>
<button class="locabtn" id="18">홍성군</button>
</div>


<div id="guangju" style="display:none">
<button class="locabtn" id="1">광주 전체</button>
<button class="locabtn" id="2">광산구</button>
<button class="locabtn" id="3">남구</button>
<button class="locabtn" id="4">동구</button>
<button class="locabtn" id="5">북구</button>
<button class="locabtn" id="6">서구</button>
</div>

<div id="ulsan" style="display:none">
<button class="locabtn" id="1">울산 전체</button>
<button class="locabtn" id="2">남구</button>
<button class="locabtn" id="3">동구</button>
<button class="locabtn" id="4">북구</button>
<button class="locabtn" id="5">울주구</button>
<button class="locabtn" id="6">중구</button>
</div>


<div id="geangbuk" style="display:none">
<button class="locabtn" id="1">경북전체</button>
<button class="locabtn" id="2">경산시</button>
<button class="locabtn" id="3">경주시</button>
<button class="locabtn" id="4">고령군</button>
<button class="locabtn" id="5">구미시</button>
<button class="locabtn" id="6">군위군</button>
<button class="locabtn" id="7">김천시</button>
<button class="locabtn" id="8">문경시</button>
<button class="locabtn" id="9">봉화군</button>
<button class="locabtn" id="10">상주시</button>
<button class="locabtn" id="11">성주군</button>
<button class="locabtn" id="12">안동시</button>
<button class="locabtn" id="13">영덕군</button>
<button class="locabtn" id="14">영양군</button>
<button class="locabtn" id="15">영주시</button>
<button class="locabtn" id="16">영천시</button>
<button class="locabtn" id="17">예천구</button>
<button class="locabtn" id="18" >울릉군</button>
<button class="locabtn" id="19">울진군</button>
<button class="locabtn" id="20">의성군</button>
<button class="locabtn" id="21" >청도군</button>
<button class="locabtn" id="22">청송군</button>
<button class="locabtn" id="23">칠곡군</button>
<button class="locabtn" id="24">포항시 남구</button>
<button class="locabtn" id="25">포항시 북구</button>

</div>

<div id="jeonbuk" style="display:none">
<button class="locabtn" id="1">전북 전체</button>
<button class="locabtn" id="2">고창군</button>
<button class="locabtn" id="3">군산시</button>
<button class="locabtn" id="4">김제시</button>
<button class="locabtn" id="5">남원시</button>
<button class="locabtn" id="6">무주군</button>
<button class="locabtn" id="7">부안군</button>
<button class="locabtn" id="8">순창군</button>
<button class="locabtn" id="9">완주군</button>
<button class="locabtn" id="10">익산시</button>
<button class="locabtn" id="11">임실군</button>
<button class="locabtn" id="12">장수군</button>
<button class="locabtn" id="13">전주시 덕진구</button>
<button class="locabtn" id="14">전주시 완산구</button>
<button class="locabtn" id="15">정읍시</button>
<button class="locabtn" id="16">진안군</button>
</div>


<div id="chungbuk" style="display:none">
<button class="locabtn" id="1">충복 전체</button>
<button class="locabtn" id="2">괴산군</button>
<button class="locabtn" id="3">단양군</button>
<button class="locabtn" id="4">보은군</button>
<button class="locabtn" id="5">영동군</button>
<button class="locabtn" id="6">옥천군</button>
<button class="locabtn" id="7">음성군</button>
<button class="locabtn" id="8">제천시</button>
<button class="locabtn" id="9">증평군</button>
<button class="locabtn" id="10">진천군</button>
<button class="locabtn" id="11">청주시 상당구</button>
<button class="locabtn" id="12">청주시 흥덕구</button>
<button class="locabtn" id="13">청주시 서원구</button>
<button class="locabtn" id="14">청주시 청원구</button>
<button class="locabtn" id="15">충주시</button>
</div>


<div id="gangwon" style="display:none">
<button class="locabtn" id="1">강원전체</button>
<button class="locabtn" id="2">강릉시</button>
<button class="locabtn" id="3">고성군</button>
<button class="locabtn" id="4">동해시</button>
<button class="locabtn" id="5">삼척시</button>
<button class="locabtn" id="6">속초시</button>
<button class="locabtn" id="7">양구군</button>
<button class="locabtn" id="8">양양군</button>
<button class="locabtn" id="9">영월군</button>
<button class="locabtn" id="10">원주시</button>
<button class="locabtn" id="11">인제군</button>
<button class="locabtn" id="12">정선군</button>
<button class="locabtn" id="13">철원군</button>
<button class="locabtn" id="14">춘천시</button>
<button class="locabtn" id="15">태백시</button>
<button class="locabtn" id="16">평창군</button>
<button class="locabtn" id="17">홍천군</button>
<button class="locabtn" id="18">화천군</button>
<button class="locabtn" id="19">횡성군</button>

</div>

<div id="jeju" style="display:none">
<button class="locabtn" id="1">제주전체</button>
<button class="locabtn" id="2">서귀포시</button>
<button class="locabtn" id="3">제주시</button>
</div>

<div id="sejong" style="display:none">
<button class="locabtn" id="1">세종전체</button>

</div>
</div>
<button type="submit" name="btn"  class="realbtn" style="font-size:20px;">
완료
</button>
</form>
</body>
</html>