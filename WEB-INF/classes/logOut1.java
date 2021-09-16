import art.articlesPublished;
import art1.ment;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;


public class logOut1 extends HttpServlet {

    public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession(); 
           ArrayList<ment> mtu = (ArrayList<ment>) session.getAttribute("mtu");      
            
			
			mtu.clear();
			response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1);
			session.setAttribute("mtu",null);			
            session.invalidate();
			response.sendRedirect("index.jsp");
        
        
    }
    
    
}