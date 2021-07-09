package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddPostServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().println("AddPostServlet");
		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
	
//		getting current user Id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getId(); 

		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, userId);
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			
			String path = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			response.getWriter().println("done");
		}
		else {
			response.getWriter().println("error");
		}
		
	}

}
