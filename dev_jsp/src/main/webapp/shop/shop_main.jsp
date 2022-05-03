<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 쇼핑몰</title>

<style>
h3{
	text-align: center;
}

table{
	margin:auto;
    width: 400px;
    border: 3px solid gray;
    text-align: center;
    border-collapse: collapse;
}

th, td{
	border: 1px solid gray;
	margin:0;
	padding:5px;
}
</style>

</head>
<body>
<h3>상품목록</h3>
<!-- 
	create table shoppingitems_tb(
		item_id number primary key,
		item_name varchar2(50) not null,
		item_price number not null);
		
	insert into shoppingitems_tb values(2022001, 'LG-평면-TV', 400000);
	insert into shoppingitems_tb values(2022002, '삼성-LED-모니터', 300000);
	insert into shoppingitems_tb values(2022003, '위니아-딤채-냉장고', 500000);	

 -->
<table>
	<tr><th>제품명</th><th>가격</th><th>장바구니</th></tr>
	<tr>
		<td>LG 평면 TV</td>
		<td>40만원</td>
		<td><button onclick="document.location.href='item_detail.jsp?itemId=2022001'">상품 상세</button></td>
	</tr>
	<tr>
		<td>삼성 LED 모니터</td>
		<td>30만원</td>
		<td><button onclick="document.location.href='item_detail.jsp?itemId=2022002'">상품 상세</button></td>
	</tr>
	<tr>
		<td>위니아 딤채 김치냉장고</td>
		<td>50만원</td>
		<td><button onclick="document.location.href='item_detail.jsp?itemId=2022003'">상품 상세</button></td>
	</tr>
</table>

</body>
</html>