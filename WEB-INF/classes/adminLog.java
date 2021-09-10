
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

	
	
 
public class adminLog extends HttpServlet{
	
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
      boolean status1=false;
	  String em;
	  String pswd;
	  int status2;
	  
	  String desPage = "studentReg.jsp";	
	  String destPage = "index.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
	
	  HttpSession session = request.getSession();
      try {
		   
		 String emailId = request.getParameter("email");
		 String pass1 = request.getParameter("password");
		
		 
		// String articleLink = request.getParameter("article");
		 //MultipartRequest m=new MultipartRequest(request,"d:/new");

         
      Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		 
		 PreparedStatement ps=conn.prepareStatement("select * from admin where email=?");  
		 ps.setString(1,emailId);    
         
	     ResultSet rs=ps.executeQuery();  
         status1=rs.next();  
		 
		 
		 if(status1==true){		 
			  em = rs.getString("email");
			  pswd = rs.getString("password");
			  
			  if( emailId.equals(em)==true && pass1.equals(pswd)==true){
				  
			String flag1 ="true";
			session.setAttribute("flag1",flag1);
			RequestDispatcher rd = request.getRequestDispatcher("/admin");
            rd.forward(request, response);
			  }
			
			 
		 
		 else{
			String message= "Password does not match";
			String stat = "true";
			request.setAttribute("message",message);
			request.setAttribute("stat",stat);
		    RequestDispatcher rd = request.getRequestDispatcher("adminLog.jsp");
            rd.forward(request, response); 
		  
		 }
		 }
		 else{
			 String message= "Admin with this username does not exist";
			String stat = "true";
			request.setAttribute("message",message);
			request.setAttribute("stat",stat);
		    RequestDispatcher rd = request.getRequestDispatcher("adminLog.jsp");
            rd.forward(request, response); 
		 }
		 ps.close();
         conn.close();		
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
 
}