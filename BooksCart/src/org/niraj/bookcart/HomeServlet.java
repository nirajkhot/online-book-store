package org.niraj.bookcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HomeServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String name = req.getParameter("uname"); /*  Store user name and password in name and password*/
		HttpSession session = req.getSession();
				session.setAttribute("theName",name);
		System.out.println(session.getAttribute("theName"));
		String password = req.getParameter("pass");

		String dbname = null;
		String dbpass = null;
		
		Connection con;

		try { /* Jdbc connection */

			Class.forName("com.mysql.jdbc.Driver");    
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");
			PrintWriter out = resp.getWriter();
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery("SELECT*FROM info2 WHERE username='" + name + "'");
			rs.next();
			dbname = rs.getString(1); /* Store database username and password  */
			dbpass = rs.getString(2);
			con.close();
			if (name.equals(dbname) && password.equals(dbpass)) {
				if (name.equals("niraj") && password.equals("pass")) { /* For super user login */
//	out.println("<jsp:forward page='/admin.jsp' />");
		 					out.println("<meta http-equiv='refresh' content='0;url=./admin.jsp'/>");		/* Go to admin.jsp to add books */

				} else {
					
					
//					out.println("<jsp:forward page='/ShowItems.jsp' />");
					out.print("<meta http-equiv='refresh' content='0; url=./ShowItems.jsp' />");
				}
			}
			
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}

		
		
	}

}
