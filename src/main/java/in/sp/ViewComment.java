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
 * Servlet implementation class ViewComment
 */
@WebServlet("/point")
public class ViewComment extends HttpServlet {

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
			String q1="select * from comments";
			PreparedStatement pstmt= con.prepareStatement(q1);
			
			ResultSet rs=pstmt.executeQuery();
			List<Vicomment> commentsList=new ArrayList<>();
			while(rs.next())
			{
				String comm=rs.getString("comment_text");
				int blogid=rs.getInt(5);
				session.setAttribute("COM", comm);
				Vicomment vi = new Vicomment(comm,blogid);
				commentsList.add(vi);
				session.setAttribute("VIEW", commentsList);
				
			}
			if (!commentsList.isEmpty()) {
                session.setAttribute("commentsList", commentsList);
                dis = request.getRequestDispatcher("/blogPost.jsp");
                dis.forward(request, response);
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
