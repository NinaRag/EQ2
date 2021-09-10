

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
import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

public class assign extends HttpServlet{
	
	BigDecimal selfEsteem ;
	String maily ;
	String name ;
	String place ;
	String contact ;
	String qualifica ;
	BigDecimal activity;
	String aff;
	String mentorName;
	String mentor;
	String quiz2;
   public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  String msg="hello";
	  boolean status=false;
	  boolean status6=false;
	  
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	
      try {
		  HttpSession session = request.getSession();
		 String emailId = (String) session.getAttribute("dashBoardMail");
		 int number = (String) request.getParameter("num");
		 

		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from student where status=?");  
		 ps.setString(1,"no");
		 
		
		int rsCount = 0;

//but notice that you'll only get correct ResultSet size after end of the while loop
		while(rs.next())
		{
    //do your other per row stuff 
		rsCount = rsCount + 1;
			}

		
	     ResultSet rs=ps.executeQuery();  
		  
         status=rs.next();  
        
		
			 out.println(rsCount);
         
		
		
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
