<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<p>
			<input type="text" name="name" placeholder="ID">
		</p>
		<p>
			<input type="password" name="pass" placeholder="password">
		</p>
		<p>
			<input type="submit" value="Login">
		</p>
		</form>
	</div>
</body>
</html>