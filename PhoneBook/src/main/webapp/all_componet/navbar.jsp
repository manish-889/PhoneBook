



<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-phone"></i>
			PhoneBook</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house-user"></i> Home</a></li>



				<li class="nav-item"><a class="nav-link" href="addContact.jsp"><i
						class="fa-solid fa-circle-plus"></i> Add Phone No</a></li>
				<li class="nav-item"><a class="nav-link" href="viewContact.jsp"><i
						class="fa-regular fa-eye"></i>View Contact</a></li>


			</ul>
			<%
			User user = (User) session.getAttribute("user");
			if (user == null) {
			%>

			<form class="form-inline my-2 my-log-0">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i>Log in</a> <a
					href="register.jsp" class="btn btn-danger"><i
					class="fa-solid fa-user"></i>Register</a>
			</form>

			<%
			} else {
			%>
			<form class="form-inline my-2 my-log-0">
				<button class="btn btn-success"><%=user.getName()%></button>
				<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					class="btn btn-danger ml-3">Logout</a>
			</form>
			<%
			}
			%>
		</div>

		<!-- Logout Popup -->

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Waring</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<h6 style="color: red;">Do You Want To Logout!!!</h6>
						<br>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="logout" class="btn btn-danger">Logout</a>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>

		<!-- Logout Popup -->
	</div>
</nav>