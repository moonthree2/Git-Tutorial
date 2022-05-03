<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jdbc.DBConnection" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정화면</title>
</head>
<body>
<%
	String member_id2 = (String)session.getAttribute("id");

	Connection conn = DBConnection.getConnection();
	String sql = "select member_id, member_pw, member_name, phone_no from member_tb where member_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, member_id2);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>

<h2>회원정보 수정</h2>
<form name="updateForm" method="post" action="process_update.jsp">
<table>
    <tr>
        <td>아이디</td><td><input type="text" name="member_id" value="<%=rs.getString("member_id") %>"></td>
    </tr>
    <tr>
        <td>비밀번호</td><td><input type="password" name="member_pw" value="<%=rs.getString("member_pw") %>"></td>
    </tr>
    <tr>
        <td>이름</td><td><input type="text" name="member_name" value="<%=rs.getString("member_name") %>"></td>
    </tr>
    <tr>
        <td>전화번호</td><td><input type="text" name="phone_no" value="<%=rs.getString("phone_no") %>"></td>
    </tr>
</table>
<h4><a href="main.jsp">메인화면</a>&nbsp;&nbsp;<a href="javascript:updateForm.submit()">수정하기</a></h4>
</form>
<% pstmt.close(); rs.close(); conn.close(); %>
</body>
</html>   