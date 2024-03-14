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
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Intro
 */

@WebServlet("/showusers")
public class RecieveUserid extends HttpServlet {

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
           
           if(session!=null )
        	   
           {
        	  
        	   
           String q1=("select * from users");
           PreparedStatement pstmt = con.prepareStatement(q1);
           
       
           ResultSet rs = pstmt.executeQuery();

           List<User> lst = new ArrayList<>();

           while(rs.next())
           {
        	   
        	   
               int id=rs.getInt(1);
               String usern=rs.getString("uname");
               String email=rs.getString("uemail");
           

               // Set blog information as request attributes
               session.setAttribute("Username", usern);
               session.setAttribute("Useremail",email);
               session.setAttribute("UserID",id);
                      
               User users = new User(id,usern,email);
               lst.add(users);
               session.setAttribute("userinfo",lst);
               
               
           }
        	   
             
           dis=request.getRequestDispatcher("/usersss.jsp");
       	  dis.forward(request, response); 
     	  
           }
           else
           {
        	   out.println("invalid session");
           }
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
