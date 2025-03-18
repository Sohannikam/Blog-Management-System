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
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/AddCommentServlet")
public class Comment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user ID to be deleted from the request
        int BlogId = Integer.parseInt(request.getParameter("blogId"));
        PrintWriter out= response.getWriter();
        HttpSession session= request.getSession();
        String email=(String)session.getAttribute("UEmail");
        String comment1=request.getParameter("comment");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	       String createDate = dateFormat.format(new Date());
	       
        if(BlogId!=0)
        {
        	 boolean AddComment = Addcomment(BlogId,email,comment1,createDate);

             // Redirect back to the manageUsers.jsp page after deletion
             if (AddComment) {
            	
                 out.println("<script>alert('Comment Added Successfully!'); window.location.href='index.jsp';</script>");
                
             } else {
                 // Handle deletion failure (display an error message or redirect to an error page)
                 response.getWriter().println("Blog deletion failed.");
             }
        }
        else
        {
        	System.out.println("not fine");
        }
        
        
       
    }


    // User deletion logic
    private boolean Addcomment (int BlogId,String email2,String comment2,String createDate2) {
        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            // Establish the database connection (replace with your database details)
        	//load the driver
			
			
			//creating connection
			String url="jdbc:mysql://localhost:3306/newblog";
			String username="root";
			String password="Pass@123";
			Connection con=DriverManager.getConnection(url,username,password);
			
			
			
			//create a query
			String q="insert into comments (user_email,comment_text,comment_date,blogid) values (?,?,?,?)";
			
			// get the preparedStatement object
			 pstmt=con.prepareStatement(q);
			
			
			//set the values to query
			pstmt.setString(1,email2);
			pstmt.setString(2,comment2);
			pstmt.setString(3,createDate2);
			pstmt.setInt(4, BlogId);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            // Return true if deletion is successful (at least one row affected)
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Exception is"+e);  
            // Handle database errors
            return false;
        } finally {
            // Close the resources
            try {
                if (pstmt != null) {
                   pstmt.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Exception is"+e);         
                }
        }
    }
 
    
}
