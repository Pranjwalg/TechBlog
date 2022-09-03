package com.techblog.helper;
import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		
		
		
		try {
	if (con==null) {
		
	
			//load a driver class
			Class.forName("com.mysql.jdbc.Driver");	
				
			//establish connection
			con=DriverManager
	.getConnection("jdbc:mysql://localhost:3306/Techblog","root","Pranjwal@95");

		
			
	}
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return con;
		
	}
	
}