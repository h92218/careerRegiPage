<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>card</title>
<script type="text/javascript" src="/card/resources/js/jquery-3.5.0.min.js"></script>
<style>
div.big_one{
width:80%;
display:block;
margin:0 auto;
font-size:13px;
}

div.title{
text-align:center;
border:2px solid;
display:block;
margin:0 auto;
padding:5px 40px;
background-color:#e3dada;
}

table.card_info {
    width: 100%;
    border: 1px solid;
    border-collapse: collapse;
}
 
td {
    border: 1px solid #d6d2d2;
    height:30px;
}

select{
  width:100%;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
  -moz-appearance: none; 
  appearance: none;
  border:none;
  background: url(/card/resources/arrow.jpg) no-repeat 95% 50%; /*화살표모양*/
}

td.item{
	background-color:#b8b4b4;
	width:100px;
	text-align:center;
}
 
input[type=text],[type=select],[type=date] {
	border:none;
	width:95%;
}
 
input:focus {outline:none;}
 
input#postcode{width:50%;}
a { 
	text-decoration:none; 
	color:blue;
	cursor: pointer;}


#info_modal{
	border-radius:10px;
	background-color:#e3dada;
	top:100px;
	width:70%;
	height:auto;
	margin:0 auto;
	position:fixed;
	left:0;
	right:0;
	text-align:center;
}




</style>
</head>
<body>

</body>
</html>