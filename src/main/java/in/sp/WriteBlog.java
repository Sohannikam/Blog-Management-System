package in.sp;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class WriteBlog
 */
@WebServlet("/CreateBlogServlet10")
@MultipartConfig(maxFileSize = 16177215)
public class WriteBlog extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out= response.getWriter();
		 String Title1 = request.getParameter("title");
        String Content= request.getParameter("description");
        String Type= request.getParameter("category");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createDate = dateFormat.format(new Date());
        
        InputStream inputStream = null; // input stream of the upload file

        Part filePart = request.getPart("image");
        if (filePart != null) {
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
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
            String loggedInUsername = (String) session.getAttribute("UEmail");
            int idiom=(int) session.getAttribute("userId");

            String q1=("INSERT INTO blog(title,content,createdAt,Category,userid,image) VALUES (?,?,?,?,?,?)");
            PreparedStatement pstmt = con.prepareStatement(q1);
            pstmt.setString(1,Title1);
            pstmt.setString(2,Content);
            pstmt.setString(3,createDate);
            pstmt.setString(4,Type);
            pstmt.setInt(5,idiom);
            pstmt.setBlob(6, inputStream);
            
            int rowcount= pstmt.executeUpdate();
            if(rowcount>0)
            {
            	  
                  
            	out.println("<script>alert('Blog Created Succesfully'); window.location.href='index.jsp';</script>");
            	
          
         	  
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
