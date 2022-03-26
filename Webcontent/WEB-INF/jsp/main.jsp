<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User, model.Mutter, java.util.List" %>
<%
User loginUser = (User) session.getAttribute("loginUser");
List<Mutter> mutterList =
		(List<Mutter>) application.getAttribute("mutterList");
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿一覧</title>
</head>
<%@include file="/css/main.css" %>
<body>
<header>
	<h1 class="title">Exchangeglam</h1>
	<nav class="nav">
		<ul class="menu-group">
			<li class="menu-item"><%= loginUser.getName() %></li>
			<li class="menu-item"><a href="#">Mypage</a></li>
			<li class="menu-item"><a href="/Exchangegram/Logout">Logout</a></li>
		</ul>
	</nav>
</header>
<main>
	<div class="main-wrapper">
	<p><a href="/Exchangegram/Main">更新</a></p>
	<form action="/Exchangegram/Main" method="post">
	<input type="text" name="text">
	<input type="submit" value="送信">
	</form>

		<% if(errorMsg != null) { %>
		<p><%= errorMsg %></p>
		<% } %>
		<% for (Mutter mutter : mutterList) { %>
			<p class="mutterbox"> <%= mutter.getUserName() %>:<%= mutter.getText() %> </p><br>
		<% } %>
	</div>
</main>
<footer>
<p class= "footer-title">Exchangeglam</p>
</footer>
</body>
</html>