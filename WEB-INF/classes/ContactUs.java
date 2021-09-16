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
 
public class ContactUs extends HttpServlet{


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String contact;
	String destPage = "index.jsp";	
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
	
			  
      try {
		   
		 String username = request.getParameter("username");
		 String emailId = request.getParameter("emailId");
		 String message = request.getParameter("Message");
		 
        Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		 
		 PreparedStatement st = conn.prepareStatement("insert into inbox values(?, ?, ?)");
         st.setString(1, username);
		 st.setString(2, emailId);
		 st.setString(3, message);
		 
         int status = st.executeUpdate();
		 if(status > 0){
			 contact = "true";
			 
			 request.setAttribute("contact",contact);
			
		      RequestDispatcher rd = request.getRequestDispatcher(destPage);
            rd.forward(request, response);		
		 }
		 st.close();
         conn.close();				
	//out.println(username);
//	out.println(message);
      }catch(SQLException se) {
         se.printStackTrace();
      }catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
}