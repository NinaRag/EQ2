import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.Statement;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;  
 
public class SignUp extends HttpServlet{


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  
	  String destPage = "thankYou.html";	
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
			  
      try {
		   
		 String emailid = request.getParameter("emailId");
		 String psw = request.getParameter("password");
		 String name = request.getParameter("name");
		 String contact = request.getParameter("ContactNo");
		 
         Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		 
		 PreparedStatement st = conn.prepareStatement("insert into members values(?, ?, ?, ?)");
         st.setString(1, emailid);
		 st.setString(2, psw);
		 st.setString(3, name);
		 st.setString(4, contact);
         int status = st.executeUpdate();
		 if(status > 0){
			   response.setStatus(response.SC_MOVED_TEMPORARILY);
	  		response.setHeader("Location",destPage);
			    RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
				dispatcher.forward(request, response);		
		 }
		 st.close();
         conn.close();		
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
}