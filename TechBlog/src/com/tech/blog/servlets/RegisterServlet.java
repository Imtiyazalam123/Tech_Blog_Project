package com.tech.blog.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
//		fetching all data from form
		
		String check = request.getParameter("user_check");
		if(check == null) {
			out.println("box did'nt check please accept term and condition");
		}
		else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("user_gender");
			String about = request.getParameter("about");
			
//			creating User object and set all data to that Object
			User user = new User(name, email, password, gender, about);
			
//			creating UserDao Object to sent data into database
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
		
	}
}
