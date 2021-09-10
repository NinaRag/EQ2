	 

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
 
public class studentLogin1 extends HttpServlet{

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  boolean status=false;
	  String destPage = "studentReg.jsp";	
	  String desPage = "incorrect.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	  			HttpSession session = request.getSession();

	
      try {
		 String emailId = (String) request.getParameter("emailId");
		 String name = (String) request.getParameter("name");
		 String year = (String) request.getParameter("year");
		 String campus = (String) request.getParameter("campus");
		 String degree = (String) request.getParameter("degree");
		 String pass1 = (String) request.getParameter("pass1");
		 String passcode = (String) request.getParameter("passcode");
		 
		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from pass where mail=?");  
		 ps.setString(1,emailId);
		 
		 
		
	     ResultSet rs=ps.executeQuery();  
		  
         status=rs.next();  
		 
         if(status == true){
		
			  em = rs.getString("mail");
			  pswd = rs.getString("password");
			  
			  if((passcode.equals(pswd))==true){
				 
				PreparedStatement st = conn.prepareStatement("insert into student values(?, ?, ?, ?, ?, ?, ?)");
				st.setString(1, name);
				st.setString(2, emailId);
				st.setString(3, degree);
				st.setString(4, year);
				st.setString(5, campus);
				st.setString(6, pass1);
				st.setString(7, "no");
				
				int status2 = st.executeUpdate();
				
				if(status2 > 0){
				String stat4 = "true";
			
			session.setAttribute("stat4",stat4);
		    RequestDispatcher rd = request.getRequestDispatcher("studentReg.jsp");
            rd.forward(request, response);
				}
			  }
         
		}
		
         
         rs.close();
         
         conn.close();
         
        
      }  catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
} 