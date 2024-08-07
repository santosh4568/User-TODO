package com.CRUD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseConnection {
	private String dburl = "jdbc:mysql://localhost:3306/crud";
	private String dbuser = "root";
	private String dbpassword = "maha";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection() {
		
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public String insert(User user) {
		loadDriver(dbDriver);
		String reString = "Value inserted Successfully.";
		
		Connection connection = getConnection();
		String sqlString = "insert into crud.user_ values(? , ? ,? ,?)";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sqlString);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getMail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getAddress());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			reString = "Data not inserted!!";
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return reString;
	}
	
	public String delete(String name) {
		loadDriver(dbDriver);
		Connection connection = getConnection();
		String res = "Deleted Successfully";
		String sql  = "DELETE FROM crud.user_ WHERE uname=?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			res = "Error while deletion.";
			e.printStackTrace();
		}
		return res;
	}
	
	public String update(String name , User user) {
		loadDriver(dbDriver);
		Connection connection = getConnection();
		String res = "Updation Successful";
		String sql = "update crud.user_ set umail=? , uphone=? , uaddress=? where uname=?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, user.getMail());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getAddress());
			ps.setString(4, name);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			res="Updation Failed";
			e.printStackTrace();
		}
		
		return res;
	}
}
