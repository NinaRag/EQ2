import art1.student;
import art1.mentor;

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

public class admin extends HttpServlet{
	ArrayList<student> stu = new ArrayList<>() ;
	ArrayList<mentor> mt = new ArrayList<>() ;
	BigDecimal selfEsteem ;
	String maily ;
	String name ;
	String deg ;
	String yr ;
	String camp ;
	BigDecimal activity;
	String quiz1;
	String mentorName;
	String mentor;
	String quiz2;
   public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		mt.clear();
	stu.clear();
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  String state;
	  String ment;
	  String msg="hello";
	  boolean status=false;
	  boolean status1=false;
	  boolean status6=false;
	  
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	
      try {
		 String emailId = (String) request.getParameter("email");
		 String passcode = (String) request.getParameter("password");
		 
		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			HttpSession session = request.getSession();
		
           Statement ps=conn.createStatement();
			
			//query to display all records from table employee
			String q = "select * from student";
			
			//to execute query
			ResultSet rs=ps.executeQuery(q);
			
			//to print the resultset on console
			if(rs.next()){ 
				do{
					String name = rs.getString(1);
					String mail = rs.getString(2);
					String degree = rs.getString(3);
					String year= rs.getString(4);
					String campus= rs.getString(5);
					 state= rs.getString(7);
					
					if(state.equals("yes")==true){
					PreparedStatement ps1 = conn.prepareStatement("select * from ment_stu where mail= ?");
					ps1.setString(1,mail);
					
					ResultSet rs1 = ps1.executeQuery();
					status1=rs1.next();

					if(status1 == true){
					ment = rs1.getString("mentor");
					student st = new student(name,mail,degree,year,campus,ment);
					stu.add(st);
					
					}
					}
					else if(state.equals("no")==true){
					ment = "not matched";
					student st = new student(name,mail,degree,year,campus,ment);
					stu.add(st);
					}
					
					
					
				}while(rs.next());
			}
			else{
				out.println("Record Not Found...");
			}
			Statement ps1=conn.createStatement();
			
			//query to display all records from table employee
			String q1="select * from mentor";
			
			//to execute query
			ResultSet rs1=ps.executeQuery(q1);
			
			//to print the resultset on console
			if(rs1.next()){ 
				do{
					String name = rs1.getString(1);
					String mail = rs1.getString(2);
					String place = rs1.getString(3);
					String contact= rs1.getString(4);
					String qual= rs1.getString(5);
					String aff= rs1.getString(6);
					String eq= rs1.getString(7);
					String your= rs1.getString(8);
					String mente= rs1.getString(9);
					String emp= rs1.getString(10);
					String stati= rs1.getString(11);
					
					mentor mti = new mentor(name,mail,place,contact,qual,aff,eq,your,mente,emp,stati);
					mt.add(mti);
					
					
			//	out.println(stu);
			//	out.println("");
				}while(rs1.next());
			}
			else{
				out.println("Record Not Found...");
			}
			session.setAttribute("sti",stu);
			session.setAttribute("mt",mt);
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
	//	out.println(stu.get(0));
    /*     if(status == true){
		
			  em = rs.getString("mail");
			  pswd = rs.getString("pass1");
			  
			  if((passcode.equals(pswd))==true){
				
				String stat5 = "true";
				session.setAttribute("stat5",stat5);
				
				session.setAttribute("dashBoardMail", em);
				
		 
		
         PreparedStatement ps5=conn.prepareStatement("select * from student where mail=?");  
		 ps5.setString(1,emailId);
	     ResultSet rs5=ps5.executeQuery();  
         status6=rs5.next(); 
		 
         if(status6 == true){
			   maily = rs5.getString("mail");
			   name = rs5.getString("name");
			   deg = rs5.getString("degree");
			   yr = rs5.getString("year");
			   camp = rs5.getString("campus");
		 }
		
		 PreparedStatement ps1=conn.prepareStatement("select * from ideas where username=?");  
		 ps1.setString(1,emailId);
	     ResultSet rs1=ps1.executeQuery(); 
		 ArrayList<String> arr = new ArrayList<>();
         while(rs1.next()){
			String idea = (String)rs1.getString("idea");
			arr.add(idea);  
		 }
		 PreparedStatement ps6=conn.prepareStatement("select * from workshop where username=?");  
		 ps6.setString(1,emailId);
	     ResultSet rs6=ps6.executeQuery(); 
		 ArrayList<String> arr2 = new ArrayList<>();
         while(rs6.next()){
			String work = (String)rs6.getString("work");
			arr2.add(work);  
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
		
		  
		 PreparedStatement ps3=conn.prepareStatement("select score from quizlogs where username=?");  
		 ps3.setString(1,emailId);
	     ResultSet rs3=ps3.executeQuery(); 
		 
         if(rs3.next()){
			  quiz1 = "true";
			 activity=  rs3.getBigDecimal("score");
		 }else{
			  quiz1 = "false";
		 }
			session.setAttribute("quiz1",quiz1);
		
		 PreparedStatement ps4=conn.prepareStatement("select score from quizlogs1 where username=?");  
		 ps4.setString(1,emailId);
	     ResultSet rs4=ps4.executeQuery(); 
		 
         if(rs4.next()){
			 quiz2 = "true";
			 selfEsteem= rs4.getBigDecimal("score");
		 }else{
			 quiz2 = "false";
		 }
			 session.setAttribute("quiz2",quiz2);
		 
		 PreparedStatement ps7=conn.prepareStatement("select mentor from ment_stu where mail=?");  
		 ps7.setString(1,emailId);
	     ResultSet rs7=ps7.executeQuery(); 
		 
         if(rs7.next()){
			  mentor = "true";
			 mentorName = rs7.getString("mentor");
		 }else{
			  mentor = "false";
		 }
			session.setAttribute("mentor",mentor);
		// for(articlesPublished a : stu.articles){
	//		out.println(a.nameOfArticle + a.LinkOfAnArticle);
	//	 }
		 
		 StudentInfo st = new StudentInfo(name,maily,deg,yr,camp,arr,arr1,arr2,activity,selfEsteem,mentorName);
		 stu.add(st);
		 session.setAttribute("sti", stu);
		// session.setAttribute("stn", stu.userName);
				
			//	 for(StudentInfo p : stu){out.println(p.getwork());}
				
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
	
			  }else{
			String message1= "Password doesn't match";
			String stat1 = "true";
			String stat4 = "true";
			String stat6 = "true";
			request.setAttribute("message1",message1);
			request.setAttribute("stat1",stat1);
			session.setAttribute("stat4",stat4);
			session.setAttribute("stat6",stat6);
		    RequestDispatcher rd = request.getRequestDispatcher("studentReg.jsp");
            rd.forward(request, response);
			  }
         
		}
		else{
			
		String message1= "User not registered";
			String stat1 = "true";
			String stat4 = "true";
			String stat6 = "true";
			request.setAttribute("message1",message1);
			request.setAttribute("stat1",stat1);
			session.setAttribute("stat4",stat4);
			request.setAttribute("stat6",stat6);
		    RequestDispatcher rd = request.getRequestDispatcher("studentReg.jsp");
            rd.forward(request, response);
		}*/
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
