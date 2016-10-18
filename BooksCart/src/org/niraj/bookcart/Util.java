package org.niraj.bookcart;

/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
*/

public class Util {
	
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	/*public static void main(String[] args) {
		Connection con;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/niraj_1", "root", "root");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select*from info2 where username='"+name+"'");
			con.close();
		}catch(Exception e){
			
		}
	}
*/
}
