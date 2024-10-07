<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_componet/all_css.jsp"%>
<%@include file="all_componet/navbar.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/Plan.jpg");
	height: 85vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<div class="container-fluid back-img">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-dark0">Registration Page</h4>
						<%
						String done = (String) session.getAttribute("doneMsg");
						String error = (String) session.getAttribute("errorMsg");
						if (done != null) {
						%>
						<div class="alert alert-success alert-dismissible fade show mt-2"
							role="alert">
							<%=done%>
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						session.removeAttribute("doneMsg");
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
						session.removeAttribute("errorMsg");
						}
						%>
						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Your Name</label> <input type="tel" class="form-control" name="name"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary ">Register</button>
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