<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User's Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            overflow-x: auto;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
            word-wrap: break-word;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        .operations {
            display: flex;
            gap: 10px;
        }
        .operations a {
            text-decoration:none;
            padding: 5px 10px;
            color: #fff;
            border-radius: 4px;
        }
        .edit {
            background-color: #28a745;
            
        }
        .delete {
        	
            background-color: #dc3545;
        }
        .add{
        	margin-top:10px;
        	margin-left : 45%;
        	
        	background-color : rgb(0,255,0);
        	border : 2px black solid;
        }
        .container a{
        	text-decoration : none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registered Users</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Operations</th>
            </tr>
            <%
                String url = "jdbc:mysql://localhost:3306/crud";
                String user = "root";
                String password = "maha";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                int id = 1;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String sql = "SELECT uname, umail, uphone, uaddress FROM crud.user_";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        //int id = rs.getInt("id");
                        String name = rs.getString("uname");
                        String email = rs.getString("umail");
                        String phone = rs.getString("uphone");
                        String address = rs.getString("uaddress");
                        id+=1;
            %>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= phone %></td>
                <td><%= address %></td>
                <td class="operations">
                    
                    
                    <form action="editUser.jsp?name=<%=name%>" method="post">
                    	<input type="submit" value="Edit" class="edit">
                    </form>
                    <form action="delete?name=<%=name%>" method="post">
                    	<input type="submit" value="Delete" class="delete">
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </table>
        <a href="register.jsp" class="add"><b>Add User</b></a>
    </div>
</body>
</html>
