<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


<table>
	<tr><th>제품명</th><th>제품가격</th></tr>
<%
	request.setCharacterEncoding("UTF-8");
	String item_id = request.getParameter("itemId");
	
	//application.log("##### item_id:"+item_id);
	
	String oldCookie = request.getHeader("Cookie");
	int idx=1;
	if(oldCookie == null){//처음 쇼핑몰에 접속한 사용자인 경우

		Cookie newCookie = new Cookie("itemId"+idx, item_id);
		newCookie.setMaxAge(60*10);
		response.addCookie(newCookie);
		
		//처음 장바구니에 물건을 넣는 경우 request객체에는 SessionID이외에는 쿠키가 저장되어 있지 않고
		//다음 번 요청부터 클라이언트에 저장된 쿠키를 이용할 수 있으므로 클라이언트가 장바구니로 진입하는데는
		//물건에 대한 정보를 담는 쿠키를 request객체가 가질 수 있도록 2단계로 진입하도록 구현한다.

	}else{
		idx = request.getCookies().length;
		Cookie newCookie = new Cookie("itemId"+idx, item_id);
		newCookie.setMaxAge(60*10);
		response.addCookie(newCookie);	
	}
	
	int itemId = Integer.parseInt(item_id);
	dto = dao.getItem(itemId, dto);
				
%>
	<tr><td><%=dto.getItem_name() %></td><td><%=dto.getItem_price() %></td></tr>
	<tr><td colspan="2">상품이미지 + 상품설명 + ...</td></tr>
	<tr><td colspan="4"><a href="shop_main.jsp">메인화면</a>&nbsp;&nbsp;<button onclick="document.location.href='shop_cart.jsp'">장바구니</button></td></tr>
</table>

</body>
</html>