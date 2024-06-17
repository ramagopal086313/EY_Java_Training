package com.ey.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnect 
{
	public static Connection getConenction() throws Exception 	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","pass@word1");
		return con;
	}
}
