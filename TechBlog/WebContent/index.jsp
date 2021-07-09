<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech_Blog_Project</title>
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

	<!-- 		 nav_bar -->

	<%@include file="normal_navbar.jsp"%>

	<!-- 	banner -->

	<div class="container-fluide banner-background">
		<div class="jumbotron" style="background: blue; color: white">
			<div class="container p-5">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>welcome to technical blog, world of technology A programming
					language is a formal language, which comprises a set of instruction
				</p>
				<p>A programming language is a formal language comprising a set
					of instructions that produce various kinds of output. Programming
					languages are used in computer programming to implement algorithms.

					Most programming languages consist of instructions for computers.
					There are programmable machines that use a set of specific
					instructions, rather than general programming languages. Since the
					early 1800s, programs have been used to direct the behavior of
					machines such as Jacquard looms, music boxes and player pianos.[1]
					The programs for these machines (such as a player piano's scrolls)
					did not produce different behavior in response to different inputs
					or conditions.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span>Starts !its free
				</button>
				<a href = "login_page.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle fa-spin"></span>Login
				</a>
			</div>
		</div>

	</div>

	<!-- 	cards -->
	<div class="container">

		<div class="row mb-2 mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programing Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read More</a>
					</div>
				</div>
			</div>
		</div>

	</div>


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

	<script>
				//$(document).ready(function() {
		 			//alert("document loaded")
		 		//})
	</script>
</body>
</html>