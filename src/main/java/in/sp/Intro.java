package in.sp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Intro
 */
@WebServlet("/hell")
public class Intro extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out= response.getWriter();

       HttpSession session= request.getSession();
		RequestDispatcher dis=null;
       try{
           //load the driver:
           Class.forName("com.mysql.cj.jdbc.Driver");

           //creating connection

           String url = "jdbc:mysql://localhost:3306/newblog";
           String username ="root";
           String password = "Pass@123";
           Connection con = DriverManager.getConnection(url,username,password);
           if(session!=null)
           {

           String q1=("select * from users where uemail=?");
           PreparedStatement pstmt = con.prepareStatement(q1);
          
           String loggedInUsername = (String)session.getAttribute("UEmail");
          
           pstmt.setString(1, loggedInUsername);
           
           
           ResultSet rs= pstmt.executeQuery();
           if(rs.next())
           {
        	   String Name=rs.getString("uname");
        	   String Email= rs.getString("uemail");
        	   String Gen=rs.getString("uGen");
        	   
        	   
        	   session.setAttribute("NAME",Name);
        	   session.setAttribute("EMAIL",Email); 
        	   session.setAttribute("Gender",Gen );
        	   dis = request.getRequestDispatcher("/profile.jsp");
               dis.forward(request, response);
           }
          
           }
             
           else
           {
        	  out.println("User not found");
           }
           
         
       }
        
          
       
	
       catch (Exception e)
       {
      	  e.printStackTrace();
      	  
      	 response.setContentType("text/html");
       	out.print("<h3 style='color:red'> "+e.getMessage()+"</h3>");
     	   dis=request.getRequestDispatcher("/profile.jsp");
     	   dis.include(request, response);
         
       }
	}

}
