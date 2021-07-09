<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page isErrorPage = "true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry Somthing went wrong ! </title>
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
	<div class = "container text-center">
		<img alt="" src="img/error.png" class = "img-fluid">
		
		<p>Sorry ! Somthing  went wrong...</p>
		<%= exception%> <br>
		<a href = "index.jsp" style= "background:blue;" class = "btn btn-lg text-white mt-3">Home</a>
	</div>

</body>
</html>