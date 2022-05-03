<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jdbc.DBConnection" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>

<style>
    table, td{
        margin:auto;
        width: 400px;
        border: 1px solid gray;
        text-align: center;
    }
    
    h2, h4{ text-align: center;}
    a { text-decoration: none;}
</style>


<%

%>

<jsp:useBean id="dto" class="member.MemberDto"/>
<jsp:useBean id="dao" class="member.MemberDao"/>

<%
	//session객체의 속성으로 저장해둔 member_id값을 가져와서 쿼리문 작성
	String member_id = (String)session.getAttribute("id");
	dto = dao.getMemberInfo(member_id, dto);
%>

</head>
<body>
<h2>회원정보</h2>
<table>
    <tr>
        <td>아이디</td><td><%=dto.getMember_id() %></td>
    </tr>
    <tr>
        <td>비밀번호</td><td><%=dto.getMember_pw() %></td>
    </tr>
    <tr>
        <td>이름</td><td><%=dto.getMember_name() %></td>
    </tr>
    <tr>
        <td>전화번호</td><td><%=dto.getPhone_no() %></td>
    </tr>
</table>
<h4><a href="main.jsp">메인화면</a>&nbsp;&nbsp;<a href="update_member.jsp">정보수정</a></h4>

</body>
</html>