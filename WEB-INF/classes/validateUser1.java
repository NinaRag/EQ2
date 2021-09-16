
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

public class validateUser1 extends HttpServlet{
	
	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;
	  
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  boolean status=false;
	  
	  String destPage = "quiz_login2.html";	
	  String desPage = "done.html";
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	  
      try {
		 String username = request.getParameter("emailId");
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
         PreparedStatement ps=conn.prepareStatement("select * from quizlogs1 where username=?");  
		 ps.setString(1,username);    
      
	     ResultSet rs=ps.executeQuery();  
         status=rs.next();  
         
         if(status){
			response.setStatus(response.SC_MOVED_TEMPORARILY);
	  		response.setHeader("Location",desPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher(desPage);
			dispatcher.forward(request, response);
         }
		 else{
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
			
			setMailServerProperties();
			draftEmailMessage(username, passwd);
			sendEmail(username, passwd);
		
			ps=conn.prepareStatement("delete from passwords1 where username=?");  
			ps.setString(1,username);  
			int state=ps.executeUpdate(); 
      
			ps=conn.prepareStatement("insert into passwords1 values(?, ?)");  
			ps.setString(1,username);
			ps.setString(2,passwd);
			int state1=ps.executeUpdate();
			
			if(state1 > 0){
				response.setStatus(response.SC_MOVED_TEMPORARILY);
	  		        response.setHeader("Location",destPage);
				RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
				dispatcher.forward(request, response);	
			}
		 }
         out.close();
         rs.close();
         
         conn.close(); 
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      } 
   }
   
   public void setMailServerProperties(){
        Properties emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", "587");
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        mailSession = Session.getDefaultInstance(emailProperties, null);
	}

	public MimeMessage draftEmailMessage(String username, String password) throws AddressException, MessagingException{
        String[] toEmails = { username };
        String emailSubject = "Quiz2 password from eq club";
        MimeMessage emailMessage = new MimeMessage(mailSession);
        
        for (int i = 0; i < toEmails.length; i++){
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }
        emailMessage.setSubject(emailSubject);
        emailMessage.setContent(password, "text/html");
        return emailMessage;
    }

	public void sendEmail(String username, String password) throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "eqclub.ceg@gmail.com";
		String fromUserEmailPassword = "cegeq123";
		
		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		
		MimeMessage emailMessage = draftEmailMessage(username, password);
		
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		
		transport.close();
		
	}
     

} 