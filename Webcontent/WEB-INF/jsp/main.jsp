<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User" %>
<%
User loginUser = (User) session.getAttribute("loginUser");
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
	</div>
</main>>
<footer>
<p class= "footer-title">xxxxxxxxxxxxxxx</p>
</footer>
</body>
</html>