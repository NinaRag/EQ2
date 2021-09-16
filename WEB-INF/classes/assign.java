import art.articlesPublished;
import art1.stud;
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
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class assign extends HttpServlet{
	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;
	
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
	String flag3;
	String nam;
	String mail_men;
   public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      sti.clear();
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String em;
	  String pswd;
	  String mail;
	  String maily = null;
	  String namy = null;
	  String camp = null;
	  String yr = null;
	  String deg = null;
	  BigDecimal activity = null;
	  BigDecimal selfEsteem = null;
	  
	  
	  boolean status=false;
	  boolean status6=false;
	  
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	
      try {
		  HttpSession session = request.getSession();
		 String emailId = (String) session.getAttribute("dashBoardMail");
		  ArrayList<ment> mtu = (ArrayList<ment>) session.getAttribute("mtu"); 
		  ArrayList<String> student = new ArrayList<>();
		 int number = Integer.parseInt(request.getParameter("num"));

		 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         Statement ps=conn.createStatement();
			
			String staty ="no";
			//query to display all records from table employee
			String q = String.format("select * from student where status = '%s'",staty);
			
			//to execute query
			ResultSet rs=ps.executeQuery(q);
			int rsCount=0;
			//to print the resultset on console
			if(rs.next()){ 
				do{
					rsCount=rsCount+1;
					
					
					
				}while(rs.next());
			}
		   if(rsCount==0){
			  String flag4 ="true";
			  
			  session.setAttribute("flag4",flag4);
			  
			  RequestDispatcher rd = request.getRequestDispatcher("mentordash.jsp");
              rd.forward(request, response);
		   }
		   else if(rsCount != 0){
			  
			  if(number > rsCount){
				  String flag3 = "true";
				  session.setAttribute("flag3",flag3);
			  }
			   int i=0;
			   rs=ps.executeQuery(q);
			   if(rs.next()){ 
				do{
					 
					 mail=rs.getString(2);
					 for(ment m : mtu){nam =m.getName(); mail_men=m.getemailId();}
					PreparedStatement st = conn.prepareStatement("insert into ment_stu values(?, ?)");
					st.setString(1, mail);
					st.setString(2, mail_men);
					
				
					int status3 = st.executeUpdate();
					if(status3 > 0){
						i=i+1;
						PreparedStatement ps2=conn.prepareStatement("update student set status=? where mail=?");  
						ps2.setString(1,"yes");    
						ps2.setString(2,mail);    
		         
         
	     
                   int state4=ps2.executeUpdate(); 
				   if(state4 >0){
				   student.add(mail);
						PreparedStatement ps5=conn.prepareStatement("select * from student where mail=?");  
		             ps5.setString(1,mail);
	            ResultSet rs5=ps5.executeQuery();  
                    status6=rs5.next(); 
		 
            if(status6 == true){
			   maily = rs5.getString("mail");
			   namy = rs5.getString("name");
			   deg = rs5.getString("degree");
			   yr = rs5.getString("year");
			   camp = rs5.getString("campus");
			   setMailServerProperties();
				draftEmailMessage(maily,namy,nam);
				sendEmail(maily,namy,nam);
			   
		 }
		
		 			
		  
		 PreparedStatement ps7=conn.prepareStatement("select score from quizlogs where username=?");  
		 ps7.setString(1,mail);
	     ResultSet rs7=ps7.executeQuery(); 
		 
         if(rs7.next()){
			  
			 activity=  rs7.getBigDecimal("score");
		 }
		 PreparedStatement ps8=conn.prepareStatement("select score from quizlogs1 where username=?");  
		 ps8.setString(1,mail);
	     ResultSet rs8=ps8.executeQuery(); 
		 
         if(rs8.next()){
			 
			 selfEsteem= rs8.getBigDecimal("score");
		 }
		
		 stud ste = new stud(namy,maily,deg,yr,camp,activity,selfEsteem);
		 sti.add(ste);
		 
				   }
						
					}
					 
					 
					
				}while(rs.next() && i < number);
			  }
			  
			  
			  
			  request.setAttribute("sti", sti);
			  for(ment m : mtu){m.setwork(student);}
			  PreparedStatement ps1=conn.prepareStatement("update ment set student=? where email=?");  
		      ps1.setInt(1,i);    
		      ps1.setString(2,emailId);    
			      
              int state2=ps1.executeUpdate();  
			 if(state2 > 0){
				RequestDispatcher rd = request.getRequestDispatcher("mentordash.jsp");
              rd.forward(request, response);
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
    public void setMailServerProperties(){
        Properties emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
	}

	public MimeMessage draftEmailMessage(String username, String name, String nam) throws AddressException, MessagingException{
        String[] toEmails = { username };
        String emailSubject = " Mentor - assigned";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        
        for (int i = 0; i < toEmails.length; i++){
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        emailMessage.setContent("Hello"+ name + "\n" + "You have been assigned" + nam + "as mentor.You can see your mentor details in your dashboard." + "\n" + "We have allocated in a random manner. If you want an another mentor, kindly fill the feedback form with your requirements.", "text/html");
        return emailMessage;
    }

	public void sendEmail(String username, String name, String nam) throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "eqclub.ceg@gmail.com";
		String fromUserEmailPassword = "eqclubceg123";
		
		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		
		MimeMessage emailMessage = draftEmailMessage(username, name, nam);
		
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		
		transport.close();
		
	}
} 
