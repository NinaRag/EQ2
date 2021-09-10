import art.articlesPublished;
import art1.StudentInfo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;


public class logOut extends HttpServlet {

    public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession(); 
           ArrayList<StudentInfo> stu = (ArrayList<StudentInfo>) session.getAttribute("sti");      
            
			
			stu.clear();
			response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
			session.setAttribute("sti",null);			
            session.invalidate();
			response.sendRedirect("index.jsp");
        
        
    }
    
    
}