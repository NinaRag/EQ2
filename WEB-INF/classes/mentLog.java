
import art.articlesPublished;
import art1.ment;
import art1.stud;

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

public class mentLog extends HttpServlet{
	ArrayList<ment> mtu = new ArrayList<>() ;
	ArrayList<stud> sti = new ArrayList<>() ;
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
      mtu.clear();
      sti.clear();
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  String maily = null;
	  String maili = null;
	  String namy = null;
	  String camp = null;
	  String yr = null;
	  String deg = null;
	  BigDecimal activity = null;
	  BigDecimal selfEsteem = null;
	  String msg="hello";
	  boolean status=false;
	  boolean status6=false;
	  
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	
      try {
		 String emailId = (String) request.getParameter("email");
		 String passcode = (String) request.getParameter("password");
		 
		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from ment where email=?");  
		 ps.setString(1,emailId);
		 
		HttpSession session = request.getSession();
		

		
	     ResultSet rs=ps.executeQuery();  
		  
         status=rs.next();  
         if(status == true){
		
			  em = rs.getString("email");
			  pswd = rs.getString("password");
			  
			  if((passcode.equals(pswd))==true){
				
				String state5 = "true";
				session.setAttribute("state5",state5);
				
				session.setAttribute("dashBoardMail", em);
				
		 
		
         PreparedStatement ps5=conn.prepareStatement("select * from ment where email=?");  
		 ps5.setString(1,emailId);
	     ResultSet rs5=ps5.executeQuery();  
         status6=rs5.next(); 
		 
         if(status6 == true){
			   maily = rs5.getString("email");
			   name = rs5.getString("name");
			   place = rs5.getString("place");
			   contact = rs5.getString("contact");
			   qualifica = rs5.getString("qual");
			   aff = rs5.getString("aff");
		 }
		
		 PreparedStatement ps1=conn.prepareStatement("select * from ideas where username=?");  
		 ps1.setString(1,emailId);
	     ResultSet rs1=ps1.executeQuery(); 
		 ArrayList<String> arr = new ArrayList<>();
         while(rs1.next()){
			String idea = (String)rs1.getString("idea");
			arr.add(idea);  
		 }
		 PreparedStatement ps6=conn.prepareStatement("select * from ment_stu where mentor=?");  
		 ps6.setString(1,maily);
	     ResultSet rs6=ps6.executeQuery(); 
		 ArrayList<String> arr2 = new ArrayList<>();
         while(rs6.next()){
			String student = (String)rs6.getString("mail");
			
			arr2.add(student); 
			PreparedStatement ps15=conn.prepareStatement("select * from student where mail=?");  
		             ps15.setString(1,student);
	            ResultSet rs15=ps15.executeQuery();  
                    status6=rs15.next(); 
		 
            if(status6 == true){
			   maili = rs15.getString("mail");
			   namy = rs15.getString("name");
			   deg = rs15.getString("degree");
			   yr = rs15.getString("year");
			   camp = rs15.getString("campus");
			   
		 }
		
		 			
		  
		 PreparedStatement ps17=conn.prepareStatement("select score from quizlogs where username=?");  
		 ps17.setString(1,student);
	     ResultSet rs17=ps17.executeQuery(); 
		 
         if(rs17.next()){
			  
			 activity=  rs17.getBigDecimal("score");
		 }
		 PreparedStatement ps18=conn.prepareStatement("select score from quizlogs1 where username=?");  
		 ps18.setString(1,student);
	     ResultSet rs18=ps18.executeQuery(); 
		 
         if(rs18.next()){
			 
			 selfEsteem= rs18.getBigDecimal("score");
		 }
		
		 stud ste = new stud(namy,maili,deg,yr,camp,activity,selfEsteem);
		 sti.add(ste);
		 }
		 
		 PreparedStatement ps2=conn.prepareStatement("select * from articles1 where username=?");  
		 ps2.setString(1,emailId);
	     ResultSet rs2=ps2.executeQuery(); 
		 
		 ArrayList<articlesPublished> arr1 = new ArrayList<>();
         while(rs2.next()){
			String articleName = (String)rs2.getString("nameOfArticle");
			String articleLink = (String)rs2.getString("articlelink");
			articlesPublished ap = new articlesPublished(articleName, articleLink);
			arr1.add(ap);  
		 }
		
		// for(articlesPublished a : stu.articles){
	//		out.println(a.nameOfArticle + a.LinkOfAnArticle);
	//	 }
		 
		 ment mt = new ment(name,maily,place,contact,qualifica,aff,arr,arr1,arr2);
		 mtu.add(mt);
		 session.setAttribute("mtu", mtu);
		 session.setAttribute("sti", sti);
		// session.setAttribute("stn", stu.userName);
				
			//	 for(StudentInfo p : stu){out.println(p.getwork());}
				
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
	
			}else{
			String messag1= "Password doesn't match";
			String state1 = "true";
			String state4 = "true";
			String state6 = "true";
			request.setAttribute("messag1",messag1);
			request.setAttribute("state1",state1);
			session.setAttribute("state4",state4);
			session.setAttribute("state6",state6);
		    RequestDispatcher rd = request.getRequestDispatcher("mentorReg.jsp");
            rd.forward(request, response);
			  }
         
		}
		else{
			
		String messag1= "User not registered";
			String state1 = "true";
			String state4 = "true";
			String state6 = "true";
			request.setAttribute("messag1",messag1);
			request.setAttribute("state1",state1);
			session.setAttribute("state4",state4);
			request.setAttribute("state6",state6);
		    RequestDispatcher rd = request.getRequestDispatcher("mentorReg.jsp");
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
