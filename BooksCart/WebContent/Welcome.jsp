<!-- For valid info  go to home else go to login page -->

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




	<%-- <%!public boolean validate(String name){
		int counter=0;
		for(int i=0;i<=name.length();i++){
			char c = name.charAt(i);
			if(c=='.'||c=='@'){
				counter++;
			}
		}
		
		if(counter>=2){
		return true;
		}else{
			return false;
		}
	} %> --%>
	
	
	<%
		String new_name = request.getParameter("cname");		/*store request in variable  */
		String new_pass = request.getParameter("cpass");
		String new_fname = request.getParameter("fname");
		String new_email = request.getParameter("cemail");
		String new_no = request.getParameter("cno");
		String new_addr = request.getParameter("caddr");
		
		Connection con1 = null;

		try {		/* jdbc connection */
			Class.forName("com.mysql.jdbc.Driver");

			con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");
// 			PreparedStatement pstm =con1.prepareStatement("select*from info2 where username=");
			Statement st1 = con1.createStatement();
			ResultSet rs = st1.executeQuery("select*from info2 where username='" + new_name + "'");
			
// 			if username already exists then go back


			if (rs.next() && new_name.equals(rs.getString(1))) {
			
				
				out.println("Username already exists<br><br>");
				out.println("<h2>Simon, <a href='Register.jsp'>Go Back</a><h2>");

			}

// 			valid info then login

			else {
				
					int rs3 = st1.executeUpdate("insert into info2 values('" + new_name + "','" + new_pass +"','"+new_email+"','"+new_no+"','"+new_addr+"','"+new_fname+ "')");
				 	out.println("Thank you! Account has been created");
					out.println("<a href='login.html'>Go to Home</a>");	
				 }
				
					
				 
			
			con1.close();
		} catch (Exception e) {

		}
	%>


</body>
</html>