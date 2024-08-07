package com.CRUD;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String mail = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		User user = new User(name, mail, phone, address);
		DatabaseConnection connection = new DatabaseConnection();
		String res =  connection.update(name, user);
		response.getWriter().println(res);
		response.sendRedirect("display.jsp");
	}

}
