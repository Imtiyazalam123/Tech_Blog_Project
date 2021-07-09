<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import ="com.tech.blog.servlets.RegisterServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
	
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="CSS/myStyle.css" rel="stylesheet" type="text/css" />

<style>
	.banner-background {
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 70% 100%, 27% 92%, 0 100%, 0 0);
	}
</style>
</head>
<body>

	<%@include file="normal_navbar.jsp" %>
	<main class= "banner-background pb-5" style="background:blue;">
		<div class="container" >
			
				<div class = "col-md-6 offset-md-3">
					<div class="card">
						<div class= "card-header text-center" style="background: blue; color:white;">
							<span class= "fa fa-user-plus fa-3x"></span> <br>
							Register here
						</div>
						<div class = "card-body">
							<form id = "reg-form" action = "RegisterServlet" method = "post">
							
								<div class="mb-3">
									<label for="user_name" class="form-label">User
										name</label> <input type="text" class="form-control"
										id="user_name" name = "user_name" placeholder="Enter your full name">
	
								</div>
								
								<div class="mb-3">
									<label for="email" class="form-label">Email
										address</label> <input type="email" class="form-control"
										id="email" aria-describedby="emailHelp" name = "user_email" placeholder="Enter Your Email">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								
								
								<div class="mb-3">
									<label for="password" class="form-label">Password</label>
									<input type="password" class="form-control"
										id="password" name = "user_password" placeholder="Enter Your Password">
								</div>
								
								
								<div class="mb-3">
									<label>Select gender</label> <br>
										<input id="male" type="radio" name="user_gender" value = "Male"><label for="male">Male</label>
										<input id="female" type="radio" name= "user_gender" value = "Female"><label for="female">Female</label>
	
								</div>
								
								<div class="mb-3">
									
									<textarea name= "about" rows = "3" class="form-control" placeholder="write somthing about you !"></textarea>
								</div>
								
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name = "user_check"> <label class="form-check-label"
										for="exampleCheck1">i am agree with term and condition</label>
								</div>
								<div class="container text-center" id= "loader" style="display:none;">
									<span class = "fa fa-refresh fa-spin fa-4x"></span>
									<h4>Please wait...</h4>
								</div>
								<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
							</form>
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
	
<!-- 	sweet alert CDN -->
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<script>
		
		$(document).ready(function() {
			//console.log("loaded....")
			
			$('#reg-form').on('submit', function(event){
			
				
				event.preventDefault();
				
				
				
				let form = new FormData(this);
				
				$('#submit-btn').hide();
				$("#loader").show();
				
				//sent register servlet:
				$.ajax({
					
					url: 'RegisterServlet',
					type: 'post',
					data: form,
					success: function(data, textStatus, jqXHR) {
						//console.log(data)
						
						$('#submit-btn').show();
						$("#loader").hide();
						
						
						if(data.trim() == "done") {
						
							//sweet alert functions
							swal("Successfully Registered !, We are going to redirect to login page")
							
								.then((value) => {
									window.location="login_page.jsp"	
							});
						}
						else {
							swal(data)
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR)
						
						$('#submit-btn').show();
						$("#loader").hide();
						
						swal(" somthing went worng !, please try again")
					},
					processData: false,
					contentType: false
				});
			});
		});
	</script>
</body>
</html>








