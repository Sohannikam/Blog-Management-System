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
@WebServlet("/comuser")
public class commentforuser extends HttpServlet {

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
            StringBuilder commentHtml = new StringBuilder();  // For building the HTML response

			while(rs.next())
			{
				String comm=rs.getString("comment_text");
				int blogid=rs.getInt(5);
				String email1=rs.getString("user_email");
				String date=rs.getString("comment_date");
				session.setAttribute("COM", comm);
				
				commentHtml.append("<li><strong>").append(email1).append(":</strong> ")
                .append(comm)
                .append("<br><small>").append(date).append("</small></li>");
				
				Vicomment vi = new Vicomment(comm,blogid,email1,date);
				commentsList.add(vi);
//				session.setAttribute("VIEW", commentsList);
				
			}
			if (!commentsList.isEmpty()) {
				  session.setAttribute("commentsList", commentsList);
	                // Return the HTML content
	                out.print(commentHtml.toString());
            } else {
            	out.print("<li>No comments found for this blog post.</li>");            }
			
		}
		catch(Exception e)
		{
			 e.printStackTrace();
	            out.print("<h3 style='color:red'> " + e.getMessage() + "</h3>");
		}
	}

	

}
