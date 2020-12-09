<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/css.jsp"%>
<%@include file="/WEB-INF/views/modal.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>card</title>

</head>
<body>
<div class="big_one">
<div class="title">
<h3>개 인 이 력 카 드</h3>
</div>
<br> 
* 새 이력 작성<br>
<form action="save.do" method="post" onsubmit="return beforesubmit()">
<input type="button" name="print" value="출력">
<input type="button" name="load" value="불러오기" onclick="openModal()">
<input type="reset" name="renew" value="새로작성" onclick="location.href='/card/main.do'">
<input type="submit"  value="저장">
<c:if test="${cardVO.user_idx!=null}">
<input type="hidden" name="user_idx" value="${cardVO.user_idx}">
</c:if>
<br> 
<table class="card_info">
	<tr>
	<td class="item">*성명</td>
	<td><input type="text" name="user_name" id="name" value="${cardVO.user_name}"></td>
	<td class="item">*주민등록번호</td>
	<td colspan="3"><input type="text" id="number" name="user_social_number" placeholder=" &quot;- &quot;제외한 숫자만 입력" value="${cardVO.user_social_number}"></td>
	<td class="item">성별</td>
	<td>
		<select name="user_sex" id="user_sex">
			<option value="선택없음" selected disabled="disabled">선택없음</option>
			<option value="남">남</option>
			<option value="여">여</option>
		</select>
	</td>
	</tr>
	
	<tr>
	<td class="item">소속회사</td>
	<td colspan="5"><input type="text" name="user_comp" value="${cardVO.user_comp}"></td>
	<td class="item">입사일</td>
	<td><input type="date" name="user_comp_enter" value="${cardVO.user_comp_enter}"></td>
	</tr>
	
	<tr>
	<td class="item">부서</td>
	<td><input type="text" name="user_dept"  value="${cardVO.user_dept}"></td>
	<td class="item">직위</td>
	<td><input type="text" name="user_spot"  value="${cardVO.user_spot}"></td>
	<td class="item">병역</td>
	<td><input type="text" name="user_army"  value="${cardVO.user_army}"></td>
	<td class="item">결혼</td>
	<td>
		<select name="user_marriage" id="user_marriage">
			<option value="선택없음" selected disabled>선택없음</option>
			<option value="미혼">미혼</option>
			<option value="기혼">기혼</option>
		</select>
	</td>
	</tr>
	
	<tr>
	<td class="item">병역(입대일)</td>
	<td colspan="2"><input type="date" name="user_army_start" value="${cardVO.user_army_start}"></td>
	<td class="item">병역(제대일)</td>
	<td colspan="2"><input type="date" name="user_army_end" value="${cardVO.user_army_end}"></td>
	<td class="item">역종/병과</td>
	<td><input type="text" name="user_army_part" value="${cardVO.user_army_part}"></td>
	</tr>
	
</table>
<br>
<table class="card_info">	
	<tr>
	<td class="item">전화</td>
	<td><input type="text" placeholder="휴대전화  &quot; - &quot; 포함" name="user_telephone"  value="${cardVO.user_telephone}"></td>
	<td ><input type="text" placeholder="유선   &quot; - &quot; 포함" name="user_mobile" value="${cardVO.user_mobile}" ></td>
	</tr>
	
	<tr>
	<td class="item">E-mail</td>
	<td ><input type="text" name="user_email" id="user_email" value="${cardVO.user_email}"></td>
	<td>
		<select id="email_domain" >
			<option value="선택하세요" selected disabled>선택하세요</option>
			<option value="@naver.com">@naver.com</option>
			<option value="@daum.net">@daum.net</option>
			<option value="@google.com">@google.com</option>
		</select>
	</td>
	</tr>
	
	<tr>
	<td class="item">주소</td>
	<td><input type="text" id="postcode" placeholder="우편번호" name="user_zipcode"  value="${cardVO.user_zipcode}">
	<input type="button" onclick="execDaumPostcode();" value="우편번호 찾기" style="float: right;">
		</td>
	<td><input type="text" id="addr" placeholder="주소" name="user_address" value="${cardVO.user_address}" ></td>
	</tr>
