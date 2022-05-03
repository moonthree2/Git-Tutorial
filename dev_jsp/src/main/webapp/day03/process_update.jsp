<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.DBConnection, java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

    String member_id = request.getParameter("member_id");
    String member_pw = request.getParameter("member_pw");
    String member_name = request.getParameter("member_name");
    String phone_no = request.getParameter("phone_no");
    
    Connection conn =DBConnection.getConnection();
    String sql ="update member_tb set member_id=?, member_pw=?, member_name=?, phone_no=? where member_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,member_id);//1:첫번째 ?를 의미함
	pstmt.setString(2,member_pw);
	pstmt.setString(3,member_name);
	pstmt.setString(4,phone_no);
	pstmt.setString(5,member_id);
	
	pstmt.executeUpdate();
	
	out.println("<h3>정상적으로 정보수정이 이루어졌습니다.</h3>");
	out.println("<a href=\'member_info.jsp\'>내정보 확인</a>");
    
%>
</body>
</html>