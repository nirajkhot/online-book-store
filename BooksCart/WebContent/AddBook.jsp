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
		String bname = request.getParameter("bname");
		String bprice = request.getParameter("bprice");
		String bauthor = request.getParameter("bauthor");
		int bqty = Integer.parseInt(request.getParameter("bqty"));
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select count(name) from list");
			rs.next();
			int bnum = rs.getInt(1)+1;
			
			PreparedStatement pstm =con.prepareStatement("insert into list values(?,?,?,?,?)");
			pstm.setInt(1, bnum);
			pstm.setString(2, bname);
			pstm.setString(3, bprice);
			pstm.setString(4, bauthor);
			pstm.setInt(5, bqty);
			pstm.executeUpdate();
// 			int rs1 = st.executeUpdate("insert into list values('"+bnum+"','"+bname+"','"+bprice+"')");
			out.println("<br>New entry added!!");
			con.close();

		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());

		}
%>
</body>
</html>