</table>
<br>
<!-- 학교 입력란 --> 
<div style="width:49%;float:left;">
<table class="card_info">
	<tbody id="edu_table" class="info_table">
	<tr>
	<td class="item">학교명</td>
	<td class="item">상태</td>
	
	<td class="item" colspan="2">년</td>
	<td class="item" colspan="2">월</td>
	</tr>

	<c:if test="${eduList==null}">
	<tr>
		<td>
			<input type="text" name="eduVoList[0].edu_school" >
		</td>
		<td>
			<select name="eduVoList[0].edu_status" class="edu_status">
				<option value="선택하세요" selected disabled>선택하세요</option>
				<option value="재학">재학</option>
				<option value="퇴학">퇴학</option>
				<option value="졸업">졸업</option>
			</select>
		</td>
		<td>
			<input type="text" name="eduVoList[0].edu_year"  >
		</td>
		<td>년</td>
		<td>
			<input type="text" name="eduVoList[0].edu_month" >
		</td>
		<td>월</td>
	</tr>
	</c:if>
	
	<c:if test="${eduList!=null}">
	<c:forEach items="${eduList}" var="eduList" varStatus="vs">
	<tr>
		<td>
			<input type="hidden" name="eduVoList[${vs.index}].edu_idx" value="${eduList.edu_idx}">
			<input type="text" name="eduVoList[${vs.index}].edu_school" value="${eduList.edu_school}">
		</td>
		<td>
			<select name="eduVoList[${vs.index}].edu_status" >
				<c:if test="${eduList.edu_status=='선택하세요'}">
					<option value="선택하세요" selected disabled>선택하세요</option>
					<option value="재학">재학</option>
					<option value="퇴학">퇴학</option>
					<option value="졸업">졸업</option>
				
				</c:if>
				<c:if test="${eduList.edu_status=='재학'}">
					<option value="재학" selected>재학</option>
					<option value="퇴학">퇴학</option>
					<option value="졸업">졸업</option>
				</c:if>
				<c:if test="${eduList.edu_status=='퇴학'}">
					<option value="재학" >재학</option>
					<option value="퇴학" selected>퇴학</option>
					<option value="졸업">졸업</option>
				</c:if>
				<c:if test="${eduList.edu_status=='졸업'}">
					<option value="재학">재학</option>
					<option value="퇴학">퇴학</option>
					<option value="졸업" selected>졸업</option>
				</c:if>
				
			</select>
		</td>
		<td>
			<input type="text" name="eduVoList[${vs.index}].edu_year"  value="${eduList.edu_year}"  >
		</td>
		<td>년</td>
		<td>
			<input type="text" name="eduVoList[${vs.index}].edu_month"  value="${eduList.edu_month}">
		</td>
		<td>월</td>
		<td class="buttontd" style="display:none;width:7%;border-right:hidden;border-top:hidden;border-bottom:hidden;">
			<input type="button" value="-" onclick='deleterow(this)'>
		</td>
	</tr>
	</c:forEach>
	</c:if>

	</tbody>
</table>
<input type="button" value="+" style="margin-top:5px;" onclick="edu_addrow()">
</div> 
<!--  학교 입력란 끝 -->


