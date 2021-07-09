package com.tech.blog.helper;

import java.sql.*;
public class ConnectionProvider {

	private static Connection con = null;
	public static Connection getConnection() {
			
		try {
			if(con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/techblog", "root", "Imt7368@");		
				
				return con;
			}
			else {
				return con;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}

