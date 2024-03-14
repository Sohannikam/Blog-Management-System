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
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteBlogPostServlet")
public class DeleteBlog extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user ID to be deleted from the request
        int BlogId = Integer.parseInt(request.getParameter("blogPostId"));
        PrintWriter out= response.getWriter();
        HttpSession session= request.getSession();
        if(BlogId!=0)
        {
        	 boolean userDeleted = deleteBlog(BlogId);

             // Redirect back to the manageUsers.jsp page after deletion
             if (userDeleted) {
            	
                 out.println("<script>alert('Blog Deleted Successfully!'); window.location.href='AdminIndex.jsp';</script>");
                
             } else {
                 // Handle deletion failure (display an error message or redirect to an error page)
                 response.getWriter().println("Blog deletion failed.");
             }
        }
        else
        {
        	System.out.println("not fine");
        }
        // Perform the user deletion logic
        
        
       
    }

    // User deletion logic
    private boolean deleteBlog(int BlogId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish the database connection (replace with your database details)
            String jdbcUrl = "jdbc:mysql://localhost:3306/newblog";
            String dbUser = "root";
            String dbPassword = "Pass@123";
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Define the SQL query to delete the user by ID
            String sql = "DELETE FROM blog WHERE blog_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, BlogId);

            // Execute the query
            int rowsAffected = preparedStatement.executeUpdate();

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
                if (preparedStatement != null) {
                    preparedStatement.close();
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
