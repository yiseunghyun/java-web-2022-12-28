package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnector {

	private static final String DATABASE_URL = "jdbc:mysql://127.0.0.1:3306/peed";
	private static final String USER_NAME = "";
	private static final String USER_PASSWORD = "";
	
	public static Connection createConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			
			DriverManager.getConnection(DATABASE_URL,USER_NAME,USER_PASSWORD);
		} catch(Exception exception) {
			return null;
		}
		return null;
		
	}
}
