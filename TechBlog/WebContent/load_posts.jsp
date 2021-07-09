<%@page import = "com.tech.blog.dao.*, com.tech.blog.entities.User, com.tech.blog.helper.ConnectionProvider, com.tech.blog.entities.Post" %>
<%@page import = "java.util.*" %>
<div class = "row">
	
	<%
		Thread.sleep(500);
		PostDao d = new PostDao(ConnectionProvider.getConnection());
		int catId = Integer.parseInt(request.getParameter("cid"));
		List<Post> posts = null;
		if(catId == 0){
			posts = d.getAllPosts();
		}
		else {
			posts = d.getPostByCatId(catId);
		} 
// 		if there is no posts in any categories
		if(posts.size() == 0){
			out.println("<h3 style = 'color:red;' class = 'display-8 text-center'>there is no posts in this categories</h3>");
			return;
		}
		for(Post p : posts){
		%>
			<div class = "col-md-6 mt-2">
				<div class = "card">
					<img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="image not loaded" style = "height:200px;">
					<div class = "card-body">
						<b><%= p.getpTitle() %></b>
						<p><%= p.getpContent() %></p>
						
					</div>
					
					<div class = "card-footer text-center bg-primary">
					
						<%
							User user = (User) session.getAttribute("currentUser");
							LikeDao ldo = new LikeDao(ConnectionProvider.getConnection());
						%>
						<a href = "#!" onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>, this)" class = "btn btn-outline-light btn-sm"><i class = "fa fa-thumbs-o-up"></i> <span><%= ldo.countLikeOnPost(p.getPid()) %></span> </a>
						<a href = "show_blog_page.jsp?post_id=<%= p.getPid() %>" class = "btn btn-outline-light btn-sm"><span>Read More..</span> </a>
						<a href = "#!" class = "btn btn-outline-light btn-sm"><i class = "fa fa-commenting"></i> <span>20</span> </a>					
					</div>
				</div>
			</div>
		<%	
		}
	%>
</div>