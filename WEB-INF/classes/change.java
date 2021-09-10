import art.articlesPublished;
import art1.ment;

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

public class change extends HttpServlet{
	
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
		 String passcode = (String) request.getParameter("password");
		 String passcode1 = (String) request.getParameter("pass1");
		   ArrayList<ment> mtu = (ArrayList<ment>) session.getAttribute("mtu"); 
		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from ment where email=?");  
		 ps.setString(1,emailId);
		 
		
		

		
	     ResultSet rs=ps.executeQuery();  
		  
         status=rs.next();  
        
		
			  em = rs.getString("email");
			  pswd = rs.getString("password");
			  
			  if((passcode.equals(pswd))==true){
				
		      PreparedStatement ps1=conn.prepareStatement("update ment set password=? where email=?");  
		      ps1.setString(1,passcode1);    
		      ps1.setString(2,em);    
         
	     
             int state2=ps1.executeUpdate();  
			 
			 if(state2>0){
				 String flag1 = "true";
				 request.setAttribute("flag1",flag1); 
				 String state6 = "true";
				 request.setAttribute("state6",state6);
				      
            
			
				mtu.clear();
				response.setHeader("Pragma","no-cache"); 
			response.setHeader("Cache-Control","no-store"); 
				response.setHeader("Expires","0"); 
				response.setDateHeader("Expires",-1);
			session.setAttribute("mtu",null);			
            session.invalidate();
				 RequestDispatcher rd = request.getRequestDispatcher("mentorReg.jsp");
                 rd.forward(request, response);
			 }
	
			}else{
			String messag= "Password doesn't match";
			String flag = "true";
			String state4 = "true";
			String state6 = "true";
			request.setAttribute("messag",messag);
			request.setAttribute("flag",flag);
			
		    RequestDispatcher rd = request.getRequestDispatcher("change.jsp");
            rd.forward(request, response);
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
