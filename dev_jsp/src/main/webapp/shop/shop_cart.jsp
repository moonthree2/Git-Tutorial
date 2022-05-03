<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>장바구니</title>

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
<h3>장바구니 목록</h3>

<jsp:useBean id="dto" class="shop.ItemDto" />
<jsp:useBean id="dao" class="shop.ItemDao" />

<form name="cartForm" action="payfor.jsp" method="post">
<table>
	<tr><th>제품번호</th><th>제품명</th><th>제품가격</th></tr>

<%
	//쿠키를 이용해서 장바구니 물품목록과 결재버튼을 만들어주면 됨
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		if(!cookie.getName().equals("JSESSIONID")){//쿠키 이름이 JSESSIONID가 아닐 경우
			String idValue= cookie.getValue().trim();
			int itemId = Integer.parseInt(idValue);
			dto = dao.getItem(itemId, dto);			
%>
			<tr><td><%=dto.getItem_id() %></td><td><%=dto.getItem_name() %></td><td><%=dto.getItem_price() %></td></tr>
<%
			}//end of if
	}//end of for
	
%>
	<tr><td colspan="4"><a href="shop_main.jsp">쇼핑계속하기</a>&nbsp;&nbsp;<button onclick="javascript:cartForm.submit()">결재하기</button></td></tr>
</table>
</form>
</body>
</html>