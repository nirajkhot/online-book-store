
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="AddBook.jsp">
		<h1>To Add Book</h1><br><br>
		Enter book name: <input type='text' name='bname'><br>
		Enter price: 	<input type='text' name='bprice'><br>
		Enter author: 	<input type='text' name='bauthor'><br>
		Enter qty: 	<input type='text' name='bqty'><br>
		Add to collection: <input type='submit' value='store'><br><br><br><br>
	</form>
	
	<form action ="delete.jsp">
		<h1>To remove books</h1><br><br>
		Enter id=<input type ="text" name ="id"><br>
		To Remove Books Click Here<br>
		<input type ="submit" value ="Remove book">
	</form>
</body>
</html>