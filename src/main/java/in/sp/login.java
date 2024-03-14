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
@WebServlet("/Login")

public class login extends HttpServlet {

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

             String q1=("select * from users where uemail=? and upwd=?");
             PreparedStatement pstmt = con.prepareStatement(q1);
             pstmt.setString(1,uemail1);
             pstmt.setString(2, upass);
             
           
             ResultSet rs= pstmt.executeQuery();
             if(rs.next())
             {
            	 String User = rs.getString("uemail");
            	 int identity=rs.getInt(1);
            	 String username1=rs.getString("uname");
            
            	 session.setAttribute("UEmail",User);
            	 session.setAttribute("NAME",username1);
            	 session.setAttribute("userId",identity);
            	
            	 dis=request.getRequestDispatcher("/index.jsp");
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
