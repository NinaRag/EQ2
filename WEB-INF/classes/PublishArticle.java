import java.io.*;
import java.util.*;
import java.lang.*;
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
//import com.oreilly.servlet.MultipartRequest;  
 
public class PublishArticle extends HttpServlet{


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  String arti;
	  String destPage = "studentdash.jsp";	
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");  
	  
	  HttpSession session = request.getSession();
			  
      try {
		   
		 String username = (String) session.getAttribute("dashBoardMail");
		 String articleName = request.getParameter("articleName");
		 String articleLink = request.getParameter("article");
		 //MultipartRequest m=new MultipartRequest(request,"d:/new");
		 
         Class.forName("com.mysql.jdbc.Driver");

         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		 
		 PreparedStatement st = conn.prepareStatement("insert into articles values(?, ?, ?)");
         st.setString(1, username);
		 st.setString(2, articleName);
		 st.setString(3, articleLink);
         int status = st.executeUpdate();
		 
		 if(status > 0){
				arti = "true";
			 session.setAttribute("arti",arti);
			
			response.setHeader("Location",destPage);
		      RequestDispatcher rd = request.getRequestDispatcher(destPage);
            rd.forward(request, response);
		 }
		 else{
			 out.println("false");
		 }
		 st.close();
         conn.close();		
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      }
	  out.close();
   }
}