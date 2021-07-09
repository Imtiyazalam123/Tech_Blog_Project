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

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;


@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email  = request.getParameter("user_email");
		String name  = request.getParameter("user_name");
		String password  = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
//		get the User from session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		String oldFile = user.getProfile();
		user.setProfile(imageName);
		
		//update database..........
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);
		if(ans) {
			
			
			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
			String oldPath = request.getRealPath("/") + "pics" + File.separator + oldFile;
			
			if(!oldFile.equals("default.png")) {
					Helper.deleteFile(oldPath);
			}
			
			if(Helper.saveFile(part.getInputStream(), path)) {
				//response.getWriter().println("profile updated");
				
				Message msg = new Message("profile details updated", "success", "alert-success");
				
				s.setAttribute("msg", msg);
			}
			else {
				////////
				Message msg = new Message("Somthing went wrong.. !", "error", "alert-danger");
				
				s.setAttribute("msg", msg);
			}
		}
		else {
		///	response.getWriter().println("not updated");
			Message msg = new Message("Somthing went wrong.. !", "error", "alert-danger");
			
			s.setAttribute("msg", msg);
		}
		
		response.sendRedirect("profile.jsp");
		
	}

}
