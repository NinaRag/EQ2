

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

	
	
 
public class mentorReg extends HttpServlet{
	

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
      boolean status1=false;
	  int status2;
	  
	  String desPage = "studentReg.jsp";	
	  String destPage = "index.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
			  
      try {
		   
		 String emailId = request.getParameter("emailId");
		 String name = request.getParameter("name");
		 String place = request.getParameter("place");
 	 String phone = request.getParameter("phone1");
		 String qual = request.getParameter("qual");
		 String aff = request.getParameter("aff");
		 String em = request.getParameter("em");
		 String your = request.getParameter("your");
		 String ment = request.getParameter("ment");
		 String emp = request.getParameter("emp");
		 
		String articleLink = request.getParameter("article");
	//	MultipartRequest m=new MultipartRequest(request,"d:/new");

         
     Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		 
		 PreparedStatement ps=conn.prepareStatement("select * from mentor where email=?");  
		 ps.setString(1,emailId);    
         
	     ResultSet rs=ps.executeQuery();  
         status1=rs.next();  
		 
		 
		 if(status1){
			 
			String message= "User mail id is already registered";
			String stat = "true";
			request.setAttribute("message",message);
			request.setAttribute("stat",stat);
		    RequestDispatcher rd = request.getRequestDispatcher("mentorReg.jsp");
            rd.forward(request, response);
    
			
			
			 
		 }
		 else{
		 
			 
		 PreparedStatement st = conn.prepareStatement("insert into mentor values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				st.setString(1, name);
				st.setString(2, emailId);
				st.setString(3, place);
				st.setString(4, phone);
				st.setString(5, qual);
				st.setString(6, aff);
				st.setString(7, em);
				st.setString(8, your);
				st.setString(9, ment);
				st.setString(10, emp);
				st.setString(11, null);
				
				status2 = st.executeUpdate();
				
				if(status2 > 0){
				String val1 = "true";
				
				request.setAttribute("val1",val1);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			
				}
		 }	 ps.close();
        conn.close();		
      }catch(SQLException se) {
        se.printStackTrace();
	  }catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
   
}