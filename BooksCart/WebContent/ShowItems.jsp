<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
		int bid = 0;
		String bname = null;
		int bprice = 0;
		String bauthor = null;

		try { /* Jdbc connection */

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1","root","root");

			Statement st = con.createStatement();
			out.println("<h1>Welcome to bookcart</h1><br>"); /* Normal user home page starts here */
			ResultSet rs1 = st.executeQuery("select*from list");
			out.println("<form action='Confirm.jsp'>");
			out.println("<pre><h2><b>       Books		</h2></b></pre>");
			out.println("<table border='2'><tr><th>select</th><th>Id</th><th>Name</th><th>Price</th><th>Author</th><th>Qty</th></tr>");
			while (rs1.next()) 
			{
				bid = rs1.getInt(1); /* Storing database books info */
				bname = rs1.getString(2);
				bprice = rs1.getInt(3);
				bauthor = rs1.getString(4);

				/* To print table of books and checkbox */
				out.println("<tr><td><input type='checkbox' name='id' value='" + bid + "'></td>" + "<td>" + bid
						+ "</td>" + "<td>" + bname + "</td>" + "<td>" + bprice + "</td>"+ "<td>" + bauthor + "</td>" 
						+ "<td><select name='numberofdays' id = 'numberofdays'>"
						+"<option value='1' selected='selected'>1</option>"
						+"<option value='2'>2</option>"
						+"<option value='3'>3</option></select>" +"</td></tr>");
			}
			out.println("</table>");
			out.println("<br>");
			out.println("<input type='submit' value='Buy Now' >"); /* This will go to add2cart.jsp */
			out.println("</form>");
			con.close();
			 

		} catch (Exception e) {

		}
	%>

</body>
</html>