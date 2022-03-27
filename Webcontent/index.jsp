<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<%@include file="/css/index.css" %>
<body>
	<div class="container">
		<h1>Exchangegram</h1>
		<form action="Login" method="post">
			<% if(errorMsg != null) { %>
			<p><%= errorMsg %></p>
			<% } %>
		<p>
			<input type="text" name="name" placeholder="ID" class="text">
		</p>
		<p>
			<input type="password" name="pass" placeholder="password" class="text">
		</p>
		<p>
			<input type="submit" value="Login" class="button">
		</p>
		</form>
	</div>
</body>
</html>