<!-- 자격증 란  --> 
<div class="qualifi_box" style="width:49%;float:right;">
<table class="card_info">
<tbody id="qualifi_table" class="info_table">
	<tr>
		<td class="item">자격증명</td>
		<td class="item" >취득일</td>

	</tr>
	<c:if test="${qualifiList==null}">
	<tr>
		<td><input type="text" name="qualifiVoList[0].qualifi_name" style="width:60%">
		</td>
		<td><input type="date" name="qualifiVoList[0].qualifi_getdate"></td>
	</tr>
	</c:if>
	<c:if test="${qualifiList!=null}">
		<c:forEach items="${qualifiList}" var="qualifiList" varStatus="vs">
			<tr>
				<td>
				<input type="hidden" name="qualifiVoList[${vs.index}].qualifi_idx" value="${qualifiList.qualifi_idx}">
				<input type="text" name="qualifiVoList[${vs.index}].qualifi_name" value="${qualifiList.qualifi_name}" style="width:60%">
				</td>
				
				<td>
					<input type="date" name="qualifiVoList[${vs.index}].qualifi_getdate" value="${qualifiList.qualifi_getdate }">
				</td>
				<c:if test="${vs.index!=0}">
				<td class='buttontd' style='display:none;width:7%;border-right:hidden;border-top:hidden;border-bottom:hidden;'>
 				<input type='button' value='-' onclick='qualifi_deleterow(this)'>
 				</td>
				</c:if>
			</tr>
		</c:forEach>
	</c:if>
</tbody>
</table>
<input type="button" value="+" style="margin-top:5px;" onclick="qualifi_addrow()">


</div>
<!--  자격증란 끝 -->
</form>

</div>
  

<!-- 우편번호 검색 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//불러오기 이메일 표시
var split = $('#user_email').val().split('@');
console.log(split);
$('#user_email').val(split[0]);
if(split[1]=="naver.com"){
	$('#email_domain').val('선택없음').prop("selected",false);
	$('#email_domain').val('@naver.com').prop("selected",true);
}
if(split[1]=="google.com"){
	$('#email_domain').val('선택없음').prop("selected",false);
	$('#email_domain').val('@google.com').prop("selected",true);
}
if(split[1]=="daum.net"){
	$('#email_domain').val('선택없음').prop("selected",false);
	$('#email_domain').val('@daum.net').prop("selected",true);
}

//불러오기 결혼 표시
if(${cardVO.user_marriage=="미혼"}){
	$('#user_marriage').val('선택없음').prop("selected",false);
	$('#user_marriage').val('미혼').prop("selected",true);
}
if(${cardVO.user_marriage=="기혼"}){
	$('#user_marriage').val('선택없음').prop("selected",false);
	$('#user_marriage').val('기혼').prop("selected",true);
}



//불러오기 성별 표시
 if(${cardVO.user_sex=="남"}){
	$('#user_sex').val('선택없음').prop("selected",false);
	$('#user_sex').val('남').prop("selected",true);
 }
if(${cardVO.user_sex=="여"}){
	$('#user_sex').val('선택없음').prop("selected",false);
	$('#user_sex').val('여').prop("selected",true);
}


function beforesubmit(){ //저장버튼 누르기 전 함수 
				
	//이름 입력 확인
	if(document.getElementById('name').value==''){
		alert("이름을 입력하세요");
		return false;
	}
	//주민등록번호 입력 확인
	if(document.getElementById('number').value==''){
		alert('주민등록번호를 입력하세요');
		return false;
	}
	
	//select의 disabled 제거(null이 안 되도록)
	
	//$('select > option:disabled').attr("disabled",false);
	$('select > option:disabled').removeAttr("disabled");
	
	//이메일 합치기
	var a=document.getElementById('user_email').value;
	var b=document.getElementById('email_domain').value;
	var c;
	if (b=="선택하세요"){
		c=a;
	}else{
		var c = a+b;
	}
	document.getElementById('user_email').value = c;
		
	
} //저장버튼 누르기 전 함수 끝
	
	//다음 우편번호 API
       function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	document.getElementById('postcode').value = data.zonecode;
            	 document.getElementById('addr').value = data.roadAddress;
            	 }
        }).open();
    }
 
//자격증 행 추가
/* var i=$('#qualifi_table tr').length;
function qualifi_addrow(){
	var qualifitable = document.getElementById('qualifi_table');
	var row = qualifitable.insertRow(qualifitable.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	cell1.innerHTML='<input type="text" class="quali_name" name="qualifiVoList['+i+'].qualifi_name" style="width:70%;">'
					+'<input type="button" class="delete_row_button" value="-" style="display:none;float:right;" onclick="qualifi_deleterow(this)">';
	cell2.innerHTML='<input type="date" name="qualifiVoList['+i+'].qualifi_getdate" >';
	i++;
	
} */

