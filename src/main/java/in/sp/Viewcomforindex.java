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
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.sp.Vicomment;

/**
 * Servlet implementation class ViewComment
 */
@WebServlet("/comindex")
public class Viewcomforindex extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		RequestDispatcher dis=null;
		PrintWriter out=response.getWriter();
		try
		{
			//load driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//create connection
			String url= "jdbc:mysql://localhost:3306/newblog";
			String username="root";
			String password="Pass@123";
			Connection con=DriverManager.getConnection(url,username,password);
			
			
			//write query
			String q1="select * from comments where blogid=?";
			PreparedStatement pstmt= con.prepareStatement(q1);
			int blogId = Integer.parseInt(request.getParameter("blogId"));
			pstmt.setInt(1,blogId);
			
			ResultSet rs=pstmt.executeQuery();
			List<Vicomment> commentsList=new ArrayList<>();
			while(rs.next())
			{
				String comm=rs.getString("comment_text");
				int blogid=rs.getInt(5);
				String email1=rs.getString("user_email");
				String date=rs.getString("comment_date");
				session.setAttribute("COM", comm);
				Vicomment vi = new Vicomment(comm,blogid,email1,date);
				commentsList.add(vi);
				session.setAttribute("VIEW", commentsList);
				
			}
			if (!commentsList.isEmpty()) {
                session.setAttribute("commentsList", commentsList);
                String redirectURL = "index.jsp#blog" + blogId; // Add the anchor with the blog ID
                response.sendRedirect(redirectURL); // Use sendRedirect to retain the anchor
            } else {
                out.print("No comments found for the user.");
            }
			
			
		}
		catch(Exception e)
		{
		   e.printStackTrace();
		   out.print("<h3 style='color:red'> "+e.getMessage()+"</h3>");
     	   dis=request.getRequestDispatcher("/profile.jsp");
     	   dis.include(request, response);
		}
	}

	

}
