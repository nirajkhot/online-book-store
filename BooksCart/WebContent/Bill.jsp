<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> ThankYou!!!</h1>
	<h2>Your Order Is Successfully Placed</h2>
	
	<%
	
		String na =(String)session.getAttribute("theName");
	
		System.out.println(na);
		Random random = new Random();
		long randomint =random.nextLong();
	Connection con;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1","root","root");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select*from info2 where username='"+na+"'");
		rs.next();
		
// <!-- 			<h1><center> Bill!!!!</center></h1> -->
		
	
		out.println("<pre>Order No: BK" + randomint+"\t\tDate:"+new Date()+"</pre><br><br>");		
		out.println("Name :"+rs.getString(6)+"<br>");
		out.println("Address :"+rs.getString(5)+"<br>");
		out.println("Mobile No:"+rs.getLong(4)+"<br>");
		out.println("Email :"+rs.getString(3)+"<br>");
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	

	%>
</body>
</html>