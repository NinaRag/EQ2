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
 
public class EnterQuiz1 extends HttpServlet{

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  boolean status=false;
	  String destPage = "quiz1.html";	
	  String desPage = "incorrect.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	
      try {
		 String username = request.getParameter("email");
		// out.println(username);
		 String password = request.getParameter("password");
//		 out.println(password);
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from passwords1 where username=?");  
		 ps.setString(1,username);
		 
		
		
	     ResultSet rs=ps.executeQuery();  
		  
         status=rs.next();  
      //   out.println(status);
        if(status == true){
		
			  em = rs.getString("username");
			  pswd = rs.getString("passcode");
			  
			  if((password.equals(pswd))==true){
				response.setStatus(response.SC_MOVED_TEMPORARILY);
	  			response.setHeader("Location",destPage);
				RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
				dispatcher.forward(request, response);
			  }
         else{
			   response.setStatus(response.SC_MOVED_TEMPORARILY);
	  	           response.setHeader("Location",desPage);
			   RequestDispatcher dispatcher = request.getRequestDispatcher(desPage);
			    dispatcher.forward(request, response); 	
		}
		}
		
         out.close();
         rs.close();
         
         conn.close();
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      } 
   }
} 