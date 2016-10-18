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
		int dbid = 0;
		String dbname = null;
		int dbprice = 0;
		int tot = 0;
		int counter = 0;
		int tq=0;

		Connection con;

		try { /* Jdbc connection */

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");
			Statement st = con.createStatement();
			String na =(String)session.getAttribute("theName");
			ResultSet rs1 = st.executeQuery("select*from info2 where username='"+na+"'");
			rs1.next();
			out.print("<h1><b>Delivery</b></h1><br>");
			out.print(""+rs1.getString(6)+"<br>");
			out.print("Address : "+rs1.getString(5)+"<br>");
			out.print("Email : "+rs1.getString(3)+"<br>");
			out.print("Mobile No : "+rs1.getLong(4)+"<br>");
			out.print("<form action='address.jsp'><input type='submit' value='Change Address'></form>");
			
			String qty[] = request.getParameterValues("numberofdays");
			
					
			
			String select[] = request
					.getParameterValues("id"); /* Created an array of checked values with name 'id'  */

			if (select != null && select.length != 0) {
				out.println("You have selected: <br>");
				out.println("<table border='2'><tr><th>Name</th><th>Author</th><th>Price</th><th>Qty</th></tr>");
				for (int i = 0; i < select.length; i++) {
					ResultSet rs = st.executeQuery("SELECT*FROM list WHERE id='" + select[i] + "'");
					rs.next();
					int qty1 = Integer.parseInt(qty[i]);
					 tq = tq + Integer.parseInt(qty[i]);
					tot = tot + rs.getInt(3)*qty1; /* Total amount */
					out.println("<tr><td>" +  rs.getString(2)+ "</td>" + "<td>" +rs.getString(4)+ "</td>" + "<td>" +rs.getInt(3)*qty1+ "<td>" +qty[i]+ "</td>"+ "</td></tr>");
// 					out.println(rs.getInt(1) + "....." + rs.getString(2) + "....." + rs.getInt(3) + "<br><br>");
					counter++;
				}
				out.print("<tr><td>Total :</td><td></td><td>"+tot+"</td><td>"+tq+"</td></tr>");
				out.println("</table>");
				out.println("<br>");
				
				/* out.println("Total Item added: " + counter + "<br><br>");
				out.println("<br>Total cart value: " + tot + "<br><br>"); */
				
				/* out.println("<form action='ShowItems.jsp'><input type='submit' value='Add More'></form>");
				out.println("<form action='remove.jsp'><input type='submit' value='Remove Item'></form><br><br>"); */
				out.println("To Confirm your order click Buy");
				out.println("<form action='Bill.jsp'><input type='submit' value='Continue'></form><br>");
				out.println("<form action='Cancle.jsp'><input type='submit' value='cancle'></form>");
				// 				out.println("<br><br>Your purchased products will be delivered within 2 weeks");
			} else {
				out.println("Your cart is empty. :( <br>Please add something.");
			}

			con.close();
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
	%>
</body>
</html>