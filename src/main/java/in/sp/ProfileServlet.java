package in.sp;

import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet1")
public class ProfileServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Set the content type to HTML
        response.setContentType("text/html");
        RequestDispatcher dis=null;
        
        // Write the form HTML
        
        dis=request.getRequestDispatcher("/Edit_profile.jsp");
   	  dis.forward(request, response);  
      
    }

}
