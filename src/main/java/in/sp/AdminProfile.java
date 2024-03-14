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
 * Servlet implementation class Login
 */
@WebServlet("/AdminProf")

public class AdminProfile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		 String uemail1 = request.getParameter("Uusername");
         String upass= request.getParameter("Upassword");
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

             String q1=("select * from admin");
             PreparedStatement pstmt = con.prepareStatement(q1);
            
             
           
             ResultSet rs= pstmt.executeQuery();
             if(rs.next())
             {
            	 String User = rs.getString("Aemail");
            	 String Name=rs.getString("Aname");
            
            	 session.setAttribute("AEmail1",User);
            	 session.setAttribute("AName1",Name);
            	
            	 dis=request.getRequestDispatcher("/adminProfile.jsp");
             	   dis.include(request, response);
             }
             else
             {
            	 out.println("<script>alert('Inavalid Email Id or Password !'); window.location.href='login.jsp';</script>");
             }
            
              con.close();
         }
	
         catch (Exception e)
         {
        	  e.printStackTrace();
        	  
        	 response.setContentType("text/html");
         	out.print("<h3 style='color:red'> "+e.getMessage()+"</h3>");
       	   dis=request.getRequestDispatcher("/login.jsp");
       	   dis.include(request, response);
           
         }


	}
}
