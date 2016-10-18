<!-- Registration Page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#F5F5DC">

<!-- Taking info from user & after Signup go to welcome page -->

	<form action="Welcome.jsp">
		<table border="2">
			<tr>
				<th>UserName</th>
				<th><input type="text" name="cname"></th>
			</tr>
			<tr>
				<th>Password</th>
				<th><input type="password" name="cpass"></th>
			</tr>
			<tr>
				<th>Full Name</th>
				<th><input type="text" name="fname"></th>
			</tr>
			<tr>
				<th>Email</th>
				<th><input type="text" name="cemail"></th>
			</tr>
			<tr>
				<th>Mobile No</th>
				<th><input type="text" name="cno"></th>
			</tr>
			<tr>
				<th>Address</th>
				<th><input type="text" name="caddr"></th>
			</tr>
		</table>
		<input type="submit" value="Signup">
	</form>
</body>
</html>