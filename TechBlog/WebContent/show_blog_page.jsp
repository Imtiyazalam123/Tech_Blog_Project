<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.User, com.tech.blog.dao.PostDao,com.tech.blog.helper.ConnectionProvider, com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category, java.util.*, com.tech.blog.dao.* "%>
<%@page errorPage="error_page.jsp"%>

<!-- 	this is page validation code if any person go to on this page directly without login -->
<%
HttpSession s = request.getSession();
User user = (User) s.getAttribute("currentUser");
if (user == null)
	response.sendRedirect("login_page.jsp");
%>

<%
//fetching postId
int pId = Integer.parseInt(request.getParameter("post_id"));

//fetching post details by postId
PostDao pd = new PostDao(ConnectionProvider.getConnection());
Post p = pd.getPostByPostId(pId);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%> || Tech Blog</title>

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
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 70% 100%, 27% 92%, 0 100%, 0 0
		);
}
	.post-title{
/* 		font-weight:100; */
		font-size:30px;
	}
	.post-content{
		font-weight:200;
		font-size:20px;
		padding:0 15px;
	}
	.user-row{
		border:1px solid #e2e2e2;
		padding-top:15px;
	}
	.post-info {
		font-style: italic;
		font-weight: bold;	
	}
	.post-date {
		font-size:18px;
		padding:0 10px;
	}
	body{
		background:url(img/bg.jpg);
		background-attachment: fixed;
		background-size:cover;
	}
</style>

</head>
<body>
	<!--  nav bar starting -->
	
			<nav class="navbar navbar-expand-lg  navbar-dark"
		style="background: blue; color: white">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">TechBlog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Programing
									Language</a></li>
							<li><a class="dropdown-item" href="#">Project
									implementation</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Data Structure </a></li>
						</ul></li>

					<li class="nav-item">
					<a class="nav-link" href="#" data-bs-toggle = "modal" data-bs-target = "#add-post-modal">
					<span class="fa fa-asterisk">Do post</span></a>
					</li>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link" href="#!"
						data-bs-toggle="modal" data-bs-target="#profileModal"
						tabindex="-1" aria-disabled="true"><span
							class="fa fa-user-circle"></span><%=user.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet"
						tabindex="-1" aria-disabled="true"><span
							class="fa fa-user-plus"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
			
				
