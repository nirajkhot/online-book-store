<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%

		Connection con;
			String id = request.getParameter("id");
			
			try {

				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");
				Statement st =con.createStatement();
				st.executeUpdate("delete from list where id="+id);
				out.println("Book is successfully removed from list");
				
				
			} catch (Exception e) {
				System.err.println("Got an exception! ");
				System.err.println(e.getMessage());

			}
			
		%>
</body>
</html>