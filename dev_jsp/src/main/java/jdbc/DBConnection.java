package jdbc;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","111");
			//DriverManager.getConnection(연결문자열, DB_ID, DB_PW) 으로 Connection 객체를 생성합니다.
			System.out.println("DB 연결 성공");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DB 연결 실패");
		}
		return conn;
	}

}
