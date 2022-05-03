<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>계산기</title>
</head>
<body>
<%
	double result = 0;
	String oper = request.getParameter("cal");
	String str1 = request.getParameter("input1");
	String str2 = request.getParameter("input2");
	if(str1==null){
		str1="0";
	}
	if(str2==null){
		str2="0";
	}
	
	double num1 = Double.parseDouble(str1);
	double num2 = Double.parseDouble(str2);
	
	if("plus".equals(oper)){
		result = num1 + num2;
	}else if("minus".equals(oper)){
		result = num1 - num2;
	}else if("multiply".equals(oper)){
		result = num1 * num2;
	}else if("division".equals(oper)){
		result = num1 / num2;
	}
%>
	<form method="post">
	    <table style="border: 1px solid black; width: 500px; height: 250px;">
	        <thead style="height: 70px;">
	            <tr>
	                <td colspan="2" style="text-align: center; font-size: 30px;">
	                    계산기
	                </td>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td style="text-align: right;">
	                    입력값 1:
	                </td>
	                <td>
	                    <input type="number" name="input1">
	                </td>
	            </tr>
	            <tr>
	                <td style="text-align: right;">
	                    입력값 2:
	                </td>
	                <td>
	                     <input type="number" name="input2">
	                </td>
	            </tr>
	            <tr>
	                <td></td>
	                <td>
                    <input type="radio" name="cal" value="plus">덧셈
                    <input type="radio" name="cal" value="minus">뺄셈
                    <input type="radio" name="cal" value="multiply">곱셈
                    <input type="radio" name="cal" value="division">나눗셈
	                </td>
	            </tr>
	            <tr>
	                <td></td>
	                <td>
	                    <input type="submit" name="calc" value="계산하기">
	                    <input type="reset" value="초기화">
	                </td>
	            </tr>
	            
	            <tr>
	                <td style="text-align: right;">계산결과: </td>
	                <td>
	                    <input type="number" name="result2" value="<%=result %>">
	                </td>
	            </tr>
	        </tbody>
	    </table>
	 </form>
</body>
</html>