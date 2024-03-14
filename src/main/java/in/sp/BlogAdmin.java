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
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Intro
 */
@WebServlet("/AdminvBlog")

public class BlogAdmin extends HttpServlet {

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
        	  
        	   
           String q1=("SELECT * FROM blog");
           PreparedStatement pstmt = con.prepareStatement(q1);
           
       
           ResultSet rs = pstmt.executeQuery();

           List<BlogPost> blogPosts = new ArrayList<>();

           while(rs.next())
           {
        	   String blogTitle = rs.getString("title");
               String blogDescription = rs.getString("content");
               String date=rs.getString("createdAt");
               int newid=rs.getInt(1);
               Blob imageBlob = rs.getBlob("image");

               // Set blog information as request attributes
               session.setAttribute("blogTitle", blogTitle);
               session.setAttribute("blogDescription", blogDescription);
               session.setAttribute("Date",date);
               session.setAttribute("blogid",newid);
               
                      
               BlogPost blogPost = new BlogPost(blogTitle, blogDescription, date,newid, imageBlob);
               blogPosts.add(blogPost);
               session.setAttribute("blogPosts", blogPosts);
               out.print("id is "+newid);
               
           }
        	   
             
           
     	  dis=request.getRequestDispatcher("/BlogForAdmin.jsp");
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
     	   dis=request.getRequestDispatcher("/profile.jsp");
     	   dis.include(request, response);
         
       }
	}

}
