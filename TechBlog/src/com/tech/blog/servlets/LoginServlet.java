package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;



public class LoginServlet extends HttpServlet {
	
    public LoginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetching data from login 
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u == null) {
			
		
			//response.getWriter().println("invalid email and password");
			Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
			
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("login_page.jsp");
		} 
		else {
			
			
//			Login success......
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}

}
