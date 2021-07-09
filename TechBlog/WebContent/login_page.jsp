<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import = "com.tech.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin = "anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="CSS/myStyle.css" rel="stylesheet" type="text/css" />

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 70% 100%, 27% 92%, 0 100%, 0 0
		);
}
</style>
</head>
<body>

	<!-- 	navbar -->
	<%@include file="normal_navbar.jsp"%>
	<main class="d-flex align-items-center banner-background"
		style="height: 70vh; background: blue;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center"
							style="background: blue; color: white">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>Login Page</p>
						</div>
						
						<%
							Message m = (Message) session.getAttribute("msg");
							if(m != null){
								%>
								
									<div class="<%= m.getCssClass() %>" role="alert">
 									<%= m.getContent() %>
									</div>
								
								<% 
								
								session.removeAttribute("msg");
							}
							
						%>
						
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="email" required type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" required type="password"
										class="form-control" id="exampleInputPassword1">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- 		javascript -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
		integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
		integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
		crossorigin="anonymous"></script>


	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>