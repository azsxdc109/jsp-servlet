<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일구매화면</title>
</head>
<body>
	<form action="buy.jsp">
		<table border="1px">
			<tr>
				<th>과일 목록</th>
				<th>가격</th>
			</tr>
			<tr>
				<td><input type="checkbox" name="cherry">체리</td>
				<td>25000</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="orange">오렌지</td>
				<td>23000</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="apple">사과</td>
				<td>16000</td>
			</tr>
			<tr>
				<td><input type="submit" value="구입" style="align-item:center"></td>
			</tr>
		</table>
	</form>
</body>
</html>