import art.articlesPublished;
import art1.StudentInfo;

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
 
public class Results extends HttpServlet{

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL="jdbc:mysql://localhost/eqclub";
      String USER = "root";
      String PASS = "Salai123";
	  boolean status=false;
	  String destPage = "studentdash.jsp";	
      PrintWriter out = response.getWriter();	
	  response.setContentType("text/html");
	HttpSession session = request.getSession();
      try {
		 String username = (String) session.getAttribute("dashBoardMail");
		 String res = request.getParameter("result");
		 String arr = request.getParameter("array");
	//	 out.println(username);
//		 out.println(res);
//		 out.println(arr);
         Class.forName("com.mysql.jdbc.Driver");   
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		
		PreparedStatement st = conn.prepareStatement("insert into quizlogs values(?, ?, ?)");
		st.setString(1, username);
		st.setString(2, res);
		st.setString(3, arr);
			 
		int stat = st.executeUpdate();
		if(stat > 0){
			String quiz1 = "true";
			ArrayList<StudentInfo> stu = new ArrayList<>() ;
			stu = (ArrayList<StudentInfo>) session.getAttribute("sti");
			session.setAttribute("quiz1",quiz1);
			BigDecimal resi = new BigDecimal(res);
			
			for(StudentInfo p : stu){p.setactivityScore(resi);}
			
			//for(StudentInfo p : stu){out.println(p.activityScore);}
			response.setStatus(response.SC_MOVED_TEMPORARILY);
	  		response.setHeader("Location",destPage);
			RequestDispatcher rd = request.getRequestDispatcher(destPage);
			
           rd.forward(request, response);	
		}
		 
		
         out.close();    
         conn.close();
      } catch(SQLException se) {
         se.printStackTrace();
      } catch(Exception e) {
         e.printStackTrace();
      } 
   }
}