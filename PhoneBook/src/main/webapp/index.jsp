<%@page import="com.entity.User"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_componet/all_css.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/home1.jpeg");
	height: 85vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="all_componet/navbar.jsp"%>
	
	<div class="container-fluid back-img text-center text-dark">

		<h1>Welcome to PhoneBook Application</h1>

	</div>
	<%@include file="all_componet/footer.jsp"%>
</body>
</html>