//자격증 행 추가
var i=$('#qualifi_table tr').length;
function qualifi_addrow(){
 var tag="<tr>"
 		+ "<td>"
 		+ "<input type='text' class='quali_name' name='qualifiVoList[" + i + "].qualifi_name' style='width=70%;'>"
 		+ "</td>"
 		+ "<td>"
 		+ "<input type='date' name='qualifiVoList["+i+"].qualifi_getdate'></td>"
 		+ "<td class='buttontd' style='display:none;width:7%;border-right:hidden;border-top:hidden;border-bottom:hidden;'>"
 		+ "<input type='button' value='-' onclick='deleterow(this)'>"
 		+ "</td></tr>";		
 		
 $('#qualifi_table').append(tag);
 i++;
} 


//행 지우기
function deleterow(obj){
	var tr=$(obj).parent().parent();
	console.log(tr.children('td').children('input[type=hidden]').val());
	tr.remove();
}

//학교 입력란 행 추가
var s=$('#edu_table tr').length;
function edu_addrow(){
	var tag="<tr>"
			+"<td><input type='text' name='eduVoList[" + s + "].edu_school'></td>"
			+"<td><select name='eduVoList[" + s + "].edu_status'>"
			+"<option value='선택하세요' selected disabled>선택하세요</option>"
			+"<option value='재학'>재학</option>"
			+"<option value='퇴학'>퇴학</option>"
			+"<option value='졸업'>졸업</option></select></td>"
			+"<td><input type='text' name='eduVoList[" + s + "].edu_year' >"
			+"<td>년</td>"
			+"<td><input type='text' name='eduVoList["+s+"].edu_month'></td>"
			+"<td>월</td>"
			+"<td class='buttontd' style='display:none;width:7%;border-right:hidden;border-top:hidden;border-bottom:hidden;'>"
			+"<input type='button' value='-' onclick='deleterow(this)'></td>"
$('#edu_table').append(tag);
	s++;
}

/* //학교 입력란 행 지우기
function edu_deleterow(){
	var edutable = document.getElementById('edu_table'); 
	if(s==1){
		alert("행을 지울 수 없습니다.");
	}else{
		edutable.deleteRow(edutable.rows.length-1);
		s--;
	}
} */

//메인화면 불러오기 창 상태 설정
var diplay;
display=sessionStorage.getItem('display');
if(display==null || display=="none"){
	$('#info_modal').css("display","none");
}


//불러오기 창 띄우기
function openModal(){
	sessionStorage.setItem('display','block');//display 보이게 내용
	$('#info_modal').css("display",sessionStorage.getItem('display'));
	
}

//불러오기 창 닫기
function exitModal(){
	sessionStorage.setItem('display','none');
	$('#info_modal').css("display",sessionStorage.getItem('display'));
}

//load페이지로 이동할 때 modal 창 닫기
function exitModalBeforeLoad(idx){
	sessionStorage.setItem('display','none');
	$('#info_modal').css("display",sessionStorage.getItem('display'));
	
	var user_idx = idx;
	location.href = "${pageContext.request.contextPath}/main.do?&user_idx="+user_idx;
}


//행 hover시에 행 삭제 버튼 활성화 
$('.info_table').mouseover(function(){
	var $button = $(this).children('tr').children('.buttontd');
	$button.css("display","");
	

});
 $('.info_table').mouseout(function(){
	 var $button = $(this).children('tr').children('.buttontd');
		$button.css("display","none");
	
}); 
	
 //연차별 인원보기
function byYear (){
var table="<table><thead><th>연차</th><th>인원></th></thead>"
		+"<tbody>"
		+"</tbody></table>";
	 //$('modalTable').html();
 }
</script>
</body>
</html>