<%@page import="com.entity.Contact"%>
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
	<%
	if (user == null) {
		session.setAttribute("Invalid", "Please Login First...");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid back-img">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-dark">Add Contact Page</h4>
						<%
						
						String error = (String) session.getAttribute("error");
						
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

						<form action="update" method="post">
							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDao dao = new ContactDao(DbConnect.getCon());
							Contact contact = dao.getContactById(cid);
							%>
							<input type="hidden" value="<%=cid%>" name="cid">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Name</label> <input type="tel" class="form-control" name="name" value="<%=contact.getName() %>"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email" value="<%=contact.getEmail() %>"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-2 mt-3">
								<label class="form-label">Phone No</label> <input type="number" value="<%=contact.getPhno() %>"
									class="form-control" id="uname" aria-describedby="emailHelp"
									name="phone">

							</div>

							<div class="form-group">
								<label class="form-label">About</label>
								<textarea rows="3" class="form-control" id="about"  name="about"><%=contact.getAbout() %> </textarea>
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-success">Update
									Contact</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_componet/footer.jsp"%>


</body>
</html>