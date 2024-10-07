<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
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
	background: url("img/Plan.jpg");
	height: 85vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #dee3e0;
}
</style>
</head>
<body class="back-img">
	<%@include file="all_componet/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("Invalid", "Please Login First...");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String msg = (String) session.getAttribute("done");
	String error = (String) session.getAttribute("error");
	if (msg != null) {
	%>
	<div class="alert alert-info" role="alert"><%=msg%></div>
	<%
	session.removeAttribute("done");
	}
	if (error != null) {
	%>
	<div class="alert alert-danger alert-dismissible fade show mt-2"
		role="alert">
		<%=error%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	session.removeAttribute("error");
	}
	%>


	<div class="container">
		<div class="row p-4">
			<%
			if (user != null) {
				ContactDao dao = new ContactDao(DbConnect.getCon());
				List<Contact> contact = dao.getAllContact(user.getId());

				for (Contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							Name :
							<%=c.getName()%></h5>
						<p>
							Phone No :
							<%=c.getPhno()%></p>
						<p>
							Email :
							<%=c.getEmail()%></p>
						<p>
							About :
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm">Edit</a> <a
								href="delete?cid=<%=c.getId()%>" class="btn btn-danger btn-sm">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>
</body>
</html>