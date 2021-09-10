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
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import java.util.Properties;
 import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
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

	
	
 
public class mentor_appr extends HttpServlet{
	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
      boolean status1=false;
	  int status2;
	  String name=null;
	  String emailid=null;
	  String place=null;
	  String contact=null;
	  String qual=null;
	  String aff=null;
	  
	  String desPage = "studentReg.jsp";	
	  String destPage = "index.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
			  HttpSession session = request.getSession();
      try {
		   
		 String em1 = request.getParameter("value1");
		 String em = request.getParameter("value2");
		 String email = request.getParameter("col2");
		 ArrayList<mentor> mt = new ArrayList<>() ;
		 
		mt = (ArrayList<mentor>) session.getAttribute("mt");
		 
		 Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		 
		 if(em != null){
			 if(em.equals("Rejected")==true){
		 
			
			
		 
		// String articleLink = request.getParameter("article");
		 //MultipartRequest m=new MultipartRequest(request,"d:/new");

         
        
		
		 PreparedStatement ps=conn.prepareStatement("update mentor set status=? where email=?");  
		 ps.setString(1,em);    
		 ps.setString(2,email);    
         
	     
         int state1=ps.executeUpdate();  
		 
		 
		 if(state1>0){
			 
			 for(mentor m : mt){ 
			if(m.emailId.equals(email)==true){
				m.setstatus(em);
				name = m.getName();
			}
			}
			
			setMailServerProperties();
			draftEmailMessage(email,name);
			sendEmail(email,name);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
    
			
			
			 
		 
		 }
		 ps.close();
		 }
		 }
		 else if(em1 != null){
			 if(em1.equals("Approved")==true){
		 
			
			
		 
		// String articleLink = request.getParameter("article");
		 //MultipartRequest m=new MultipartRequest(request,"d:/new");

         
      
		
		 PreparedStatement ps=conn.prepareStatement("update mentor set status=? where email=?");  
		 ps.setString(1,em1);    
		 ps.setString(2,email);    
         
	     
         int state2=ps.executeUpdate();  
		 
		 
		 if(state2>0){
			 
			 for(mentor m : mt){ 
			if(m.emailId.equals(email)==true){
				m.setstatus(em1);
				name = m.getName();
				emailid=m.getemailId();
				place=m.getplace();
				contact=m.getcontact();
				qual=m.getqualification();
				aff=m.getaffiliation();
				
			}
			}
			
			  int length = 10;
		
			String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			String Small_chars = "abcdefghijklmnopqrstuvwxyz";
			String numbers = "0123456789";
			String symbols = "!@#$%^&*_=+-/.?<>)";
  
  
			String values = Capital_chars + Small_chars +
                        numbers + symbols;
  
			Random rndm_method = new Random();
  
			char[] password = new char[length];
  
			for (int i = 0; i < length; i++){
				password[i] =
				values.charAt(rndm_method.nextInt(values.length()));
			}
		
			String passwd = new String (password);
			
			
			
			setMailServerProperties1();
			draftEmailMessage1(email, passwd,name);
			sendEmail1(email,passwd, name);
			
			 PreparedStatement st = conn.prepareStatement("insert into ment values(?, ?, ?, ?, ?, ?, ?, ?)");
				st.setString(1, name);
				st.setString(2, emailid);
				st.setString(3, passwd);
				st.setString(4, place);
				st.setString(5, contact);
				st.setString(6, qual);
				st.setString(7, aff);
				st.setString(8, null);
				
				
				int status3 = st.executeUpdate();
				
				if(status3>0){			
			
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
				}
			
			
			 
		 
		 }
		 ps.close();
		 }
		 }
		 
         conn.close();		
      } catch(SQLException se) {
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

	public MimeMessage draftEmailMessage(String username, String name) throws AddressException, MessagingException{
        String[] toEmails = { username };
        String emailSubject = " Mentor Application - Rejected";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        
        for (int i = 0; i < toEmails.length; i++){
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        emailMessage.setContent("Hello"+ name + "</br>" + "We are really glad that you have applied for our program. However, we are extremely sorry to say that your application has been found not to be suitable for our mentor program. </br> Thank you so much for your interest", "text/html");
        return emailMessage;
    }

	public void sendEmail(String username, String name) throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "eqclub.ceg@gmail.com";
		String fromUserEmailPassword = "eqclubceg123";
		
		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		
		MimeMessage emailMessage = draftEmailMessage(username, name);
		
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		
		transport.close();
		
	}
	public void setMailServerProperties1(){
        Properties emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
	}

	public MimeMessage draftEmailMessage1(String username, String password, String name) throws AddressException, MessagingException{
        String[] toEmails = { username };
        String emailSubject = " Mentor application - Accepted";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        
        for (int i = 0; i < toEmails.length; i++){
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        emailMessage.setContent("Hello"+ name + "</br>" + " We are glad to say that you have been accepted as a mentor for EQ club. Thank you so much for your interest. We will contact you shortly. Kindly go to the mentor login page and login with this one time password:"+password, "text/html");
        return emailMessage;
    }

	public void sendEmail1(String username, String password, String name) throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "eqclub.ceg@gmail.com";
		String fromUserEmailPassword = "eqclubceg123";
		
		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		
		MimeMessage emailMessage = draftEmailMessage1(username, password, name);
		
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		
		transport.close();
		
	}
   
}