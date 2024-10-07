package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
	private static Connection con;


	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phoneBook","root","manishgiri");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
