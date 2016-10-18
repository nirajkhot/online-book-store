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
<body bgcolor="tan">

	<%
		String name = request.getParameter("uname"); /*  Store user name and password in name and password*/
		session.setAttribute("theName",name);
		System.out.println(session.getAttribute("theName"));
		String password = request.getParameter("pass");

		String dbname = null;
		String dbpass = null;
		
		Connection con;

		try { /* Jdbc connection */

			Class.forName("com.mysql.jdbc.Driver");    
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");

			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery("SELECT*FROM info2 WHERE username='" + name + "'");
			rs.next();
			dbname = rs.getString(1); /* Store database username and password  */
			dbpass = rs.getString(2);
			con.close();
			if (name.equals(dbname) && password.equals(dbpass)) {
				if (name.equals("niraj") && password.equals("pass")) { /* For super user login */
	%>
	out.println("<jsp:forward page='/admin.jsp' />");<%
		// 					out.println("<meta http-equiv='refresh' content='0;url=./admin.jsp'/>");		/* Go to admin.jsp to add books */

				} else {
					%>out.println("<jsp:forward page='/ShowItems.jsp' />");<%
				}
			}
			
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
	%>


</body>
</html>