<!-- 	nav bar ending -->
	
	<!--main body of show_blog.jsp page  -->

	<div class = "container">
	
		<div class = "row my-3">
			<div class = "col-md-8 offset-md-2">
				<div class = "card">
					<div class = "card-header text-center bg-primary text-light">
						<h4 class = "post-title"><%= p.getpTitle() %></h4>
					</div>
							
					<div class = "card-body p-0">
					<img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="image not loaded" style = "height:200px;">
					
				<div class= "container">	
						<div class= "row my-2 user-row">
							<div class = "col-md-8">
							
								<!-- 	Fetching user details by user id -->
								<%
									UserDao ud = new UserDao(ConnectionProvider.getConnection());	
									User u = ud.getUserByUserId(p.getUserId());
								%>
							
								<p class ="post-info"><a href = "#!"><%= u.getName() %></a> has posted : </p>
							</div>
					
							<div class = "col-md-4">
								<p class = "post-date"><%= java.text.DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
							</div>
						</div>
					</div>
						<p class = "post-content"><%= p.getpContent() %></p>
						<br>
						<br>
						<div class = "post-code">
							<pre><%=p.getpCode() %></pre>
						</div>
					</div>
						<%
							LikeDao ldo = new LikeDao(ConnectionProvider.getConnection());
						%>
					<div class = "card-footer text-center bg-primary">
						<a href = "#!" onclick="doLike(<%= p.getPid() %>, <%= u.getId() %>,this)" class = "btn btn-outline-light "><i class = "fa fa-thumbs-o-up"></i> <span><%= ldo.countLikeOnPost(p.getPid()) %></span> </a>
						<a href = "#!" class = "btn btn-outline-light "><i class = "fa fa-commenting"></i> <span>20</span> </a>
					</div>
				</div>
			</div>
		</div>	
	</div>

	<!--end of main body of show_blog.jsp page -->
	
	
	<!-- 		profile	modal starting -->

	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background: blue; color: white;">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img class="mb-2" src="pics/<%=user.getProfile()%>"
							style="width: 100px; border-radius: 50%;"> <br>

						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- profile-details -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile-edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please edit carefully</h3>

							<form action="EditServlet" method="POST"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" name="user_email"
											class="form-control" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" name="user_name"
											class="form-control" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" name="user_password"
											class="form-control" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td><textarea class="form-control" row="3"
												name="user_about"><%=user.getAbout()%>
										</textarea></td>
									</tr>
									<tr>
										<td>New Profile pic :</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 		profile	modal ending -->

	<!-- 	 starting post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
					<button type="button" id = "clickMe" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					
					<form id = "add-post-form" action="AddPostServlet" method = "post" enctype="multipart/form-data">
					
						<div class = "form-group mb-3">
						<select class = "form-control" name = "cid">
							<option selected disabled>---Select Category---</option>
							<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for(Category c : list) {
							%>
							
								<option value="<%= c.getCid()%>"><%= c.getName() %></option>

							<%
								}
							%>
							
						</select>
					</div>
					
						<div class = "form-group mb-3">
							<input type = "text" name = "pTitle" placeholder = "Enter post Title" class = "form-control"/>
						</div>
						
						<div class = "form-group mb-3">
							<textarea name = "pContent" class = "form-control" style = "height:150px;" placeholder = "Enter your content"></textarea>
						</div>
						
						<div class = "form-group mb-3">
							<textarea name = "pCode" class = "form-control" style = "height:150px;" placeholder = "Enter your program (if you have)"></textarea>
						</div>
						
						<div class = "form-group mb-3">
							<label>Select your pic..</label> <br>
							<input name = "pic" type = "file" class = "form-control"/>
						</div>
						
						<div class = "container text-center">
							<button type= "submit" class = "btn btn-outline-primary">Post</button>
						</div>
					</form>
					
				</div>
				
			</div>
		</div>
	</div>

	<!--        ending post modal -->

	<!-- 		javascript -->
	
		<script  type="text/javascript" src = "js/myJs.js"></script>

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

	
<!-- 	sweet alert CDN -->
		<script src = "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<!--   edit profile java script -->
	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				//alert("button clicked...");

				if (editStatus == false) {
					$('#profile-details').hide();

					$("#profile-edit").show();

					editStatus = true;
					$(this).text("back");
				} else {
					$('#profile-details').show();

					$("#profile-edit").hide();

					editStatus = false;
					$(this).text("Edit");
				}

			})
		});
	</script>
	
<!-- 	add post javaScript -->
	<script>
		$(document).ready(function(e){
			//alert("lodead...");
			$("#add-post-form").on("submit", function(event){
				event.preventDefault();
				//console.log("post submited...")
				let form = new FormData(this);
				
				
				//requesting to server
				$.ajax({
					url: 'AddPostServlet',
					type: 'POST',
					data: form,
					success: function(data, textStatus, jqXHR){
						//success ...
						//console.log(data)
						if(data.trim() == 'done') {
							
							swal("Good job!", "Your post has saved!", "success");
							$("#clickMe").click();
							
						}
						else {
							swal("Error!", "Somthing went worng please try again...!", "error");
						}
						
					},
					error: function(jqXHR, textStatus, errorThrown) {
						//error...
						swal("Error!", "Somthing went worng please try again...!", "error");
						
					},
					processData: false,
					contentType: false
				});	
			});
		});
	</script>
	
<!-- 	loading post using ajax -->
	<script>
	
		function getPosts(catId, temp) {
			$("#loader").show();
			$("#post-container").hide();
			
			$(".c-link").removeClass("active");
			
			$.ajax({
				url: "load_posts.jsp",
				data: {cid: catId},
				success: function(data, textStatus, jqXHR){
					//console.log(data);
					$("#loader").hide();
					$("#post-container").html(data);
					
					$(temp).addClass('active');
					
					$("#post-container").show();
				}
			})
		}  
		$(document).ready(function(e){
			//alert("loading....");
			let allPostRef = $('.c-link')[0];
			getPosts(0, allPostRef);
			
		})
	</script>
	
</body>
</html>