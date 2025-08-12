<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int cherryCost = 25000;
	int orangeCost = 23000;
	int appleCost = 16000;
%>

<%
	String cherry = request.getParameter("cherry");
	String orange = request.getParameter("orange");
	String apple = request.getParameter("apple");
	int totalCost = 0;
	List<String> fruitList = new ArrayList<String>(); // 과일을 담을 리스트
	
	if(cherry!= null) {
		cherry = "체리";
		totalCost += cherryCost;
		fruitList.add(cherry);
	}
	
	if(orange!= null) {
		orange = "오렌지";
		totalCost += orangeCost;
		fruitList.add(orange);
	}
	
	if(apple != null) {
		apple = "사과";
		totalCost += appleCost;
		fruitList.add(apple);
	}
	
	session.setAttribute("totalCost", totalCost);
	session.setAttribute("fruitList", fruitList);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
	dispatcher.forward(request, response);


%>
</body>
</html>