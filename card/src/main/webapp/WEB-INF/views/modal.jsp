<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/css.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<!-- 불러오기 창 -->
<div id="info_modal">
<!-- 불러오기 검색부분 -->

<form action="main.do" method="POST">
<div id="search_condition" style="margin-top:7px;">
	<select name="keyfield" style="width:13%">
	<c:if test="${keyfield eq ''}">
		<option value="검색조건" selected disabled>검색조건</option>
		<option value="user_idx" >등록번호</option>
		<option value="user_name" >성명</option>
		<option value="user_comp" >소속회사</option>
		<option value="user_dept" >부서</option>
	</c:if>
	<c:if test="${keyfield eq 'user_idx'}">
		<option value="">전체보기</option>
		<option value="user_idx" selected >등록번호</option>
		<option value="user_name" >성명</option>
		<option value="user_comp" >소속회사</option>
		<option value="user_dept" >부서</option>
	</c:if>
	<c:if test="${keyfield eq 'user_name'}">
		<option value="">전체보기</option>
		<option value="user_idx">등록번호</option>
		<option value="user_name" selected >성명</option>
		<option value="user_comp" >소속회사</option>
		<option value="user_dept" >부서</option>
	</c:if>
	<c:if test="${keyfield eq 'user_comp'}">
		<option value="">전체보기</option>
		<option value="user_idx">등록번호</option>
		<option value="user_name" >성명</option>
		<option value="user_comp"selected>소속회사</option>
		<option value="user_dept" >부서</option>
	</c:if>
	<c:if test="${keyfield eq 'user_dept'}">
		<option value="">전체보기</option>
		<option value="user_idx">등록번호</option>
		<option value="user_name" >성명</option>
		<option value="user_comp">소속회사</option>
		<option value="user_dept"selected>부서</option>
	</c:if>

	</select>
	<input type="text" name="keyword" style="width:30%" value="${keyword}">
	<select name="career_year" style="width:13%">
		<c:if test="${career_year eq '' }">
			<option value="경력사항" selected disabled>경력사항</option>
			<option value="1년미만" >1년미만</option>
			<option value="1_2년" >1-2년</option>
			<option value="3_4년" >3-4년</option>
			<option value="5_" >5년 이상</option>
		</c:if>
		<c:if test="${career_year eq '1년미만' }">
			<option value="">전체보기</option>
			<option value="1년미만" selected>1년미만</option>
			<option value="1_2년" >1-2년</option>
			<option value="3_4년" >3-4년</option>
			<option value="5_" >5년 이상</option>
		</c:if>
		<c:if test="${career_year eq '1_2년' }">
			<option value="">전체보기</option>
			<option value="1년미만" >1년미만</option>
			<option value="1_2년" selected>1-2년</option>
			<option value="3_4년" >3-4년</option>
			<option value="5_" >5년 이상</option>
		</c:if>
		<c:if test="${career_year eq '3_4년' }">
			<option value="">전체보기</option>
			<option value="1년미만" >1년미만</option>
			<option value="1_2년" >1-2년</option>
			<option value="3_4년" selected>3-4년</option>
			<option value="5_" >5년 이상</option>
		</c:if>
		<c:if test="${career_year eq '5_' }">
			<option value="">전체보기</option>
			<option value="1년미만" >1년미만</option>
			<option value="1_2년" >1-2년</option>
			<option value="3_4년" >3-4년</option>
			<option value="5_" selected>5년 이상</option>
		</c:if>
	</select>
	<select name="rowCount" style="width:13%">
		<c:if test="${rowCount eq '' or rowCount eq '10'}">
			<option value="10" selected>10개씩</option>
			<option value="5" >5개씩</option>
			<option value="15" >15개씩</option>
		</c:if>
		
		<c:if test="${rowCount eq '5'}">
			<option value="10" >10개씩</option>
			<option value="5" selected>5개씩</option>
			<option value="15" >15개씩</option>
		</c:if>
		<c:if test="${rowCount eq '15'}">
			<option value="10" >10개씩</option>
			<option value="5" >5개씩</option>
			<option value="15" selected>15개씩</option>
		</c:if>
	</select>
<input type="submit" value="검색">
 검색결과 :   ${count} 건
</div>
<input type="button" value="연차별 인원보기" style="float:left;margin-left:10px;" onclick="career_mem()"> 
</form>
<!--  불러오기 검색 부분 끝 -->
 <br><br>
<table style="width:95%;" id="modalTable">
	<thead>
		<tr>
		<th>등록번호</th>
		<th>성명</th>
		<th>소속회사</th>
		<th>부서</th>
		<th>성별</th>
		<th>경력</th>
		<th>등록날짜</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="cardList" items="${list}">
			<tr>
				<td>${cardList.user_idx}</td>
				<td><a onclick="exitModalBeforeLoad(${cardList.user_idx})">${cardList.user_name}</a></td>
				<td>${cardList.user_comp}</td>
				<td>${cardList.user_dept}</td>
				<td>${cardList.user_sex}</td>
				<td>${cardList.user_career_year}년 ${cardList.user_career_month}개월</td>
				<td>${cardList.user_register}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page">
${pagingHtml}</div> <input type="button" value="닫기" onclick="exitModal()" style="float:right;margin:10px 10px 0 0"><br><br>

</div>


<!-- 불러오기 창 끝 -->

<script>
//연차별 인원보기 
function career_mem(){

	

	//기존 테이블 지우기 
	var trlength = $('#modalTable tr').length;
	var modaltable = document.getElementById('modalTable');
	for(var t=trlength-1;t>=0;t--){
		modaltable.deleteRow(t);
	}  
	$('#page').css("display","none");
	
	$.ajax({
		url : "/career.do"
	});
	
	
	
	$('#modalTable').append("<thead><tr><th>연차</th><th>인원</th><tr></thead>"+
							"<tbody></tbody>"
	);

	
}

</script>

</body>
</html>