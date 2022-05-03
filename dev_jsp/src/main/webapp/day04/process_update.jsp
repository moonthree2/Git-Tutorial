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
//스크립트릿:_jspService()메소드 내에서 실행되는 자바 소스 코드
    request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="dto" class="member.MemberDto"></jsp:useBean>
	<jsp:setProperty name="dto" property="*"></jsp:setProperty>
	<jsp:useBean id="dao" class="member.MemberDao"/>


<%
	int result = dao.updateMemberInfo(dto);
    
   if(result==1){
   		out.println("<h3>정상적으로 정보수정이 이루어졌습니다.</h3>");
		out.println("<a href=\'member_info.jsp\'>내정보 확인</a>");   
   }else{
	   out.println("<script>alert('정보수정이 정상적으로 이루어지지 않았습니다.')</script>");
       out.println("<script> history.back(); </script>");
   }
	
    
%>
</body>
</html>