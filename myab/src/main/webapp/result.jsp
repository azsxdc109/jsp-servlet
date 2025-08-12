<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제화면</title>
</head>
<body>
<%
	List<String> fruits = new ArrayList<String>();
	fruits = (List)session.getAttribute("fruitList");
	
	int cost = (Integer)session.getAttribute("totalCost");
%>
<form action="first.jsp">
	<table border="1px">
		<tr>
			<th>구입한 과일</th>
			<td>
				<%for(int i=0; i<fruits.size(); i++) {%>
					<%=fruits.get(i) %>				
				<%} %>
			</td>
			
		</tr>
		<tr>
			<th>합계</th>
			<td><%=cost %></td>
		</tr>
		<tr>
			<td><input type="submit" value="과일구입화면"></td>
	</table>
</form>
</body>
</html>